use crate::{
    AffineCurve, ProjectiveCurve, BigInteger, Field, FpParameters, PrimeField,
};
use rayon::prelude::*;

pub struct VariableBaseMSM;

impl VariableBaseMSM {

    pub fn multi_scalar_mul_affine<G: AffineCurve>(
        bases: &[G],
        scalars: &[<G::ScalarField as PrimeField>::BigInt],
    ) -> G::Projective {
        let c = if scalars.len() < 32 {
            3
        } else {
            ((f64::from(scalars.len() as u32)).log2() / 3.0 + 1.0).floor() as usize
        };
        let cc = 1 << c;

        let num_bits =
            <G::ScalarField as PrimeField>::Params::MODULUS_BITS as usize;
        let fr_one = G::ScalarField::one().into_repr();

        let zero = G::zero().into_projective();
        let mut buckets = vec![Vec::<G>::with_capacity(bases.len()/cc); cc];

        let window_starts: Vec<_> = (0..num_bits).step_by(c).collect();
        // Each window is of size `c`.
        // We divide up the bits 0..num_bits into windows of size `c`, and
        // in parallel process each such window.

        let window_sums: Vec<_> = window_starts
            .into_iter()
            .map(|w_start| {
                scalars.iter().zip(bases).filter(|(s, _)| !s.is_zero()).for_each(|(&scalar, base)|  {
                                        
                    if scalar == fr_one {
                        // We only process unit scalars once in the first window.
                        if w_start == 0 {
                            buckets[cc-1].push(*base);
                        }
                    } else {
                        let mut scalar = scalar;

                        // We right-shift by w_start, thus getting rid of the
                        // lower bits.
                        scalar.divn(w_start as u32);

                        // We mod the remaining bits by the window size.
                        let scalar = scalar.as_ref()[0] % (1 << c);

                        // If the scalar is non-zero, we update the corresponding
                        // bucket.
                        // (Recall that `buckets` doesn't have a zero bucket.)
                        if scalar != 0 {
                            buckets[(scalar - 1) as usize].push(*base);
                        }
                    }
                });
                let mut bucketsums = buckets.par_iter_mut().map(|mut b| G::add_batch(&mut b)).collect::<Vec<_>>();
                let mut res = bucketsums.remove(cc-1).into_projective();
 
                let mut running_sum = G::Projective::zero();
                for b in bucketsums.iter().rev() {
                    running_sum.add_assign_mixed(b);
                    res += &running_sum;
                }
                res
            })
            .collect();

        // We store the sum for the lowest window.
        let lowest = window_sums.first().unwrap();

        // We're traversing windows from high to low.
        window_sums[1..].iter().rev().fold(zero, |mut total, sum_i| {
            total += sum_i;
            for _ in 0..c {
                total.double_in_place();
            }
            total
        }) + lowest
    }

    pub fn multi_scalar_mul<G: AffineCurve>(
        bases: &[G],
        scalars: &[<G::ScalarField as PrimeField>::BigInt],
    ) -> G::Projective {
        let c = if scalars.len() < 32 {
            3
        } else {
            (2.0 / 3.0 * (f64::from(scalars.len() as u32)).log2() + 2.0).ceil() as usize
        };

        let num_bits =
            <G::ScalarField as PrimeField>::Params::MODULUS_BITS as usize;
        let fr_one = G::ScalarField::one().into_repr();

        let zero = G::zero().into_projective();
        let window_starts: Vec<_> = (0..num_bits).step_by(c).collect();

        // Each window is of size `c`.
        // We divide up the bits 0..num_bits into windows of size `c`, and
        // in parallel process each such window.
        let window_sums: Vec<_> = window_starts
            .into_par_iter()
            .map(|w_start| {
                let mut res = zero;
                // We don't need the "zero" bucket, so we only have 2^c - 1 buckets
                let mut buckets = vec![zero; (1 << c) - 1];
                scalars.iter().zip(bases).filter(|(s, _)| !s.is_zero()).for_each(|(&scalar, base)|  {
                    if scalar == fr_one {
                        // We only process unit scalars once in the first window.
                        if w_start == 0 {
                            res.add_assign_mixed(base);
                        }
                    } else {
                        let mut scalar = scalar;

                        // We right-shift by w_start, thus getting rid of the
                        // lower bits.
                        scalar.divn(w_start as u32);

                        // We mod the remaining bits by the window size.
                        let scalar = scalar.as_ref()[0] % (1 << c);

                        // If the scalar is non-zero, we update the corresponding
                        // bucket.
                        // (Recall that `buckets` doesn't have a zero bucket.)
                        if scalar != 0 {
                            buckets[(scalar - 1) as usize].add_assign_mixed(&base);
                        }
                    }
                });
                G::Projective::batch_normalization(&mut buckets);

                let mut running_sum = G::Projective::zero();
                for b in buckets.into_iter().map(|g| g.into_affine()).rev() {
                    running_sum.add_assign_mixed(&b);
                    res += &running_sum;
                }
                res
            })
            .collect();
        
        // We store the sum for the lowest window.
        let lowest = window_sums.first().unwrap();

        // We're traversing windows from high to low.
        window_sums[1..].iter().rev().fold(zero, |mut total, sum_i| {
            total += sum_i;
            for _ in 0..c {
                total.double_in_place();
            }
            total
        }) + lowest
    }
}

