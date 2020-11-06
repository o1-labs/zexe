use algebra::{
    curves::AffineCurve,
    fields::{FftField, Field, PrimeField},
    FromBytes, One, ToBytes, UniformRand, VariableBaseMSM, Zero,
};

use commitment_dlog::{
    commitment::{b_poly_coefficients, CommitmentField, CommitmentCurve, PolyComm},
    srs::SRS,
};
use ff_fft::{
    DensePolynomial, EvaluationDomain, Evaluations, GeneralEvaluationDomain,
    Radix2EvaluationDomain as Domain,
};
use marlin_circuits::domains::EvaluationDomains;
use marlin_protocol_pairing::index::MatrixValues;
use rayon::prelude::*;
use sprs::{CsMat, CsVecView, CSR};
use std::io::{Read, Result as IoResult, Write, Error, ErrorKind};
use std::ffi::c_void;
use plonk_protocol_dlog::index::{
    Index as PlonkIndex, VerifierIndex as PlonkVerifierIndex,
    SRSValue as PlonkSRSValue
};
use plonk_circuits::{
    constraints::{zk_w, zk_polynomial, ConstraintSystem as PlonkConstraintSystem},
    domains::EvaluationDomains as PlonkEvaluationDomains,
};
use oracle::poseidon::ArithmeticSpongeParams;

#[repr(C)]
pub struct DetSqrtWitness<F> {
    pub c: *mut F,
    pub d: u64,
    pub square_root: *mut F,
    pub success: bool
}

#[repr(C)]
pub struct PointerPair<A, B> {
    pub a: *const A,
    pub b: *const B
}

// TODO: Not compatible with variable rounds
pub fn batch_dlog_accumulator_check<G: CommitmentCurve>(
    urs: &SRS<G>,
    comms: &Vec<G>,
    chals: &Vec<G::ScalarField>,
) -> bool {
    let k = comms.len();

    if k == 0 {
        assert_eq!(chals.len(), 0);
        return true;
    }

    let rounds = chals.len() / k;
    assert_eq!(chals.len() % rounds, 0);

    let rs = {
        let r = G::ScalarField::rand(&mut rand_core::OsRng);
        let mut rs = vec![G::ScalarField::one(); k];
        for i in 1..k {
            rs[i] = r * &rs[i - 1];
        }
        rs
    };

    let mut points = urs.g.clone();
    let n = points.len();
    points.extend(comms);

    let mut scalars = vec![G::ScalarField::zero(); n];
    scalars.extend(&rs[..]);

    let chal_invs = {
        let mut cs = chals.clone();
        algebra::fields::batch_inversion(&mut cs);
        cs
    };

    let termss: Vec<_> = chals
        .par_iter()
        .zip(chal_invs)
        .chunks(rounds)
        .zip(rs)
        .map(|(chunk, r)| {
            let chals: Vec<_> = chunk.iter().map(|(c, _)| **c).collect();
            let mut s = b_poly_coefficients(&chals);
            s.iter_mut().for_each(|c| *c *= &r);
            s
        })
        .collect();

    for terms in termss {
        assert_eq!(terms.len(), n);
        for i in 0..n {
            scalars[i] -= &terms[i];
        }
    }

    let scalars: Vec<_> = scalars.iter().map(|x| x.into_repr()).collect();
    VariableBaseMSM::multi_scalar_mul(&points, &scalars) == G::Projective::zero()
}

pub fn evals_from_coeffs<F: FftField>(
    v: Vec<F>,
    d: Domain<F>,
) -> Evaluations<F, GeneralEvaluationDomain<F>> {
    Evaluations::<F>::from_vec_and_domain(v, GeneralEvaluationDomain::Radix2(d))
}

pub fn ceil_pow2(x: usize) -> usize {
    let mut res = 1;
    while x > res {
        res *= 2;
    }
    res
}

pub fn write_vec<A: ToBytes, W: Write>(v: &Vec<A>, mut writer: W) -> IoResult<()> {
    u64::write(&(v.len() as u64), &mut writer)?;
    for x in v {
        x.write(&mut writer)?;
    }
    Ok(())
}

pub fn read_vec<A: FromBytes, R: Read>(mut reader: R) -> IoResult<Vec<A>> {
    let mut v = vec![];
    let n = u64::read(&mut reader)? as usize;
    for _ in 0..n {
        v.push(A::read(&mut reader)?);
    }
    Ok(v)
}

pub fn write_cs_mat<A: ToBytes + Clone, W: Write>(m: &CsMat<A>, mut w: W) -> IoResult<()> {
    fn v(s: &[usize]) -> Vec<u64> {
        s.iter().map(|x| *x as u64).collect()
    }

    let (a, b) = m.shape();
    u64::write(&(a as u64), &mut w)?;
    u64::write(&(b as u64), &mut w)?;

    write_vec::<u64, _>(&v(m.indptr()), &mut w)?;
    write_vec(&v(m.indices()), &mut w)?;
    write_vec(&m.data().to_vec(), &mut w)?;
    Ok(())
}

pub fn read_cs_mat<A: FromBytes + Copy, R: Read>(mut r: R) -> IoResult<CsMat<A>> {
    fn v(s: Vec<u64>) -> Vec<usize> {
        s.iter().map(|x| *x as usize).collect()
    }

    let a = u64::read(&mut r)? as usize;
    let b = u64::read(&mut r)? as usize;
    let shape = (a, b);

    let indptr = v(read_vec(&mut r)?);
    let indices = v(read_vec(&mut r)?);
    let data: Vec<A> = read_vec(&mut r)?;
    Ok(CsMat::new(shape, indptr, indices, data))
}

pub fn write_matrix_values<A: ToBytes, W: Write>(m: &MatrixValues<A>, mut w: W) -> IoResult<()> {
    A::write(&m.row, &mut w)?;
    A::write(&m.col, &mut w)?;
    A::write(&m.val, &mut w)?;
    A::write(&m.rc, &mut w)?;
    Ok(())
}

pub fn read_matrix_values<A: FromBytes, R: Read>(mut r: R) -> IoResult<MatrixValues<A>> {
    let row = A::read(&mut r)?;
    let col = A::read(&mut r)?;
    let val = A::read(&mut r)?;
    let rc = A::read(&mut r)?;
    Ok(MatrixValues { row, col, val, rc })
}

pub fn write_option<A: ToBytes, W: Write>(a: &Option<A>, mut w: W) -> IoResult<()> {
    match a {
        None => u8::write(&0, &mut w),
        Some(a) => {
            u8::write(&1, &mut w)?;
            A::write(a, &mut w)
        }
    }
}

pub fn read_option<A: FromBytes, R: Read>(mut r: R) -> IoResult<Option<A>> {
    match u8::read(&mut r)? {
        0 => Ok(None),
        1 => Ok(Some(A::read(&mut r)?)),
        _ => panic!("read_option: expected 0 or 1"),
    }
}

pub fn write_poly_comm<A: ToBytes + AffineCurve, W: Write>(
    p: &PolyComm<A>,
    mut w: W,
) -> IoResult<()> {
    write_vec(&p.unshifted, &mut w)?;
    write_option(&p.shifted, &mut w)
}

pub fn read_poly_comm<A: FromBytes + AffineCurve, R: Read>(mut r: R) -> IoResult<PolyComm<A>> {
    let unshifted = read_vec(&mut r)?;
    let shifted = read_option(&mut r)?;
    Ok(PolyComm { unshifted, shifted })
}

pub fn write_dlog_matrix_values<A: ToBytes + AffineCurve, W: Write>(
    m: &marlin_protocol_dlog::index::MatrixValues<A>,
    mut w: W,
) -> IoResult<()> {
    write_poly_comm(&m.row, &mut w)?;
    write_poly_comm(&m.col, &mut w)?;
    write_poly_comm(&m.val, &mut w)?;
    write_poly_comm(&m.rc, &mut w)?;
    Ok(())
}

pub fn read_dlog_matrix_values<A: FromBytes + AffineCurve, R: Read>(
    mut r: R,
) -> IoResult<marlin_protocol_dlog::index::MatrixValues<A>> {
    let row = read_poly_comm(&mut r)?;
    let col = read_poly_comm(&mut r)?;
    let val = read_poly_comm(&mut r)?;
    let rc = read_poly_comm(&mut r)?;
    Ok(marlin_protocol_dlog::index::MatrixValues { row, col, val, rc })
}

pub fn write_dense_polynomial<A: ToBytes + Field, W: Write>(
    p: &DensePolynomial<A>,
    w: W,
) -> IoResult<()> {
    write_vec(&p.coeffs, w)
}