#[cfg(test)]
mod test {
    use super::*;
    use crate::curves::{SWModelParameters, bn_382::{G1Projective, G1Affine, g1::Bn_382G1Parameters}};
    use crate::fields::bn_382::{Fp, Fq,};
    use rand::SeedableRng;
    use rand_xorshift::XorShiftRng;
    use crate::UniformRand;
    use crate::FixedBaseMSM;
    use colored::Colorize;
    use std::time::Instant;
    use rand::Rng;
    use rand_core::OsRng;
        

    fn naive_var_base_msm<G: AffineCurve>(
        bases: &[G],
        scalars: &[<G::ScalarField as PrimeField>::BigInt],
    ) -> G::Projective {
        let mut acc = G::Projective::zero();

        for (base, scalar) in bases.iter().zip(scalars.iter()) {
            acc += &base.mul(*scalar);
        }
        acc
    }

    //#[test]
    fn test_with_bn_382() {
        const SAMPLES: usize = 1 << 10;

        let mut rng = XorShiftRng::seed_from_u64(234872845u64);

        let v = (0..SAMPLES)
            .map(|_| Fp::rand(&mut rng).into_repr())
            .collect::<Vec<_>>();
        let g = (0..SAMPLES)
            .map(|_| G1Projective::rand(&mut rng).into_affine())
            .collect::<Vec<_>>();

        let naive = naive_var_base_msm(g.as_slice(), v.as_slice());
        let fast = VariableBaseMSM::multi_scalar_mul(g.as_slice(), v.as_slice());
        let affine = VariableBaseMSM::multi_scalar_mul_affine(g.as_slice(), v.as_slice());

        assert_eq!(naive, fast);
        assert_eq!(naive, affine)
    }


    #[test]
    fn test_with_bn_382_unequal_numbers() {
        const SAMPLES: usize = 1 << 10;

        let mut rng = XorShiftRng::seed_from_u64(234872845u64);

        let v = (0..SAMPLES-1)
            .map(|_| Fp::rand(&mut rng).into_repr())
            .collect::<Vec<_>>();
        let g = (0..SAMPLES)
            .map(|_| G1Projective::rand(&mut rng).into_affine())
            .collect::<Vec<_>>();

        let naive = naive_var_base_msm(g.as_slice(), v.as_slice());
        let fast = VariableBaseMSM::multi_scalar_mul_affine(g.as_slice(), v.as_slice());
        let affine = VariableBaseMSM::multi_scalar_mul_affine(g.as_slice(), v.as_slice());

        assert_eq!(naive, fast);
        assert_eq!(naive, affine)
    }