pub fn read_dense_polynomial<A: ToBytes + Field, R: Read>(r: R) -> IoResult<DensePolynomial<A>> {
    let coeffs = read_vec(r)?;
    Ok(DensePolynomial { coeffs })
}

pub fn write_domain<A: ToBytes + PrimeField, W: Write>(d: &Domain<A>, mut w: W) -> IoResult<()> {
    (d.size as u64).write(&mut w)?;
    Ok(())
}

pub fn read_domain<A: ToBytes + PrimeField, R: Read>(mut r: R) -> IoResult<Domain<A>> {
    let size = u64::read(&mut r)?;
    match Domain::new(size as usize) {
        Some(d) => Ok(d),
        None => Err(Error::new(ErrorKind::Other, format!("Invalid domain size {}", size)))
    }
}

pub fn write_evaluations<A: ToBytes + PrimeField, W: Write>(
    e: &Evaluations<A>,
    mut w: W,
) -> IoResult<()> {
    write_vec(&e.evals, &mut w)?;
    Ok(())
}

pub fn read_evaluations<A: ToBytes + PrimeField, R: Read>(mut r: R) -> IoResult<Evaluations<A>> {
    let evals = read_vec(&mut r)?;
    let domain = Domain::new(evals.len()).unwrap();
    assert_eq!(evals.len(), domain.size());
    Ok(evals_from_coeffs(evals, domain))
}

pub fn write_plonk_evaluations<A: ToBytes + PrimeField, W: Write>(
    e: &Evaluations<A, Domain<A>>,
    mut w: W,
) -> IoResult<()> {
    write_vec(&e.evals, &mut w)?;
    Ok(())
}

pub fn read_plonk_evaluations<F: ToBytes + PrimeField, R: Read>(mut r: R) -> IoResult<Evaluations<F, Domain<F>>> {
    let evals = read_vec(&mut r)?;
    let domain = Domain::new(evals.len()).unwrap();
    assert_eq!(evals.len(), domain.size());
    Ok(Evaluations::<F, Domain<F>>::from_vec_and_domain(evals, domain))
}

pub fn write_evaluation_domains<A: PrimeField, W: Write>(
    d: &EvaluationDomains<A>,
    mut w: W,
) -> IoResult<()> {
    u64::write(&(d.h.size() as u64), &mut w)?;
    u64::write(&(d.k.size() as u64), &mut w)?;
    u64::write(&(d.b.size() as u64), &mut w)?;
    u64::write(&(d.x.size() as u64), &mut w)?;
    Ok(())
}

pub fn read_evaluation_domains<A: PrimeField, R: Read>(mut r: R) -> IoResult<EvaluationDomains<A>> {
    let h = EvaluationDomain::new(u64::read(&mut r)? as usize).unwrap();
    let k = EvaluationDomain::new(u64::read(&mut r)? as usize).unwrap();
    let b = EvaluationDomain::new(u64::read(&mut r)? as usize).unwrap();
    let x = EvaluationDomain::new(u64::read(&mut r)? as usize).unwrap();
    Ok(EvaluationDomains { h, k, b, x })
}

pub fn write_plonk_index<'a, G: CommitmentCurve, W: Write>(
    k: *const PlonkIndex<'a, G>,
    mut w: W) -> IoResult<()> 
where G::ScalarField : CommitmentField + ToBytes
{
    let k = unsafe { &(*k) };
    write_plonk_constraint_system::<G, &mut W>(&k.cs, &mut w)?;
    (k.max_poly_size as u64).write(&mut w)?;
    (k.max_quot_size as u64).write(&mut w)?;
    Ok(())
}

pub fn read_plonk_index<'a, G: CommitmentCurve, R: Read>(
    fr_sponge_params:ArithmeticSpongeParams<G::ScalarField>,
    fq_sponge_params:ArithmeticSpongeParams<G::BaseField>,
    srs: *const SRS<G>,
    mut r: R) -> IoResult<PlonkIndex<'a, G>> 
where G::ScalarField : CommitmentField + FromBytes
{
    let cs = read_plonk_constraint_system::<G, &mut R>(fr_sponge_params, &mut r)?;
    let max_poly_size = u64::read(&mut r)? as usize;
    let max_quot_size = u64::read(&mut r)? as usize;

    let srs = PlonkSRSValue::Ref(unsafe { &(*srs) });
    Ok(PlonkIndex {
        cs,
        srs,
        max_poly_size,
        max_quot_size,
        fq_sponge_params
    })
}

fn print_comm<G: CommitmentCurve>(s : &str, g: &PolyComm<G>) {
    for (i, t) in g.unshifted.iter().enumerate() {
        let (x, y) = t.to_coordinates().unwrap();
        println!("{}.unshifted[{}] = {}, {}", s, i, x, y);
    }
    match g.shifted {
        None => (),
        Some(s) => {
            let (x, y) = s.to_coordinates().unwrap();
            println!("{}.shifted = {}, {}", s, x, y);
        }
    }
}

pub fn print_plonk_verifier_index<'a, G: CommitmentCurve>(
    vk: & PlonkVerifierIndex<'a, G>) {

    println!("domain {}", vk.domain.size);
    println!("max_poly_size {}", vk.max_poly_size);
    println!("max_quot_size {}", vk.max_quot_size);

    print_comm("s0", &vk.sigma_comm[0]);
    print_comm("s1", &vk.sigma_comm[1]);
    print_comm("s2", &vk.sigma_comm[2]);

    print_comm("ql_comm", &vk.ql_comm);
    print_comm("qr_comm", &vk.qr_comm);
    print_comm("qo_comm", &vk.qo_comm);
    print_comm("qm_comm", &vk.qm_comm);
    print_comm("qc_comm", &vk.qc_comm);

    print_comm("rcm_comm[0] ", &vk.rcm_comm[0]);
    print_comm("rcm_comm[1] ", &vk.rcm_comm[1]);
    print_comm("rcm_comm[2] ", &vk.rcm_comm[2]);

    print_comm("psm_comm ", &vk.psm_comm);
    print_comm("add_comm ", &vk.add_comm);
    print_comm("mul1_comm ", &vk.mul1_comm);
    print_comm("mul2_comm ", &vk.mul2_comm);
    print_comm("emul1_comm ", &vk.emul1_comm);
    print_comm("emul2_comm ", &vk.emul2_comm);
    print_comm("emul3_comm ", &vk.emul3_comm);

    println!("r {}", vk.r);
    println!("o {}", vk.o);
}

pub fn write_plonk_verifier_index<'a, G: CommitmentCurve, W: Write>(
    vk: *const PlonkVerifierIndex<'a, G>,
    mut w: W) -> IoResult<()> 
where G::ScalarField : CommitmentField + ToBytes
{
    let vk = unsafe { &(*vk) };
    write_domain(&vk.domain, &mut w)?;
    u64::write(&(vk.max_poly_size as u64), &mut w)?;
    u64::write(&(vk.max_quot_size as u64), &mut w)?;

    {
        write_poly_comm(&vk.sigma_comm[0], &mut w)?;
        write_poly_comm(&vk.sigma_comm[1], &mut w)?;
        write_poly_comm(&vk.sigma_comm[2], &mut w)?;
    };
    write_poly_comm(&vk.ql_comm, &mut w)?;
    write_poly_comm(&vk.qr_comm, &mut w)?;
    write_poly_comm(&vk.qo_comm, &mut w)?;
    write_poly_comm(&vk.qm_comm, &mut w)?;
    write_poly_comm(&vk.qc_comm, &mut w)?;
    {
        write_poly_comm(&vk.rcm_comm[0], &mut w)?;
        write_poly_comm(&vk.rcm_comm[1], &mut w)?;
        write_poly_comm(&vk.rcm_comm[2], &mut w)?;
    };
    write_poly_comm(&vk.psm_comm, &mut w)?;
    write_poly_comm(&vk.add_comm, &mut w)?;
    write_poly_comm(&vk.mul1_comm, &mut w)?;
    write_poly_comm(&vk.mul2_comm, &mut w)?;
    write_poly_comm(&vk.emul1_comm, &mut w)?;
    write_poly_comm(&vk.emul2_comm, &mut w)?;
    write_poly_comm(&vk.emul3_comm, &mut w)?;

    G::ScalarField::write(&vk.r, &mut w)?;
    G::ScalarField::write(&vk.o, &mut w)?;

    Ok(())
}