    fn add_batch(buckets_log2 : usize, per_bucket_log2: usize) {
        let buckets = 1 << buckets_log2;
        let per_bucket = 1 << per_bucket_log2;

        let g = G1Projective::prime_subgroup_generator().into_affine();
        let n = buckets * per_bucket;
        let mut v0 = vec![G1Projective::prime_subgroup_generator(); n];

        for i in 1..n {
            v0[i] = v0[i - 1].clone();
            v0[i].add_assign_mixed(&g);
        }
        ProjectiveCurve::batch_normalization(&mut v0);

        let mut v = v0.iter().map(|e| e.into_affine()).collect::<Vec<_>>();

        let mut denominators = vec![Fq::zero(); n / 2];

        let start = Instant::now();
        for d in 0..per_bucket_log2 {
            // reduce step
            let actual_bucket_size = 1 << (per_bucket_log2 - d);
            let num_pairs = (actual_bucket_size * buckets) / 2;

            for b in 0..buckets {
                for within_bucket_pr in 0..(actual_bucket_size / 2) {
                    // operating on
                    // v[b * actual_bucket_size + 2*i] and v[b * actual_bucket_size + 2*i + 1]
                    let i = b * actual_bucket_size + 2*within_bucket_pr;
                    let j = b * actual_bucket_size + 2*within_bucket_pr + 1;

                    denominators[b * (actual_bucket_size/2) + within_bucket_pr] = 
                        if v[i].x == v[j].x
                        {
                            if v[j].y == Fq::zero() {Fq::one()} else {v[j].y.double()}
                        } else {v[i].x - &v[j].x};
                    
                }
            }
            crate::fields::batch_inversion::<_>(&mut denominators);

            for b in 0..buckets {
                for within_bucket_pr in 0..(actual_bucket_size / 2) {
                    // operating on
                    // v[b * actual_bucket_size + 2*i] and v[b * actual_bucket_size + 2*i + 1]
                    let i = b * actual_bucket_size + 2*within_bucket_pr;
                    let j = i + 1;

                    let d = denominators[b*(actual_bucket_size/2) + within_bucket_pr];

                    if v[j].is_zero() == true
                    {
                    }
                    else if v[i].is_zero() == true
                    {
                        v[i] = v[j];
                    }
                    else if v[j].x == v[i].x && (v[j].y != v[i].y || v[j].y.is_zero() )
                    {
                        v[i] = G1Affine::zero();
                    }
                    else if v[j].x == v[i].x && v[j].y == v[i].y
                    {
                        let sq = v[i].x.square();
                        let s = (sq.double() + &sq + &Bn_382G1Parameters::COEFF_A) * &d;
                        let x = s.square() - &v[i].x.double();
                        let y = -v[i].y - &(s * &(x - &v[i].x));
                        v[i].x = x;
                        v[i].y = y;
                    }
                    else
                    {
                        let s = (v[i].y - &v[j].y) * &d;
                        let x = s.square() - &v[i].x - &v[j].x;
                        let y = -v[i].y - &(s * &(x - &v[i].x));

                        v[i].x = x;
                        v[i].y = y;
                    }
                }
            }

            // squish step
            let next_actual_bucket_size = actual_bucket_size / 2;

            for b in 1..buckets {
                for i in 0..next_actual_bucket_size {
                    v[b * next_actual_bucket_size + i] = v[b * actual_bucket_size + 2*i];
                }
            }

            denominators.truncate(denominators.len() / 2);
        }
        let t = start.elapsed();
        println!("{} = {} * {}, {:?} izzy time ", n, buckets, per_bucket, t);

        let v = v0.iter().map(|e| e.into_affine()).collect::<Vec<_>>();

        let start = Instant::now();
        let mut acc = G1Projective::zero();
        for x in v.iter() {
            acc.add_assign_mixed(&x);
        }
        let t = start.elapsed();
        println!("{} = {} * {}, {:?} mixed time ", n, buckets, per_bucket, t);
    }

    #[test]
    fn izzy_addition()
    {
        add_batch(17, 3);
    }

    #[test]
    fn batch_addition()
    {
        let mut length = 1000000;
        let rng = &mut OsRng;

        let size_in_bits = <Fp as PrimeField>::size_in_bits();
        let window_size = FixedBaseMSM::get_mul_window_size(length);
        let mut v = FixedBaseMSM::multi_scalar_mul::<G1Projective>
        (
            size_in_bits,
            window_size,
            &FixedBaseMSM::get_window_table
            (
                size_in_bits,
                window_size,
                G1Projective::prime_subgroup_generator()
            ),
            &(0..length).map(|_| Fp::rand(rng)).collect::<Vec<Fp>>(),
        );
        ProjectiveCurve::batch_normalization(&mut v);

        let vector = v.iter().map(|e| e.into_affine()).collect::<Vec<_>>();

        println!();
        println!("{}", "*****BENCHMARKING OPTIMISED AFFINE VS SERIAL JACOBIAN MIXED ADDITION*****".blue());
        loop
        {
            let mut vectors = (0..1000000/length).map(|_| vector[rng.gen_range(0, length/2)..rng.gen_range(length/2, length)].to_vec()).collect::<Vec<_>>();

            //println!("{}{:?}", "Lengths: ".magenta(), vectors.iter().map(|v| v.len()).collect::<Vec<_>>());
            println!();
            println!("{}{:?}", "Length: ".magenta(), length);
            println!("{}{:?}", "Buckets: ".magenta(), 1000000/length);

            let start = Instant::now();

            let sum2 = vectors.iter().map
            (
                |v|
                {
                    let mut sum = G1Projective::zero();
                    for point in v.iter()
                    {
                        sum.add_assign_mixed(point);
                    }
                    sum.into_affine()
                }
            ).collect::<Vec<_>>();

            let serial = start.elapsed();
            println!("     {}{:?}", "serial: ".green(), serial);
            let start = Instant::now();

            let sum1 = AffineCurve::add_points(&mut vectors);

            let batch = start.elapsed();
            println!("     {}{:?}", "batch: ".green(), batch);
            println!("     {}{:?}", "batch/serial: ".green(), batch.as_secs_f32()/serial.as_secs_f32());
            
            assert_eq!(sum1.iter().eq(sum2.iter()), true);
            assert_eq!(sum1, sum2);

            length = length/10;
            if length == 1 {break}
        }
    }

    #[test]
    fn multiexp()
    {
        let mut length = 1000000;
        let rng = &mut OsRng;

        let size_in_bits = <Fp as PrimeField>::size_in_bits();
        let window_size = FixedBaseMSM::get_mul_window_size(length);
        let mut v = FixedBaseMSM::multi_scalar_mul::<G1Projective>
        (
            size_in_bits,
            window_size,
            &FixedBaseMSM::get_window_table
            (
                size_in_bits,
                window_size,
                G1Projective::prime_subgroup_generator()
            ),
            &(0..length).map(|_| Fp::rand(rng)).collect::<Vec<Fp>>(),
        );
        ProjectiveCurve::batch_normalization(&mut v);

        let bases = v.iter().map(|e| e.into_affine()).collect::<Vec<_>>();
        let scalars = (0..length).map(|_| Fp::rand(rng).into_repr()).collect::<Vec<_>>();

        println!();
        println!("{}", "*****BENCHMARKING MULTIEXP WITH OPTIMISED AFFINE VS*****".blue());
        println!("{}", "******MULTIEXP WITH SERIAL JACOBIAN MIXED ADDITION******".blue());
        length = 1000000;
        loop
        {
            let base = bases[0..length].to_vec();
            let scalar = scalars[0..length].to_vec();

            println!("{}{:?}", "Length: ".magenta(), length);

            let start = Instant::now();

            let s1 = VariableBaseMSM::multi_scalar_mul_affine(&base, &scalar);

            let batch = start.elapsed();
            println!("     {}{:?}", "batch: ".green(), batch);
            let start = Instant::now();

            let s2 = VariableBaseMSM::multi_scalar_mul(&base, &scalar);

            let serial = start.elapsed();
            println!("     {}{:?}", "serial: ".green(), serial);
            println!("     {}{:?}", "batch/serial: ".green(), batch.as_secs_f32()/serial.as_secs_f32());

            assert_eq!(s1, s2);
            if length == 1 {break}
            length = length/10;
        }
    }
}