pub fn read_plonk_verifier_index<'a, G: CommitmentCurve, R: Read>(
    fr_sponge_params:ArithmeticSpongeParams<G::ScalarField>,
    fq_sponge_params:ArithmeticSpongeParams<G::BaseField>,
    endo : G::ScalarField,
    srs: *const SRS<G>,
    mut r: R) -> IoResult<PlonkVerifierIndex<'a, G>> 
where G::ScalarField : CommitmentField + FromBytes
{
    let domain = read_domain(&mut r)?;
    let max_poly_size = u64::read(&mut r)? as usize;
    let max_quot_size = u64::read(&mut r)? as usize;

    let sigma_comm =  {
        let s0 = read_poly_comm(&mut r)?;
        let s1 = read_poly_comm(&mut r)?;
        let s2 = read_poly_comm(&mut r)?;
        [ s0, s1, s2 ]
    };
    let ql_comm =    read_poly_comm(&mut r)?;
    let qr_comm =    read_poly_comm(&mut r)?;
    let qo_comm =    read_poly_comm(&mut r)?;
    let qm_comm =    read_poly_comm(&mut r)?;
    let qc_comm =    read_poly_comm(&mut r)?;
    let rcm_comm =  {
        let s0 = read_poly_comm(&mut r)?;
        let s1 = read_poly_comm(&mut r)?;
        let s2 = read_poly_comm(&mut r)?;
        [ s0, s1, s2 ]
    };
    let psm_comm =   read_poly_comm(&mut r)?;
    let add_comm =   read_poly_comm(&mut r)?;
    let mul1_comm =  read_poly_comm(&mut r)?;
    let mul2_comm =  read_poly_comm(&mut r)?;
    let emul1_comm = read_poly_comm(&mut r)?;
    let emul2_comm = read_poly_comm(&mut r)?;
    let emul3_comm = read_poly_comm(&mut r)?;

    let r_value = G::ScalarField::read(&mut r)?;
    let o = G::ScalarField::read(&mut r)?;
    let srs = PlonkSRSValue::Ref(unsafe { &(*srs) });
    let vk = PlonkVerifierIndex {
        domain,
        w: zk_w(domain),
        zkpm: zk_polynomial(domain),
        max_poly_size,
        max_quot_size,
        srs,
        sigma_comm,
        ql_comm,
        qr_comm,
        qo_comm,
        qm_comm,
        qc_comm,
        rcm_comm,
        psm_comm,
        add_comm,
        mul1_comm,
        mul2_comm,
        emul1_comm,
        emul2_comm,
        emul3_comm,
        r: r_value,
        o,
        fr_sponge_params,
        fq_sponge_params,
        endo,
    };
    Ok(vk)
}

pub fn write_plonk_constraint_system<G: CommitmentCurve, W: Write>(
    c: &PlonkConstraintSystem<G::ScalarField>,
    mut w: W) -> IoResult<()> 
where G::ScalarField : CommitmentField + FromBytes {
    (c.public as u64).write(&mut w)?;
    {
        let PlonkEvaluationDomains { d1, d4, d8 } = c.domain;
        write_domain(&d1, &mut w)?;
        write_domain(&d4, &mut w)?;
        write_domain(&d8, &mut w)?;
    };

    write_vec(&c.gates, &mut w)?;

    write_dense_polynomial(&c.sigmam[0], &mut w)?;
    write_dense_polynomial(&c.sigmam[1], &mut w)?;
    write_dense_polynomial(&c.sigmam[2], &mut w)?;

    write_dense_polynomial(&c.qlm, &mut w)?;
    write_dense_polynomial(&c.qrm, &mut w)?;
    write_dense_polynomial(&c.qom, &mut w)?;
    write_dense_polynomial(&c.qmm, &mut w)?;
    write_dense_polynomial(&c.qc , &mut w)?;

    write_dense_polynomial(&c.rcm[0], &mut w)?;
    write_dense_polynomial(&c.rcm[1], &mut w)?;
    write_dense_polynomial(&c.rcm[2], &mut w)?;

    write_dense_polynomial(&c.psm, &mut w)?;
    write_dense_polynomial(&c.addm, &mut w)?;
    write_dense_polynomial(&c.mul1m, &mut w)?;
    write_dense_polynomial(&c.mul2m, &mut w)?;
    write_dense_polynomial(&c.emul1m, &mut w)?;
    write_dense_polynomial(&c.emul2m, &mut w)?;
    write_dense_polynomial(&c.emul3m, &mut w)?;

    write_plonk_evaluations(&c.qll, &mut w)?;
    write_plonk_evaluations(&c.qrl, &mut w)?;
    write_plonk_evaluations(&c.qol, &mut w)?;
    write_plonk_evaluations(&c.qml, &mut w)?;

    write_vec(&c.sigmal1[0], &mut w)?;
    write_vec(&c.sigmal1[1], &mut w)?;
    write_vec(&c.sigmal1[2], &mut w)?;

    write_plonk_evaluations(&c.sigmal4[0], &mut w)?;
    write_plonk_evaluations(&c.sigmal4[1], &mut w)?;
    write_plonk_evaluations(&c.sigmal4[2], &mut w)?;

    write_vec(&c.sid, &mut w)?;

    write_plonk_evaluations(&c.ps4, &mut w)?;
    write_plonk_evaluations(&c.ps8, &mut w)?;
    write_plonk_evaluations(&c.addl4, &mut w)?;
    write_plonk_evaluations(&c.mul1l, &mut w)?;
    write_plonk_evaluations(&c.mul2l, &mut w)?;
    write_plonk_evaluations(&c.emul1l, &mut w)?;
    write_plonk_evaluations(&c.emul2l, &mut w)?;
    write_plonk_evaluations(&c.emul3l, &mut w)?;
    write_plonk_evaluations(&c.l04, &mut w)?;
    write_plonk_evaluations(&c.l08, &mut w)?;
    write_plonk_evaluations(&c.l1, &mut w)?;

    c.r.write(&mut w)?;
    c.o.write(&mut w)?;
    c.endo.write(&mut w)?;

    Ok(())
}

pub fn read_plonk_constraint_system<G: CommitmentCurve, R: Read>(
    fr_sponge_params:ArithmeticSpongeParams<G::ScalarField>,
    mut r: R) -> IoResult<PlonkConstraintSystem<G::ScalarField>> 
where G::ScalarField : CommitmentField + FromBytes
{
    let public = u64::read(&mut r)? as usize;
    let domain = {
        let d1 = read_domain(&mut r)?;
        let d4 = read_domain(&mut r)?;
        let d8 = read_domain(&mut r)?;
        PlonkEvaluationDomains { d1, d4, d8 }
    };

    let gates = read_vec(&mut r)?;

    let sigmam = {
        let s0 = read_dense_polynomial(&mut r)?;
        let s1 = read_dense_polynomial(&mut r)?;
        let s2 = read_dense_polynomial(&mut r)?;
        [ s0, s1, s2 ]
    };

    let qlm = read_dense_polynomial(&mut r)?;
    let qrm = read_dense_polynomial(&mut r)?;
    let qom = read_dense_polynomial(&mut r)?;
    let qmm = read_dense_polynomial(&mut r)?;
    let qc = read_dense_polynomial(&mut r)?;

    let rcm = {
        let s0 = read_dense_polynomial(&mut r)?;
        let s1 = read_dense_polynomial(&mut r)?;
        let s2 = read_dense_polynomial(&mut r)?;
        [ s0, s1, s2 ]
    };

    let psm = read_dense_polynomial(&mut r)?;
    let addm = read_dense_polynomial(&mut r)?;
    let mul1m = read_dense_polynomial(&mut r)?;
    let mul2m = read_dense_polynomial(&mut r)?;
    let emul1m = read_dense_polynomial(&mut r)?;
    let emul2m = read_dense_polynomial(&mut r)?;
    let emul3m = read_dense_polynomial(&mut r)?;

    let qll = read_plonk_evaluations(&mut r)?;
    let qrl = read_plonk_evaluations(&mut r)?;
    let qol = read_plonk_evaluations(&mut r)?;
    let qml = read_plonk_evaluations(&mut r)?;

    let sigmal1 = {
        let s0 = read_vec(&mut r)?;
        let s1 = read_vec(&mut r)?;
        let s2 = read_vec(&mut r)?;
        [ s0, s1, s2, ]
    };

    let sigmal4 = {
        let s0 = read_plonk_evaluations(&mut r)?;
        let s1 = read_plonk_evaluations(&mut r)?;
        let s2 = read_plonk_evaluations(&mut r)?;
        [ s0, s1, s2, ]
    };

    let sid = read_vec(&mut r)?;

    let ps4 = read_plonk_evaluations(&mut r)?;
    let ps8 = read_plonk_evaluations(&mut r)?;

    let addl4 = read_plonk_evaluations(&mut r)?;
    let mul1l = read_plonk_evaluations(&mut r)?;
    let mul2l = read_plonk_evaluations(&mut r)?;
    let emul1l = read_plonk_evaluations(&mut r)?;
    let emul2l = read_plonk_evaluations(&mut r)?;
    let emul3l = read_plonk_evaluations(&mut r)?;

    let l04 = read_plonk_evaluations(&mut r)?;
    let l08 = read_plonk_evaluations(&mut r)?;
    let l1 = read_plonk_evaluations(&mut r)?;

    let r_value = G::ScalarField::read(&mut r)?;
    let o = G::ScalarField::read(&mut r)?;
    let endo = G::ScalarField::read(&mut r)?;

    let zkpm = zk_polynomial(domain.d1);
    let zkpl = zkpm.evaluate_over_domain_by_ref(domain.d8);
    Ok(PlonkConstraintSystem {
        zkpm: zk_polynomial(domain.d1),
        zkpl,
        public,
        domain,
        gates,
        sigmam,
        qlm,
        qrm,
        qom,
        qmm,
        qc,
        rcm,
        psm,
        addm,
        mul1m,
        mul2m,
        emul1m,
        emul2m,
        emul3m,
        qll,
        qrl,
        qol,
        qml,
        sigmal1,
        sigmal4,
        sid,
        ps4,
        ps8,
        addl4,
        mul1l,
        mul2l,
        emul1l,
        emul2l,
        emul3l,
        l04,
        l08,
        l1,
        r:r_value,
        o,
        endo,
        fr_sponge_params,
    })
}

pub fn witness_position_to_index(public_inputs: usize, h_to_x_ratio: usize, w: usize) -> usize {
    if w % h_to_x_ratio == 0 {
        w / h_to_x_ratio
    } else {
        let m = h_to_x_ratio - 1;

        // w - 1 = h_to_x_ratio * (aux_index / m) + (aux_index % m)
        let aux_index_mod_m = (w - 1) % h_to_x_ratio;
        let aux_index_over_m = ((w - 1) - aux_index_mod_m) / h_to_x_ratio;
        let aux_index = aux_index_mod_m + m * aux_index_over_m;
        aux_index + public_inputs
    }
}

pub fn index_to_witness_position(public_inputs: usize, h_to_x_ratio: usize, i: usize) -> usize {
    let res = if i < public_inputs {
        i * h_to_x_ratio
    } else {
        // x_0 y_0 y_1     ... y_{k-2}
        // x_1 y_{k-1} y_{k} ... y_{2k-3}
        // x_2 y_{2k-2} ... y_{3k-4}
        // ...
        //
        // let m := k - 1
        // x_0 y_0 y_1     ... y_{m - 1}
        // x_1 y_{m} y_{m+1} ... y_{2m - 1}
        // x_2 y_{2 m} y_{2m+1} ... y_{3m - 1}
        // ...
        let m = h_to_x_ratio - 1;
        let aux_index = i - public_inputs;
        let block = aux_index / m;
        let intra_block = aux_index % m;
        h_to_x_ratio * block + 1 + intra_block
    };
    assert_eq!(
        witness_position_to_index(public_inputs, h_to_x_ratio, res),
        i
    );
    res
}

pub fn rows_to_csmat<F: Clone + Copy + std::fmt::Debug>(
    public_inputs: usize,
    h_group_size: usize,
    h_to_x_ratio: usize,
    v: &Vec<(Vec<usize>, Vec<F>)>,
) -> CsMat<F> {
    let mut m = CsMat::empty(CSR, /* number of columns */ h_group_size);
    m.reserve_outer_dim(h_group_size);

    for (indices, coefficients) in v.iter() {
        let mut shifted: Vec<(usize, F)> = indices
            .iter()
            .map(|&i| index_to_witness_position(public_inputs, h_to_x_ratio, i))
            .zip(coefficients)
            .map(|(i, &x)| (i, x))
            .collect();

        shifted.sort_by(|(i, _), (j, _)| i.cmp(j));

        let shifted_indices: Vec<usize> = shifted.iter().map(|(i, _)| *i).collect();
        let shifted_coefficients: Vec<F> = shifted.iter().map(|(_, x)| *x).collect();

        match CsVecView::<F>::new_view(h_group_size, &shifted_indices, &shifted_coefficients) {
            Ok(r) => m = m.append_outer_csvec(r),
            Err(e) => panic!(
                "new_view failed {} ({:?}, {:?})",
                e, shifted_indices, shifted_coefficients
            ),
        };
    }

    for _ in 0..(h_group_size - v.len()) {
        match CsVecView::<F>::new_view(h_group_size, &vec![], &vec![]) {
            Ok(v) => m = m.append_outer_csvec(v),
            Err(e) => panic!("new_view failed {}", e),
        };
    }

    m
}

pub fn prepare_witness<F: PrimeField>(
    domains: EvaluationDomains<F>,
    primary_input: &Vec<F>,
    auxiliary_input: &Vec<F>,
) -> Vec<F> {
    let mut witness = vec![F::zero(); domains.h.size()];
    let ratio = domains.h.size() / domains.x.size();

    witness[0] = F::one();
    for (i, x) in primary_input.iter().enumerate() {
        let i = 1 + i;
        witness[i * ratio] = *x;
    }

    let m = ratio - 1;

    for (i, w) in auxiliary_input.iter().enumerate() {
        let block = i / m;
        let intra_block = i % m;
        witness[ratio * block + 1 + intra_block] = w.clone();
    }

    witness
}

pub fn prepare_plonk_witness<F: PrimeField>(
    primary_input: &Vec<F>,
    auxiliary_input: &Vec<F>,
) -> Vec<F> {
    // TODO: Check that this is correct.
    let mut witness: Vec<F> = Vec::with_capacity(primary_input.len() + auxiliary_input.len() + 1);

    witness.push(F::one());
    witness.extend_from_slice(primary_input.as_slice());
    witness.extend_from_slice(auxiliary_input.as_slice());

    witness
}

// NOTE: We always 'box' these values as pointers, since the FFI doesn't know
// the size of the target type, and annotating them with (void *) on the other
// side of the FFI would cause only the first 64 bits to be copied.

// usize vector stubs
#[no_mangle]
pub extern "C" fn zexe_usize_vector_create() -> *mut Vec<usize> {
    return Box::into_raw(Box::new(Vec::new()));
}

#[no_mangle]
pub extern "C" fn zexe_usize_vector_length(v: *const Vec<usize>) -> i32 {
    let v_ = unsafe { &(*v) };
    return v_.len() as i32;
}

#[no_mangle]
pub extern "C" fn zexe_usize_vector_emplace_back(v: *mut Vec<usize>, x: usize) {
    let v_ = unsafe { &mut (*v) };
    v_.push(x);
}

#[no_mangle]
pub extern "C" fn zexe_usize_vector_get(v: *mut Vec<usize>, i: u32) -> usize {
    let v = unsafe { &mut (*v) };
    v[i as usize]
}

#[no_mangle]
pub extern "C" fn zexe_usize_vector_delete(v: *mut Vec<usize>) {
    // Deallocation happens automatically when a box variable goes out of
    // scope.
    let _box = unsafe { Box::from_raw(v) };
}

// pointer vector stubs
#[no_mangle]
pub extern "C" fn zexe_pointer_vector_create<'a>(
) -> *const Vec<*const c_void> {
    return Box::into_raw(Box::new(Vec::new()));
}

#[no_mangle]
pub extern "C" fn zexe_pointer_vector_length(
    v: *const Vec<*const c_void>,
) -> i32 {
    let v_ = unsafe { &(*v) };
    return v_.len() as i32;
}

#[no_mangle]
pub extern "C" fn zexe_pointer_vector_emplace_back<'a>(
    v: *mut Vec<*const c_void>,
    x: *const c_void,
) {
    let v_ = unsafe { &mut (*v) };
    v_.push(x);
}

#[no_mangle]
pub extern "C" fn zexe_pointer_vector_get<'a>(
    v: *mut Vec<*const c_void>,
    i: u32,
) -> *const c_void {
    let v_ = unsafe { &mut (*v) };
    return v_[i as usize];
}

#[no_mangle]
pub extern "C" fn zexe_pointer_vector_delete(
    v: *mut Vec<*const c_void>,
) {
    // Deallocation happens automatically when a box variable goes out of
    // scope.
    let _box = unsafe { Box::from_raw(v) };
}

