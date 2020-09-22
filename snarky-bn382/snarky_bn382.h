// Defines bool
#include <stdbool.h>
#include <stdint.h>
// Defines size_t
#include <stddef.h>

struct det_sqrt_witness {
 void* c;
 uint64_t d;
 void* square_root;
 bool success;
};

// usize vector

void *zexe_usize_vector_create();

int zexe_usize_vector_length(void *);

void zexe_usize_vector_emplace_back(void *, size_t);

size_t zexe_usize_vector_get(void *, int);

void zexe_usize_vector_delete(void *);

// Bigint

// 256
void *zexe_bigint256_of_decimal_string(char *);

int zexe_bigint256_num_limbs();

char *zexe_bigint256_to_data(void *);

void *zexe_bigint256_of_data(char *);

int zexe_bigint256_bytes_per_limb();

void *zexe_bigint256_div(void *, void *);

void *zexe_bigint256_of_numeral(char *, int, int);

bool zexe_bigint256_compare(void *, void *);

bool zexe_bigint256_test_bit(void *, int);

void zexe_bigint256_delete(void *);

void zexe_bigint256_print(void *);

void *zexe_bigint256_find_wnaf(size_t, void *);

// 384
void *zexe_bigint384_of_decimal_string(char *);

int zexe_bigint384_num_limbs();

char *zexe_bigint384_to_data(void *);

void *zexe_bigint384_of_data(char *);

int zexe_bigint384_bytes_per_limb();

void *zexe_bigint384_div(void *, void *);

void *zexe_bigint384_of_numeral(char *, int, int);

bool zexe_bigint384_compare(void *, void *);

bool zexe_bigint384_test_bit(void *, int);

void zexe_bigint384_delete(void *);

void zexe_bigint384_print(void *);

void *zexe_bigint384_find_wnaf(size_t, void *);

// Fp

int zexe_bn382_fp_size_in_bits();

void* zexe_bn382_fp_endo_base();

void* zexe_bn382_fp_endo_scalar();

void *zexe_bn382_fp_size();

bool zexe_bn382_fp_is_square(void *);

void *zexe_bn382_fp_sqrt(void *);

void *zexe_bn382_fp_det_sqrt(void *);
struct det_sqrt_witness zexe_bn382_fp_det_sqrt_witness(void *);

void *zexe_bn382_fp_random();

void *zexe_bn382_fp_two_adic_root_of_unity();

void *zexe_bn382_fp_of_int(uint64_t);

char *zexe_bn382_fp_to_string(void *);

void *zexe_bn382_fp_inv(void *);

void *zexe_bn382_fp_square(void *);

void *zexe_bn382_fp_add(void *, void *);

void *zexe_bn382_fp_negate(void *);

void *zexe_bn382_fp_mul(void *, void *);

void *zexe_bn382_fp_div(void *, void *);

void *zexe_bn382_fp_sub(void *, void *);

void zexe_bn382_fp_mut_add(void *, void *);

void zexe_bn382_fp_mut_mul(void *, void *);

void zexe_bn382_fp_mut_square(void *);

void zexe_bn382_fp_mut_sub(void *, void *);

void zexe_bn382_fp_copy(void *, void *);

void *zexe_bn382_fp_rng(int i);

void zexe_bn382_fp_delete(void *);

void zexe_bn382_fp_print(void *);

bool zexe_bn382_fp_equal(void *, void *);

void *zexe_bn382_fp_to_bigint(void *);

void *zexe_bn382_fp_of_bigint(void *);

void *zexe_bn382_fp_to_bigint_raw(void *);

void *zexe_bn382_fp_to_bigint_raw_noalloc(void *);

void *zexe_bn382_fp_of_bigint_raw(void *);

// Fp vector

void *zexe_bn382_fp_vector_create();

int zexe_bn382_fp_vector_length(void *);

void zexe_bn382_fp_vector_emplace_back(void *, void *);

void *zexe_bn382_fp_vector_get(void *, int);

void zexe_bn382_fp_vector_delete(void *);

// Fp constraint matrix

void *zexe_bn382_fp_constraint_matrix_create();

void zexe_bn382_fp_constraint_matrix_append_row(void *, void*, void*);

void zexe_bn382_fp_constraint_matrix_delete(void *);

// Fp sponge

void *zexe_bn382_fp_sponge_params();

void zexe_bn382_fp_sponge_params_delete(void *);

void *zexe_bn382_fp_sponge_create();

void zexe_bn382_fp_sponge_delete(void *);

void zexe_bn382_fp_sponge_absorb(void *, void *, void *);

void *zexe_bn382_fp_sponge_squeeze(void *, void *);

// Fq

int zexe_bn382_fq_size_in_bits();
void* zexe_bn382_fq_endo_base();
void* zexe_bn382_fq_endo_scalar();
void *zexe_bn382_fq_size();
bool zexe_bn382_fq_is_square(void *);
void *zexe_bn382_fq_sqrt(void *);
void *zexe_bn382_fq_random();
void *zexe_bn382_fq_two_adic_root_of_unity();
void *zexe_bn382_fq_of_int(uint64_t);
char *zexe_bn382_fq_to_string(void *);
void *zexe_bn382_fq_inv(void *);
void *zexe_bn382_fq_square(void *);
void *zexe_bn382_fq_add(void *, void *);
void *zexe_bn382_fq_negate(void *);
void *zexe_bn382_fq_mul(void *, void *);
void *zexe_bn382_fq_div(void *, void *);
void *zexe_bn382_fq_sub(void *, void *);
void zexe_bn382_fq_mut_add(void *, void *);
void zexe_bn382_fq_mut_mul(void *, void *);
void zexe_bn382_fq_mut_square(void *);
void zexe_bn382_fq_mut_sub(void *, void *);
void zexe_bn382_fq_copy(void *, void *);
void *zexe_bn382_fq_rng(int i);
void zexe_bn382_fq_delete(void *);
void zexe_bn382_fq_print(void *);
bool zexe_bn382_fq_equal(void *, void *);
void *zexe_bn382_fq_to_bigint(void *);
void *zexe_bn382_fq_of_bigint(void *);
void *zexe_bn382_fq_to_bigint_raw(void *);
void *zexe_bn382_fq_to_bigint_raw_noalloc(void *);
void *zexe_bn382_fq_of_bigint_raw(void *);

void *zexe_bn382_fq_det_sqrt(void *);
struct det_sqrt_witness zexe_bn382_fq_det_sqrt_witness(void *);

// Fq vector

void *zexe_bn382_fq_vector_create();
int zexe_bn382_fq_vector_length(void *);
void zexe_bn382_fq_vector_emplace_back(void *, void *);
void *zexe_bn382_fq_vector_get(void *, int);
void zexe_bn382_fq_vector_delete(void *);

// Fq CsMat

void *zexe_bn382_fq_csmat_create(int, int);
void *zexe_bn382_fq_csmat_append_row(void *, void *, void *);
void zexe_bn382_fq_csmat_delete(void *);

// Fq constraint matrix

void *zexe_bn382_fq_constraint_matrix_create();
void zexe_bn382_fq_constraint_matrix_append_row(void *, void*, void*);
void zexe_bn382_fq_constraint_matrix_delete(void *);

// Fq sponge

void *zexe_bn382_fq_sponge_params();
void zexe_bn382_fq_sponge_params_delete(void *);
void *zexe_bn382_fq_sponge_create();
void zexe_bn382_fq_sponge_delete(void *);
void zexe_bn382_fq_sponge_absorb(void *, void *, void *);
void *zexe_bn382_fq_sponge_squeeze(void *, void *);

// Fp oracles
void *zexe_bn382_fp_oracles_create(void*, void*);
void zexe_bn382_fp_oracles_delete(void*);

void* zexe_bn382_fp_oracles_alpha(void*);
void* zexe_bn382_fp_oracles_eta_a(void*);
void* zexe_bn382_fp_oracles_eta_b(void*);
void* zexe_bn382_fp_oracles_eta_c(void*);
void* zexe_bn382_fp_oracles_beta1(void*);
void* zexe_bn382_fp_oracles_beta2(void*);
void* zexe_bn382_fp_oracles_beta3(void*);
void* zexe_bn382_fp_oracles_batch(void*);
void* zexe_bn382_fp_oracles_r(void*);
void* zexe_bn382_fp_oracles_r_k(void*);
void* zexe_bn382_fp_oracles_x_hat_beta1(void*);
void* zexe_bn382_fp_oracles_digest_before_evaluations(void*);

// Fq oracles
void *zexe_bn382_fq_oracles_create(void*, void*);
void zexe_bn382_fq_oracles_delete(void*);

void* zexe_bn382_fq_oracles_opening_prechallenges(void*);
void* zexe_bn382_fq_oracles_alpha(void*);
void* zexe_bn382_fq_oracles_eta_a(void*);
void* zexe_bn382_fq_oracles_eta_b(void*);
void* zexe_bn382_fq_oracles_eta_c(void*);
void* zexe_bn382_fq_oracles_beta1(void*);
void* zexe_bn382_fq_oracles_beta2(void*);
void* zexe_bn382_fq_oracles_beta3(void*);
void* zexe_bn382_fq_oracles_polys(void*);
void* zexe_bn382_fq_oracles_evals(void*);
void* zexe_bn382_fq_oracles_digest_before_evaluations(void*);
void* zexe_bn382_fq_oracles_x_hat_nocopy(void*);

// Fp verifier index
void *zexe_bn382_fp_verifier_index_create(void*);
void zexe_bn382_fp_verifier_index_delete(void*);
void *zexe_bn382_fp_verifier_index_urs(void*);

void *zexe_bn382_fp_verifier_index_make(
    size_t, size_t, size_t, size_t, size_t,
    void*,
    void*, void*, void*, void*,
    void*, void*, void*, void*,
    void*, void*, void*, void* );

void zexe_bn382_fp_verifier_index_write(void*, void*);
void* zexe_bn382_fp_verifier_index_read(void*);

void *zexe_bn382_fp_verifier_index_a_row_comm(void*);
void *zexe_bn382_fp_verifier_index_a_col_comm(void*);
void *zexe_bn382_fp_verifier_index_a_val_comm(void*);
void *zexe_bn382_fp_verifier_index_a_rc_comm(void*);

void *zexe_bn382_fp_verifier_index_b_row_comm(void*);
void *zexe_bn382_fp_verifier_index_b_col_comm(void*);
void *zexe_bn382_fp_verifier_index_b_val_comm(void*);
void *zexe_bn382_fp_verifier_index_b_rc_comm(void*);

void *zexe_bn382_fp_verifier_index_c_row_comm(void*);
void *zexe_bn382_fp_verifier_index_c_col_comm(void*);
void *zexe_bn382_fp_verifier_index_c_val_comm(void*);
void *zexe_bn382_fp_verifier_index_c_rc_comm(void*);

void *zexe_bn382_fp_verifier_index_vector_create();
int zexe_bn382_fp_verifier_index_vector_length(void *);
void zexe_bn382_fp_verifier_index_vector_emplace_back(void *, void *);
void *zexe_bn382_fp_verifier_index_vector_get(void *, int);
void zexe_bn382_fp_verifier_index_vector_delete(void *);

// Fq verifier index
void *zexe_bn382_fq_verifier_index_create(void*);
void zexe_bn382_fq_verifier_index_delete(void*);
void *zexe_bn382_fq_verifier_index_urs(void*);

void *zexe_bn382_fq_verifier_index_make(
    size_t, size_t, size_t, size_t, size_t,
    void*,
    void*, void*, void*, void*,
    void*, void*, void*, void*,
    void*, void*, void*, void* );

void zexe_bn382_fq_verifier_index_write(void*, void*);
void* zexe_bn382_fq_verifier_index_read(void*, void*);

void *zexe_bn382_fq_verifier_index_a_row_comm(void*);
void *zexe_bn382_fq_verifier_index_a_col_comm(void*);
void *zexe_bn382_fq_verifier_index_a_val_comm(void*);
void *zexe_bn382_fq_verifier_index_a_rc_comm(void*);

void *zexe_bn382_fq_verifier_index_b_row_comm(void*);
void *zexe_bn382_fq_verifier_index_b_col_comm(void*);
void *zexe_bn382_fq_verifier_index_b_val_comm(void*);
void *zexe_bn382_fq_verifier_index_b_rc_comm(void*);

void *zexe_bn382_fq_verifier_index_c_row_comm(void*);
void *zexe_bn382_fq_verifier_index_c_col_comm(void*);
void *zexe_bn382_fq_verifier_index_c_val_comm(void*);
void *zexe_bn382_fq_verifier_index_c_rc_comm(void*);

void *zexe_bn382_fq_verifier_index_vector_create();
int zexe_bn382_fq_verifier_index_vector_length(void *);
void zexe_bn382_fq_verifier_index_vector_emplace_back(void *, void *);
void *zexe_bn382_fq_verifier_index_vector_get(void *, int);
void zexe_bn382_fq_verifier_index_vector_delete(void *);

// Fp URS
void *zexe_bn382_fp_urs_create(size_t);
void zexe_bn382_fp_urs_delete(void*);
void zexe_bn382_fp_urs_write(void*, char*);
void* zexe_bn382_fp_urs_read(char*);
void* zexe_bn382_fp_urs_lagrange_commitment(void*, size_t, size_t);
void* zexe_bn382_fp_urs_commit_evaluations(void*, size_t, void*);
void* zexe_bn382_fp_urs_dummy_opening_check(void*);
void* zexe_bn382_fp_urs_dummy_degree_bound_checks(void*, void*);

// Fq URS
void *zexe_bn382_fq_urs_create(size_t, size_t, size_t);
void zexe_bn382_fq_urs_delete(void *);
void zexe_bn382_fq_urs_write(void*, char*);
void* zexe_bn382_fq_urs_read(char*);
void* zexe_bn382_fq_urs_lagrange_commitment(void*, size_t, size_t);
void* zexe_bn382_fq_urs_commit_evaluations(void*, size_t, void*);
void* zexe_bn382_fq_urs_b_poly_commitment(void*, void*);
void* zexe_bn382_fq_urs_h(void*);
void* zexe_bn382_fq_urs_batch_accumulator_check(void*, void*, void*);

// Fp index

size_t zexe_bn382_fp_index_domain_h_size(void*);
size_t zexe_bn382_fp_index_domain_k_size(void*);

void *zexe_bn382_fp_index_create(void*, void*, void*, size_t, size_t, void*);

void zexe_bn382_fp_index_delete(void *);

size_t zexe_bn382_fp_index_num_variables(void*);
size_t zexe_bn382_fp_index_public_inputs(void*);
size_t zexe_bn382_fp_index_nonzero_entries(void*);
size_t zexe_bn382_fp_index_max_degree(void*);

void zexe_bn382_fp_index_write(void*, char*);
void* zexe_bn382_fp_index_read(void*, void*, void*, void*, size_t, char*);
// Fq index

size_t zexe_bn382_fq_index_domain_h_size(void*);
size_t zexe_bn382_fq_index_domain_k_size(void*);

void *zexe_bn382_fq_index_create(void*, void*, void*, size_t, size_t, void*);

void zexe_bn382_fq_index_delete(void *);

size_t zexe_bn382_fq_index_num_variables(void*);
size_t zexe_bn382_fq_index_public_inputs(void*);
size_t zexe_bn382_fq_index_nonzero_entries(void*);
size_t zexe_bn382_fq_index_max_degree(void*);

void zexe_bn382_fq_index_write(void*, char*);
void* zexe_bn382_fq_index_read(void*, void*, void*, void*, size_t, char*);

// Fp proof

void zexe_bn382_fp_proof_delete(void *);
void *zexe_bn382_fp_proof_create(void *, void* , void*);
bool *zexe_bn382_fp_proof_verify(void *, void*);
bool zexe_bn382_fp_proof_batch_verify(void *, void*);
void *zexe_bn382_fp_proof_make(void *,void *,void *,void *,void *,void *,void *,void *,void *,void *,void *,void *,void *,void *,void *,void *,void *,void *,void *,void *,void *,void *,void *,void *,void *,void *,void *,void *,void *,void *,void *,void *,void *,void *,void *,void *,void *,void *,void *);

void *zexe_bn382_fp_proof_w_comm(void *);
void *zexe_bn382_fp_proof_za_comm(void *);
void *zexe_bn382_fp_proof_zb_comm(void *);
void *zexe_bn382_fp_proof_h1_comm(void *);
void *zexe_bn382_fp_proof_h2_comm(void *);
void *zexe_bn382_fp_proof_h3_comm(void *);

void *zexe_bn382_fp_proof_g1_comm_nocopy(void *);
void *zexe_bn382_fp_proof_g2_comm_nocopy(void *);
void *zexe_bn382_fp_proof_g3_comm_nocopy(void *);

void *zexe_bn382_fp_proof_commitment_with_degree_bound_0(void *);
void *zexe_bn382_fp_proof_commitment_with_degree_bound_1(void *);
void zexe_bn382_fp_proof_commitment_with_degree_bound_delete(void *);

void *zexe_bn382_fp_proof_proof1(void *);
void *zexe_bn382_fp_proof_proof2(void *);
void *zexe_bn382_fp_proof_proof3(void *);
void *zexe_bn382_fp_proof_sigma2(void *);
void *zexe_bn382_fp_proof_sigma3(void *);

void *zexe_bn382_fp_proof_w_eval(void *);
void *zexe_bn382_fp_proof_za_eval(void *);
void *zexe_bn382_fp_proof_zb_eval(void *);
void *zexe_bn382_fp_proof_h1_eval(void *);
void *zexe_bn382_fp_proof_g1_eval(void *);
void *zexe_bn382_fp_proof_h2_eval(void *);
void *zexe_bn382_fp_proof_g2_eval(void *);
void *zexe_bn382_fp_proof_h3_eval(void *);
void *zexe_bn382_fp_proof_g3_eval(void *);

void *zexe_bn382_fp_proof_row_evals_nocopy(void *);
void *zexe_bn382_fp_proof_col_evals_nocopy(void *);
void *zexe_bn382_fp_proof_val_evals_nocopy(void *);
void *zexe_bn382_fp_proof_rc_evals_nocopy(void *);

void *zexe_bn382_fp_proof_evals_0(void *);
void *zexe_bn382_fp_proof_evals_1(void *);
void *zexe_bn382_fp_proof_evals_2(void *);
void zexe_bn382_fp_proof_evals_delete(void *);

// Fp proof vector

void *zexe_bn382_fp_proof_vector_create();

int zexe_bn382_fp_proof_vector_length(void *);

void zexe_bn382_fp_proof_vector_emplace_back(void *, void *);

void *zexe_bn382_fp_proof_vector_get(void *, int);

void zexe_bn382_fp_proof_vector_delete(void *);

// Fq proof

void zexe_bn382_fq_proof_delete(void *);
void *zexe_bn382_fq_proof_create(void *, void* , void*, void*, void*);
bool zexe_bn382_fq_proof_batch_verify(void *, void*);
bool zexe_bn382_fq_proof_verify(void *, void*);
void *zexe_bn382_fq_proof_make(
    void*,

    void*, void*, void*,
    void*, void*, void*,
    void*, void*, void*,

    void*, void*,

    void*, void*, void*, void*, void*,

    void*, void*, void*,
    void*, void*
);

void *zexe_bn382_fq_proof_w_comm(void *);
void *zexe_bn382_fq_proof_za_comm(void *);
void *zexe_bn382_fq_proof_zb_comm(void *);
void *zexe_bn382_fq_proof_h1_comm(void *);
void *zexe_bn382_fq_proof_h2_comm(void *);
void *zexe_bn382_fq_proof_h3_comm(void *);

void *zexe_bn382_fq_proof_g1_comm_nocopy(void *);
void *zexe_bn382_fq_proof_g2_comm_nocopy(void *);
void *zexe_bn382_fq_proof_g3_comm_nocopy(void *);

void *zexe_bn382_fq_proof_evals_nocopy(void *);

void *zexe_bn382_fq_proof_proof(void *);

void *zexe_bn382_fq_proof_sigma2(void *);
void *zexe_bn382_fq_proof_sigma3(void *);

// Fp proof vector

void *zexe_bn382_fq_proof_vector_create();

int zexe_bn382_fq_proof_vector_length(void *);

void zexe_bn382_fq_proof_vector_emplace_back(void *, void *);

void *zexe_bn382_fq_proof_vector_get(void *, int);

void zexe_bn382_fq_proof_vector_delete(void *);

// Fq proof evaluations

void *zexe_bn382_fq_proof_evaluations_w(void *);
void *zexe_bn382_fq_proof_evaluations_za(void *);
void *zexe_bn382_fq_proof_evaluations_zb(void *);
void *zexe_bn382_fq_proof_evaluations_h1(void *);
void *zexe_bn382_fq_proof_evaluations_h2(void *);
void *zexe_bn382_fq_proof_evaluations_h3(void *);
void *zexe_bn382_fq_proof_evaluations_g1(void *);
void *zexe_bn382_fq_proof_evaluations_g2(void *);
void *zexe_bn382_fq_proof_evaluations_g3(void *);

void *zexe_bn382_fq_proof_evaluations_make(
    void *, void *, void *,
    void *, void *, void *,
    void *, void *, void *,
    void *, void *, void *,
    void *, void *, void *,
    void *, void *, void *,
    void *, void *, void *
);
void zexe_bn382_fq_proof_evaluations_delete(void *);

void *zexe_bn382_fq_proof_evaluations_row_nocopy(void *);
void *zexe_bn382_fq_proof_evaluations_col_nocopy(void *);
void *zexe_bn382_fq_proof_evaluations_val_nocopy(void *);
void *zexe_bn382_fq_proof_evaluations_rc_nocopy(void *);

void *zexe_bn382_fq_proof_evaluations_triple_0(void *);
void *zexe_bn382_fq_proof_evaluations_triple_1(void *);
void *zexe_bn382_fq_proof_evaluations_triple_2(void *);
void *zexe_bn382_fq_proof_evaluations_triple_delete(void *);

// Fq opening proof
void zexe_bn382_fq_opening_proof_delete(void *);
void *zexe_bn382_fq_opening_proof_lr(void *);
void *zexe_bn382_fq_opening_proof_z1(void *);
void *zexe_bn382_fq_opening_proof_z2(void *);
void *zexe_bn382_fq_opening_proof_delta(void *);
void *zexe_bn382_fq_opening_proof_sg(void *);
void zexe_bn382_fq_opening_proof_delete(void *);

// G
void *zexe_bn382_g_one();
void *zexe_bn382_g_random();
void zexe_bn382_g_delete(void *);
void *zexe_bn382_g_add(void *, void *);
void *zexe_bn382_g_double(void *);
void *zexe_bn382_g_scale(void *, void *);
void *zexe_bn382_g_sub(void *, void *);
void *zexe_bn382_g_negate(void *);
void *zexe_bn382_g_to_affine(void *);
void *zexe_bn382_g_of_affine(void *);
void *zexe_bn382_g_of_affine_coordinates(void *, void*);
void *zexe_bn382_g_affine_create(void *, void*);
void *zexe_bn382_g_affine_x(void *);
void *zexe_bn382_g_affine_y(void *);
bool zexe_bn382_g_affine_is_zero(void *);
void zexe_bn382_g_affine_delete(void *);

void *zexe_bn382_g_affine_vector_create();
int zexe_bn382_g_affine_vector_length(void *);
void zexe_bn382_g_affine_vector_emplace_back(void *, void *);
void *zexe_bn382_g_affine_vector_get(void *, int);
void zexe_bn382_g_affine_vector_delete(void *);

void *zexe_bn382_g_affine_pair_0(void *);
void *zexe_bn382_g_affine_pair_1(void *);
void *zexe_bn382_g_affine_pair_make(void *, void*);
void zexe_bn382_g_affine_pair_delete(void *);

void *zexe_bn382_g_affine_pair_vector_create();
int zexe_bn382_g_affine_pair_vector_length(void *);
void zexe_bn382_g_affine_pair_vector_emplace_back(void *, void *);
void *zexe_bn382_g_affine_pair_vector_get(void *, int);
void zexe_bn382_g_affine_pair_vector_delete(void *);

// G1
void *zexe_bn382_g1_one();
void *zexe_bn382_g1_random();
void zexe_bn382_g1_delete(void *);
void *zexe_bn382_g1_add(void *, void *);
void *zexe_bn382_g1_double(void *);
void *zexe_bn382_g1_scale(void *, void *);
void *zexe_bn382_g1_sub(void *, void *);
void *zexe_bn382_g1_negate(void *);
void *zexe_bn382_g1_to_affine(void *);
void *zexe_bn382_g1_of_affine(void *);
void *zexe_bn382_g1_of_affine_coordinates(void *, void*);
void *zexe_bn382_g1_affine_create(void *, void*);
void *zexe_bn382_g1_affine_x(void *);
void *zexe_bn382_g1_affine_y(void *);
bool zexe_bn382_g1_affine_is_zero(void *);
void zexe_bn382_g1_affine_delete(void *);

void *zexe_bn382_g1_affine_vector_create();
int zexe_bn382_g1_affine_vector_length(void *);
void zexe_bn382_g1_affine_vector_emplace_back(void *, void *);
void *zexe_bn382_g1_affine_vector_get(void *, int);
void zexe_bn382_g1_affine_vector_delete(void *);

void *zexe_bn382_g1_affine_pair_0(void *);
void *zexe_bn382_g1_affine_pair_1(void *);
void *zexe_bn382_g1_affine_pair_make(void *, void *);
void zexe_bn382_g1_affine_pair_delete(void *);

void *zexe_bn382_g1_affine_pair_vector_create();
int zexe_bn382_g1_affine_pair_vector_length(void *);
void zexe_bn382_g1_affine_pair_vector_emplace_back(void *, void *);
void *zexe_bn382_g1_affine_pair_vector_get(void *, int);
void zexe_bn382_g1_affine_pair_vector_delete(void *);

// Fp triple
void *zexe_bn382_fp_triple_0(void *);
void *zexe_bn382_fp_triple_1(void *);
void *zexe_bn382_fp_triple_2(void *);
void zexe_bn382_fp_triple_delete(void *);
void *zexe_bn382_fp_vector_triple_0(void *);
void *zexe_bn382_fp_vector_triple_1(void *);
void *zexe_bn382_fp_vector_triple_2(void *);
void zexe_bn382_fp_vector_triple_delete(void *);

// Fq triple
void *zexe_bn382_fq_triple_0(void *);
void *zexe_bn382_fq_triple_1(void *);
void *zexe_bn382_fq_triple_2(void *);
void zexe_bn382_fq_triple_delete(void *);
void *zexe_bn382_fq_vector_triple_0(void *);
void *zexe_bn382_fq_vector_triple_1(void *);
void *zexe_bn382_fq_vector_triple_2(void *);
void zexe_bn382_fq_vector_triple_delete(void *);

// Fq poly comm
void *zexe_bn382_fq_poly_comm_shifted(void *);
void *zexe_bn382_fq_poly_comm_unshifted(void *);
void *zexe_bn382_fq_poly_comm_make(void *, void *);
void zexe_bn382_fq_poly_comm_delete(void *);

// Misc
bool zexe_bn382_batch_pairing_check(void *,void *,void *,void *,void *,void *);

// Tweedle

// Fq

int zexe_tweedle_fq_size_in_bits();
void* zexe_tweedle_fq_endo_base();
void* zexe_tweedle_fq_endo_scalar();
void *zexe_tweedle_fq_size();
bool zexe_tweedle_fq_is_square(void *);
void *zexe_tweedle_fq_sqrt(void *);
void *zexe_tweedle_fq_random();
void *zexe_tweedle_fq_two_adic_root_of_unity();
void *zexe_tweedle_fq_of_int(uint64_t);
char *zexe_tweedle_fq_to_string(void *);
void *zexe_tweedle_fq_inv(void *);
void *zexe_tweedle_fq_square(void *);
void *zexe_tweedle_fq_add(void *, void *);
void *zexe_tweedle_fq_negate(void *);
void *zexe_tweedle_fq_mul(void *, void *);
void *zexe_tweedle_fq_div(void *, void *);
void *zexe_tweedle_fq_sub(void *, void *);
void zexe_tweedle_fq_mut_add(void *, void *);
void zexe_tweedle_fq_mut_mul(void *, void *);
void zexe_tweedle_fq_mut_square(void *);
void zexe_tweedle_fq_mut_sub(void *, void *);
void zexe_tweedle_fq_copy(void *, void *);
void *zexe_tweedle_fq_rng(int i);
void zexe_tweedle_fq_delete(void *);
void zexe_tweedle_fq_print(void *);
bool zexe_tweedle_fq_equal(void *, void *);
void *zexe_tweedle_fq_to_bigint(void *);
void *zexe_tweedle_fq_of_bigint(void *);
void *zexe_tweedle_fq_to_bigint_raw(void *);
void *zexe_tweedle_fq_to_bigint_raw_noalloc(void *);
void *zexe_tweedle_fq_of_bigint_raw(void *);

void *zexe_tweedle_fq_det_sqrt(void *);
struct det_sqrt_witness zexe_tweedle_fq_det_sqrt_witness(void *);

// Fq vector

void *zexe_tweedle_fq_vector_create();
int zexe_tweedle_fq_vector_length(void *);
void zexe_tweedle_fq_vector_emplace_back(void *, void *);
void *zexe_tweedle_fq_vector_get(void *, int);
void zexe_tweedle_fq_vector_delete(void *);

// Fq CsMat

void *zexe_tweedle_fq_csmat_create(int, int);
void *zexe_tweedle_fq_csmat_append_row(void *, void *, void *);
void zexe_tweedle_fq_csmat_delete(void *);

// Fq constraint matrix

void *zexe_tweedle_fq_constraint_matrix_create();
void zexe_tweedle_fq_constraint_matrix_append_row(void *, void*, void*);
void zexe_tweedle_fq_constraint_matrix_delete(void *);

// Fq oracles
void *zexe_tweedle_fq_oracles_create(void*, void*);
void zexe_tweedle_fq_oracles_delete(void*);

void* zexe_tweedle_fq_oracles_opening_prechallenges(void*);
void* zexe_tweedle_fq_oracles_alpha(void*);
void* zexe_tweedle_fq_oracles_eta_a(void*);
void* zexe_tweedle_fq_oracles_eta_b(void*);
void* zexe_tweedle_fq_oracles_eta_c(void*);
void* zexe_tweedle_fq_oracles_beta1(void*);
void* zexe_tweedle_fq_oracles_beta2(void*);
void* zexe_tweedle_fq_oracles_beta3(void*);
void* zexe_tweedle_fq_oracles_polys(void*);
void* zexe_tweedle_fq_oracles_evals(void*);
void* zexe_tweedle_fq_oracles_digest_before_evaluations(void*);
void* zexe_tweedle_fq_oracles_x_hat_nocopy(void*);

void camlsnark_bn382_fp_verifier_index_write(void*, void*);
void* camlsnark_bn382_fp_verifier_index_read(void*);

void *camlsnark_bn382_fp_verifier_index_a_row_comm(void*);
void *camlsnark_bn382_fp_verifier_index_a_col_comm(void*);
void *camlsnark_bn382_fp_verifier_index_a_val_comm(void*);
void *camlsnark_bn382_fp_verifier_index_a_rc_comm(void*);

void *camlsnark_bn382_fp_verifier_index_b_row_comm(void*);
void *camlsnark_bn382_fp_verifier_index_b_col_comm(void*);
void *camlsnark_bn382_fp_verifier_index_b_val_comm(void*);
void *camlsnark_bn382_fp_verifier_index_b_rc_comm(void*);

void *camlsnark_bn382_fp_verifier_index_c_row_comm(void*);
void *camlsnark_bn382_fp_verifier_index_c_col_comm(void*);
void *camlsnark_bn382_fp_verifier_index_c_val_comm(void*);
void *camlsnark_bn382_fp_verifier_index_c_rc_comm(void*);

// Fq verifier index
void *zexe_tweedle_fq_verifier_index_create(void*);
void zexe_tweedle_fq_verifier_index_delete(void*);
void *zexe_tweedle_fq_verifier_index_urs(void*);

void *zexe_tweedle_fq_verifier_index_make(
    size_t, size_t, size_t, size_t, size_t,
    void*,
    void*, void*, void*, void*,
    void*, void*, void*, void*,
    void*, void*, void*, void* );

void zexe_tweedle_fq_verifier_index_write(void*, void*);
void* zexe_tweedle_fq_verifier_index_read(void*, void*);

void *zexe_tweedle_fq_verifier_index_a_row_comm(void*);
void *zexe_tweedle_fq_verifier_index_a_col_comm(void*);
void *zexe_tweedle_fq_verifier_index_a_val_comm(void*);
void *zexe_tweedle_fq_verifier_index_a_rc_comm(void*);

void *zexe_tweedle_fq_verifier_index_b_row_comm(void*);
void *zexe_tweedle_fq_verifier_index_b_col_comm(void*);
void *zexe_tweedle_fq_verifier_index_b_val_comm(void*);
void *zexe_tweedle_fq_verifier_index_b_rc_comm(void*);

void *zexe_tweedle_fq_verifier_index_c_row_comm(void*);
void *zexe_tweedle_fq_verifier_index_c_col_comm(void*);
void *zexe_tweedle_fq_verifier_index_c_val_comm(void*);
void *zexe_tweedle_fq_verifier_index_c_rc_comm(void*);

void *zexe_tweedle_fq_verifier_index_vector_create();
int zexe_tweedle_fq_verifier_index_vector_length(void *);
void zexe_tweedle_fq_verifier_index_vector_emplace_back(void *, void *);
void *zexe_tweedle_fq_verifier_index_vector_get(void *, int);
void zexe_tweedle_fq_verifier_index_vector_delete(void *);

// Fq URS
void *zexe_tweedle_fq_urs_create(size_t, size_t, size_t);
void zexe_tweedle_fq_urs_delete(void*);
void zexe_tweedle_fq_urs_write(void*, char*);
void* zexe_tweedle_fq_urs_read(char*);
void* zexe_tweedle_fq_urs_lagrange_commitment(void*, size_t, size_t);
void* zexe_tweedle_fq_urs_commit_evaluations(void*, size_t, void*);
void* zexe_tweedle_fq_urs_b_poly_commitment(void*, void*);
void* zexe_tweedle_fq_urs_h(void*);
void* zexe_tweedle_fq_urs_batch_accumulator_check(void*, void*, void*);

// Fq index

size_t zexe_tweedle_fq_index_domain_h_size(void*);
size_t zexe_tweedle_fq_index_domain_k_size(void*);

void *zexe_tweedle_fq_index_create(void*, void*, void*, size_t, size_t, void*);

void zexe_tweedle_fq_index_delete(void *);

size_t zexe_tweedle_fq_index_num_variables(void*);
size_t zexe_tweedle_fq_index_public_inputs(void*);
size_t zexe_tweedle_fq_index_nonzero_entries(void*);
size_t zexe_tweedle_fq_index_max_degree(void*);

void zexe_tweedle_fq_index_write(void*, char*);
void* zexe_tweedle_fq_index_read(void*, void*, void*, void*, size_t, char*);

// Fq proof

void zexe_tweedle_fq_proof_delete(void *);
void *zexe_tweedle_fq_proof_create(void *, void* , void*, void*, void*);
bool zexe_tweedle_fq_proof_batch_verify(void *, void*);
bool zexe_tweedle_fq_proof_verify(void *, void*);
void *zexe_tweedle_fq_proof_make(
    void*,

    void*, void*, void*,
    void*, void*, void*,
    void*, void*, void*,

    void*, void*,

    void*, void*, void*, void*, void*,

    void*, void*, void*,
    void*, void*
);

void *zexe_tweedle_fq_proof_w_comm(void *);
void *zexe_tweedle_fq_proof_za_comm(void *);
void *zexe_tweedle_fq_proof_zb_comm(void *);
void *zexe_tweedle_fq_proof_h1_comm(void *);
void *zexe_tweedle_fq_proof_h2_comm(void *);
void *zexe_tweedle_fq_proof_h3_comm(void *);

void *zexe_tweedle_fq_proof_g1_comm_nocopy(void *);
void *zexe_tweedle_fq_proof_g2_comm_nocopy(void *);
void *zexe_tweedle_fq_proof_g3_comm_nocopy(void *);

void *zexe_tweedle_fq_proof_evals_nocopy(void *);

void *zexe_tweedle_fq_proof_proof(void *);

void *zexe_tweedle_fq_proof_sigma2(void *);
void *zexe_tweedle_fq_proof_sigma3(void *);

// Fq proof vector

void *zexe_tweedle_fq_proof_vector_create();

int zexe_tweedle_fq_proof_vector_length(void *);

void zexe_tweedle_fq_proof_vector_emplace_back(void *, void *);

void *zexe_tweedle_fq_proof_vector_get(void *, int);

void zexe_tweedle_fq_proof_vector_delete(void *);

// Fq proof evaluations

void *zexe_tweedle_fq_proof_evaluations_w(void *);
void *zexe_tweedle_fq_proof_evaluations_za(void *);
void *zexe_tweedle_fq_proof_evaluations_zb(void *);
void *zexe_tweedle_fq_proof_evaluations_h1(void *);
void *zexe_tweedle_fq_proof_evaluations_h2(void *);
void *zexe_tweedle_fq_proof_evaluations_h3(void *);
void *zexe_tweedle_fq_proof_evaluations_g1(void *);
void *zexe_tweedle_fq_proof_evaluations_g2(void *);
void *zexe_tweedle_fq_proof_evaluations_g3(void *);

void *zexe_tweedle_fq_proof_evaluations_make(
    void *, void *, void *,
    void *, void *, void *,
    void *, void *, void *,
    void *, void *, void *,
    void *, void *, void *,
    void *, void *, void *,
    void *, void *, void *
);
void zexe_tweedle_fq_proof_evaluations_delete(void *);

void *zexe_tweedle_fq_proof_evaluations_row_nocopy(void *);
void *zexe_tweedle_fq_proof_evaluations_col_nocopy(void *);
void *zexe_tweedle_fq_proof_evaluations_val_nocopy(void *);
void *zexe_tweedle_fq_proof_evaluations_rc_nocopy(void *);

void *zexe_tweedle_fq_proof_evaluations_triple_0(void *);
void *zexe_tweedle_fq_proof_evaluations_triple_1(void *);
void *zexe_tweedle_fq_proof_evaluations_triple_2(void *);
void zexe_tweedle_fq_proof_evaluations_triple_delete(void *);

// Fq opening proof
void zexe_tweedle_fq_opening_proof_delete(void *);
void *zexe_tweedle_fq_opening_proof_lr(void *);
void *zexe_tweedle_fq_opening_proof_z1(void *);
void *zexe_tweedle_fq_opening_proof_z2(void *);
void *zexe_tweedle_fq_opening_proof_delta(void *);
void *zexe_tweedle_fq_opening_proof_sg(void *);
void zexe_tweedle_fq_opening_proof_delete(void *);

// Fq triple
void *zexe_tweedle_fq_triple_0(void *);
void *zexe_tweedle_fq_triple_1(void *);
void *zexe_tweedle_fq_triple_2(void *);
void zexe_tweedle_fq_triple_delete(void *);
void *zexe_tweedle_fq_vector_triple_0(void *);
void *zexe_tweedle_fq_vector_triple_1(void *);
void *zexe_tweedle_fq_vector_triple_2(void *);
void zexe_tweedle_fq_vector_triple_delete(void *);

// Fq poly comm
void *zexe_tweedle_fq_poly_comm_shifted(void *);
void *zexe_tweedle_fq_poly_comm_unshifted(void *);
void *zexe_tweedle_fq_poly_comm_make(void *, void *);
void zexe_tweedle_fq_poly_comm_delete(void *);

// dumm
void *zexe_tweedle_dum_one();
void *zexe_tweedle_dum_random();
void zexe_tweedle_dum_delete(void *);
void *zexe_tweedle_dum_add(void *, void *);
void *zexe_tweedle_dum_double(void *);
void *zexe_tweedle_dum_scale(void *, void *);
void *zexe_tweedle_dum_sub(void *, void *);
void *zexe_tweedle_dum_negate(void *);
void *zexe_tweedle_dum_to_affine(void *);
void *zexe_tweedle_dum_of_affine(void *);
void *zexe_tweedle_dum_of_affine_coordinates(void *, void*);
void *zexe_tweedle_dum_affine_create(void *, void*);
void *zexe_tweedle_dum_affine_x(void *);
void *zexe_tweedle_dum_affine_y(void *);
bool zexe_tweedle_dum_affine_is_zero(void *);
void zexe_tweedle_dum_affine_delete(void *);

void *zexe_tweedle_dum_affine_vector_create();
int zexe_tweedle_dum_affine_vector_length(void *);
void zexe_tweedle_dum_affine_vector_emplace_back(void *, void *);
void *zexe_tweedle_dum_affine_vector_get(void *, int);
void zexe_tweedle_dum_affine_vector_delete(void *);

void *zexe_tweedle_dum_affine_pair_0(void *);
void *zexe_tweedle_dum_affine_pair_1(void *);
void *zexe_tweedle_dum_affine_pair_make(void *, void*);
void zexe_tweedle_dum_affine_pair_delete(void *);

void *zexe_tweedle_dum_affine_pair_vector_create();
int zexe_tweedle_dum_affine_pair_vector_length(void *);
void zexe_tweedle_dum_affine_pair_vector_emplace_back(void *, void *);
void *zexe_tweedle_dum_affine_pair_vector_get(void *, int);
void zexe_tweedle_dum_affine_pair_vector_delete(void *);

// Fq

int zexe_tweedle_fp_size_in_bits();
void* zexe_tweedle_fp_endo_base();
void* zexe_tweedle_fp_endo_scalar();
void *zexe_tweedle_fp_size();
bool zexe_tweedle_fp_is_square(void *);
void *zexe_tweedle_fp_sqrt(void *);
void *zexe_tweedle_fp_random();
void *zexe_tweedle_fp_two_adic_root_of_unity();
void *zexe_tweedle_fp_of_int(uint64_t);
char *zexe_tweedle_fp_to_string(void *);
void *zexe_tweedle_fp_inv(void *);
void *zexe_tweedle_fp_square(void *);
void *zexe_tweedle_fp_add(void *, void *);
void *zexe_tweedle_fp_negate(void *);
void *zexe_tweedle_fp_mul(void *, void *);
void *zexe_tweedle_fp_div(void *, void *);
void *zexe_tweedle_fp_sub(void *, void *);
void zexe_tweedle_fp_mut_add(void *, void *);
void zexe_tweedle_fp_mut_mul(void *, void *);
void zexe_tweedle_fp_mut_square(void *);
void zexe_tweedle_fp_mut_sub(void *, void *);
void zexe_tweedle_fp_copy(void *, void *);
void *zexe_tweedle_fp_rng(int i);
void zexe_tweedle_fp_delete(void *);
void zexe_tweedle_fp_print(void *);
bool zexe_tweedle_fp_equal(void *, void *);
void *zexe_tweedle_fp_to_bigint(void *);
void *zexe_tweedle_fp_of_bigint(void *);
void *zexe_tweedle_fp_to_bigint_raw(void *);
void *zexe_tweedle_fp_to_bigint_raw_noalloc(void *);
void *zexe_tweedle_fp_of_bigint_raw(void *);

void *zexe_tweedle_fp_det_sqrt(void *);
struct det_sqrt_witness zexe_tweedle_fp_det_sqrt_witness(void *);

// Fq vector

void *zexe_tweedle_fp_vector_create();
int zexe_tweedle_fp_vector_length(void *);
void zexe_tweedle_fp_vector_emplace_back(void *, void *);
void *zexe_tweedle_fp_vector_get(void *, int);
void zexe_tweedle_fp_vector_delete(void *);

// Fq CsMat

void *zexe_tweedle_fp_csmat_create(int, int);
void *zexe_tweedle_fp_csmat_append_row(void *, void *, void *);
void zexe_tweedle_fp_csmat_delete(void *);

// Fq constraint matrix

void *zexe_tweedle_fp_constraint_matrix_create();
void zexe_tweedle_fp_constraint_matrix_append_row(void *, void*, void*);
void zexe_tweedle_fp_constraint_matrix_delete(void *);

// Fq oracles
void *zexe_tweedle_fp_oracles_create(void*, void*);
void zexe_tweedle_fp_oracles_delete(void*);

void* zexe_tweedle_fp_oracles_opening_prechallenges(void*);
void* zexe_tweedle_fp_oracles_alpha(void*);
void* zexe_tweedle_fp_oracles_eta_a(void*);
void* zexe_tweedle_fp_oracles_eta_b(void*);
void* zexe_tweedle_fp_oracles_eta_c(void*);
void* zexe_tweedle_fp_oracles_beta1(void*);
void* zexe_tweedle_fp_oracles_beta2(void*);
void* zexe_tweedle_fp_oracles_beta3(void*);
void* zexe_tweedle_fp_oracles_polys(void*);
void* zexe_tweedle_fp_oracles_evals(void*);
void* zexe_tweedle_fp_oracles_digest_before_evaluations(void*);
void* zexe_tweedle_fp_oracles_x_hat_nocopy(void*);

// Fq verifier index
void *zexe_tweedle_fp_verifier_index_create(void*);
void zexe_tweedle_fp_verifier_index_delete(void*);
void *zexe_tweedle_fp_verifier_index_urs(void*);

void *zexe_tweedle_fp_verifier_index_make(
    size_t, size_t, size_t, size_t, size_t,
    void*,
    void*, void*, void*, void*,
    void*, void*, void*, void*,
    void*, void*, void*, void* );

void zexe_tweedle_fp_verifier_index_write(void*, void*);
void* zexe_tweedle_fp_verifier_index_read(void*, void*);

void *zexe_tweedle_fp_verifier_index_a_row_comm(void*);
void *zexe_tweedle_fp_verifier_index_a_col_comm(void*);
void *zexe_tweedle_fp_verifier_index_a_val_comm(void*);
void *zexe_tweedle_fp_verifier_index_a_rc_comm(void*);

void *zexe_tweedle_fp_verifier_index_b_row_comm(void*);
void *zexe_tweedle_fp_verifier_index_b_col_comm(void*);
void *zexe_tweedle_fp_verifier_index_b_val_comm(void*);
void *zexe_tweedle_fp_verifier_index_b_rc_comm(void*);

void *zexe_tweedle_fp_verifier_index_c_row_comm(void*);
void *zexe_tweedle_fp_verifier_index_c_col_comm(void*);
void *zexe_tweedle_fp_verifier_index_c_val_comm(void*);
void *zexe_tweedle_fp_verifier_index_c_rc_comm(void*);

void *zexe_tweedle_fp_verifier_index_vector_create();
int zexe_tweedle_fp_verifier_index_vector_length(void *);
void zexe_tweedle_fp_verifier_index_vector_emplace_back(void *, void *);
void *zexe_tweedle_fp_verifier_index_vector_get(void *, int);
void zexe_tweedle_fp_verifier_index_vector_delete(void *);

// Fq URS
void *zexe_tweedle_fp_urs_create(size_t, size_t, size_t);
void zexe_tweedle_fp_urs_delete(void*);
void zexe_tweedle_fp_urs_write(void*, char*);
void* zexe_tweedle_fp_urs_read(char*);
void* zexe_tweedle_fp_urs_lagrange_commitment(void*, size_t, size_t);
void* zexe_tweedle_fp_urs_commit_evaluations(void*, size_t, void*);
void* zexe_tweedle_fp_urs_b_poly_commitment(void*, void*);
void* zexe_tweedle_fp_urs_h(void*);
void* zexe_tweedle_fp_urs_batch_accumulator_check(void*, void*, void*);

// Fq index

size_t zexe_tweedle_fp_index_domain_h_size(void*);
size_t zexe_tweedle_fp_index_domain_k_size(void*);

void *zexe_tweedle_fp_index_create(void*, void*, void*, size_t, size_t, void*);

void zexe_tweedle_fp_index_delete(void *);

size_t zexe_tweedle_fp_index_num_variables(void*);
size_t zexe_tweedle_fp_index_public_inputs(void*);
size_t zexe_tweedle_fp_index_nonzero_entries(void*);
size_t zexe_tweedle_fp_index_max_degree(void*);

void zexe_tweedle_fp_index_write(void*, char*);
void* zexe_tweedle_fp_index_read(void*, void*, void*, void*, size_t, char*);

// Fp proof vector

void *camlsnark_bn382_fp_proof_vector_create();

int camlsnark_bn382_fp_proof_vector_length(void *);

void camlsnark_bn382_fp_proof_vector_emplace_back(void *, void *);

void *camlsnark_bn382_fp_proof_vector_get(void *, int);

void camlsnark_bn382_fp_proof_vector_delete(void *);

// Fq proof

void zexe_tweedle_fp_proof_delete(void *);
void *zexe_tweedle_fp_proof_create(void *, void* , void*, void*, void*);
bool zexe_tweedle_fp_proof_batch_verify(void *, void*);
bool zexe_tweedle_fp_proof_verify(void *, void*);
void *zexe_tweedle_fp_proof_make(
    void*,

    void*, void*, void*,
    void*, void*, void*,
    void*, void*, void*,

    void*, void*,

    void*, void*, void*, void*, void*,

    void*, void*, void*,
    void*, void*
);

void *zexe_tweedle_fp_proof_w_comm(void *);
void *zexe_tweedle_fp_proof_za_comm(void *);
void *zexe_tweedle_fp_proof_zb_comm(void *);
void *zexe_tweedle_fp_proof_h1_comm(void *);
void *zexe_tweedle_fp_proof_h2_comm(void *);
void *zexe_tweedle_fp_proof_h3_comm(void *);

void *zexe_tweedle_fp_proof_g1_comm_nocopy(void *);
void *zexe_tweedle_fp_proof_g2_comm_nocopy(void *);
void *zexe_tweedle_fp_proof_g3_comm_nocopy(void *);

void *zexe_tweedle_fp_proof_evals_nocopy(void *);

void *zexe_tweedle_fp_proof_proof(void *);

void *zexe_tweedle_fp_proof_sigma2(void *);
void *zexe_tweedle_fp_proof_sigma3(void *);

// Fq proof vector

void *zexe_tweedle_fp_proof_vector_create();

int zexe_tweedle_fp_proof_vector_length(void *);

void zexe_tweedle_fp_proof_vector_emplace_back(void *, void *);

void *zexe_tweedle_fp_proof_vector_get(void *, int);

void zexe_tweedle_fp_proof_vector_delete(void *);

// Fp proof vector

void *camlsnark_bn382_fq_proof_vector_create();

int camlsnark_bn382_fq_proof_vector_length(void *);

void camlsnark_bn382_fq_proof_vector_emplace_back(void *, void *);

void *camlsnark_bn382_fq_proof_vector_get(void *, int);

void camlsnark_bn382_fq_proof_vector_delete(void *);

// Fq proof evaluations

void *zexe_tweedle_fp_proof_evaluations_w(void *);
void *zexe_tweedle_fp_proof_evaluations_za(void *);
void *zexe_tweedle_fp_proof_evaluations_zb(void *);
void *zexe_tweedle_fp_proof_evaluations_h1(void *);
void *zexe_tweedle_fp_proof_evaluations_h2(void *);
void *zexe_tweedle_fp_proof_evaluations_h3(void *);
void *zexe_tweedle_fp_proof_evaluations_g1(void *);
void *zexe_tweedle_fp_proof_evaluations_g2(void *);
void *zexe_tweedle_fp_proof_evaluations_g3(void *);

void *zexe_tweedle_fp_proof_evaluations_make(
    void *, void *, void *,
    void *, void *, void *,
    void *, void *, void *,
    void *, void *, void *,
    void *, void *, void *,
    void *, void *, void *,
    void *, void *, void *
);
void zexe_tweedle_fp_proof_evaluations_delete(void *);

void *zexe_tweedle_fp_proof_evaluations_row_nocopy(void *);
void *zexe_tweedle_fp_proof_evaluations_col_nocopy(void *);
void *zexe_tweedle_fp_proof_evaluations_val_nocopy(void *);
void *zexe_tweedle_fp_proof_evaluations_rc_nocopy(void *);

void *zexe_tweedle_fp_proof_evaluations_triple_0(void *);
void *zexe_tweedle_fp_proof_evaluations_triple_1(void *);
void *zexe_tweedle_fp_proof_evaluations_triple_2(void *);
void zexe_tweedle_fp_proof_evaluations_triple_delete(void *);

// Fq opening proof
void zexe_tweedle_fp_opening_proof_delete(void *);
void *zexe_tweedle_fp_opening_proof_lr(void *);
void *zexe_tweedle_fp_opening_proof_z1(void *);
void *zexe_tweedle_fp_opening_proof_z2(void *);
void *zexe_tweedle_fp_opening_proof_delta(void *);
void *zexe_tweedle_fp_opening_proof_sg(void *);
void zexe_tweedle_fp_opening_proof_delete(void *);

// Fq triple
void *zexe_tweedle_fp_triple_0(void *);
void *zexe_tweedle_fp_triple_1(void *);
void *zexe_tweedle_fp_triple_2(void *);
void *zexe_tweedle_fp_triple_delete(void *);
void *zexe_tweedle_fp_vector_triple_0(void *);
void *zexe_tweedle_fp_vector_triple_1(void *);
void *zexe_tweedle_fp_vector_triple_2(void *);
void zexe_tweedle_fp_vector_triple_delete(void *);

// Fq poly comm
void *zexe_tweedle_fp_poly_comm_shifted(void *);
void *zexe_tweedle_fp_poly_comm_unshifted(void *);
void *zexe_tweedle_fp_poly_comm_make(void *, void *);
void zexe_tweedle_fp_poly_comm_delete(void *);

// dee
void *zexe_tweedle_dee_one();
void *zexe_tweedle_dee_random();
void zexe_tweedle_dee_delete(void *);
void *zexe_tweedle_dee_add(void *, void *);
void *zexe_tweedle_dee_double(void *);
void *zexe_tweedle_dee_scale(void *, void *);
void *zexe_tweedle_dee_sub(void *, void *);
void *zexe_tweedle_dee_negate(void *);
void *zexe_tweedle_dee_to_affine(void *);
void *zexe_tweedle_dee_of_affine(void *);
void *zexe_tweedle_dee_of_affine_coordinates(void *, void*);
void *zexe_tweedle_dee_affine_create(void *, void*);
void *zexe_tweedle_dee_affine_x(void *);
void *zexe_tweedle_dee_affine_y(void *);
bool zexe_tweedle_dee_affine_is_zero(void *);
void zexe_tweedle_dee_affine_delete(void *);

void *zexe_tweedle_dee_affine_vector_create();
int zexe_tweedle_dee_affine_vector_length(void *);
void zexe_tweedle_dee_affine_vector_emplace_back(void *, void *);
void *zexe_tweedle_dee_affine_vector_get(void *, int);
void zexe_tweedle_dee_affine_vector_delete(void *);

void *zexe_tweedle_dee_affine_pair_0(void *);
void *zexe_tweedle_dee_affine_pair_1(void *);
void *zexe_tweedle_dee_affine_pair_make(void *, void*);
void zexe_tweedle_dee_affine_pair_delete(void *);

void *zexe_tweedle_dee_affine_pair_vector_create();
int zexe_tweedle_dee_affine_pair_vector_length(void *);
void zexe_tweedle_dee_affine_pair_vector_emplace_back(void *, void *);
void *zexe_tweedle_dee_affine_pair_vector_get(void *, int);
void zexe_tweedle_dee_affine_pair_vector_delete(void *);

// Plonk

// Fp index stubs
size_t zexe_tweedle_plonk_fp_index_domain_d1_size(void *);
size_t zexe_tweedle_plonk_fp_index_domain_d4_size(void *);
size_t zexe_tweedle_plonk_fp_index_domain_d8_size(void *);

void *zexe_tweedle_plonk_fp_index_create(void *, size_t, void *);
void zexe_tweedle_plonk_fp_index_delete(void *);

size_t zexe_tweedle_plonk_fp_index_max_degree(void *);
size_t zexe_tweedle_plonk_fp_index_public_inputs(void *);

// Fp verifier index stubs
void *zexe_tweedle_plonk_fp_verifier_index_create(void *);

void *zexe_tweedle_plonk_fp_verifier_index_urs(void *);

void *zexe_tweedle_plonk_fp_verifier_index_make(
    size_t max_poly_size,
    size_t max_quot_size,
    void *urs,
    void *sigma_comm0,
    void *sigma_comm1,
    void *sigma_comm2,
    void *ql_comm,
    void *qr_comm,
    void *qo_comm,
    void *qm_comm,
    void *qc_comm,
    void *rcm_comm0,
    void *rcm_comm1,
    void *rcm_comm2,
    void *psm_comm,
    void *add_comm,
    void *mul1_comm,
    void *mul2_comm,
    void *emul1_comm,
    void *emul2_comm,
    void *emul3_comm,
    void *r,
    void *o);

void zexe_tweedle_plonk_fp_verifier_index_delete(void *x);

void *zexe_tweedle_plonk_fp_verifier_index_sigma_comm_0(void *);
void *zexe_tweedle_plonk_fp_verifier_index_sigma_comm_1(void *);
void *zexe_tweedle_plonk_fp_verifier_index_sigma_comm_2(void *);
void *zexe_tweedle_plonk_fp_verifier_index_ql_comm(void *);
void *zexe_tweedle_plonk_fp_verifier_index_qr_comm(void *);
void *zexe_tweedle_plonk_fp_verifier_index_qo_comm(void *);
void *zexe_tweedle_plonk_fp_verifier_index_qm_comm(void *);
void *zexe_tweedle_plonk_fp_verifier_index_qc_comm(void *);
void *zexe_tweedle_plonk_fp_verifier_index_rcm_comm_0(void *);
void *zexe_tweedle_plonk_fp_verifier_index_rcm_comm_1(void *);
void *zexe_tweedle_plonk_fp_verifier_index_rcm_comm_2(void *);
void *zexe_tweedle_plonk_fp_verifier_index_psm_comm(void *);
void *zexe_tweedle_plonk_fp_verifier_index_add_comm(void *);
void *zexe_tweedle_plonk_fp_verifier_index_mul1_comm(void *);
void *zexe_tweedle_plonk_fp_verifier_index_mul2_comm(void *);
void *zexe_tweedle_plonk_fp_verifier_index_emul1_comm(void *);
void *zexe_tweedle_plonk_fp_verifier_index_emul2_comm(void *);
void *zexe_tweedle_plonk_fp_verifier_index_emul3_comm(void *);
void *zexe_tweedle_plonk_fp_verifier_index_r(void *);
void *zexe_tweedle_plonk_fp_verifier_index_o(void *);

// Fp proof
void *zexe_tweedle_plonk_fp_proof_create(
    void *index,
    void *primary_input,
    void *auxiliary_input,
    void *prev_challenges,
    void *prev_sgs);

bool zexe_tweedle_plonk_fp_proof_verify(void *index, void *proof);

bool zexe_tweedle_plonk_fp_proof_batch_verify(void *index, void *proofs);

void *zexe_tweedle_plonk_fp_proof_make(
    void *primary_input,

    void *l_comm,
    void *r_comm,
    void *o_comm,
    void *z_comm,
    void *t_comm,

    void *lr,
    void *z1,
    void *z2,
    void *delta,
    void *sg,

    void *evals0,
    void *evals1,
    void *prev_challenges,
    void *prev_sgs);

void *zexe_tweedle_plonk_fp_proof_delete(void *);

void *zexe_tweedle_plonk_fp_proof_l_comm(void *);
void *zexe_tweedle_plonk_fp_proof_r_comm(void *);
void *zexe_tweedle_plonk_fp_proof_o_comm(void *);
void *zexe_tweedle_plonk_fp_proof_z_comm(void *);
void *zexe_tweedle_plonk_fp_proof_t_comm(void *);
void *zexe_tweedle_plonk_fp_proof_proof(void *);
void *zexe_tweedle_plonk_fp_proof_evals_nocopy(void *);

// Fp proof vector

void *zexe_tweedle_plonk_fp_proof_vector_create(void);
int zexe_tweedle_plonk_fp_proof_vector_length(void *);
void zexe_tweedle_plonk_fp_proof_vector_emplace_back(void *v, void *x);
void *zexe_tweedle_plonk_fp_proof_vector_get(void *v, int i);
void zexe_tweedle_plonk_fp_proof_vector_delete(void *);

// Fp opening proof
void zexe_tweedle_plonk_fp_opening_proof_delete(void *);

void *zexe_tweedle_plonk_fp_opening_proof_sg(void *);
void *zexe_tweedle_plonk_fp_opening_proof_lr(void *);
void *zexe_tweedle_plonk_fp_opening_proof_z1(void *);
void *zexe_tweedle_plonk_fp_opening_proof_z2(void *);
void *zexe_tweedle_plonk_fp_opening_proof_delta(void *);

// Fp proof evaluations

void *zexe_tweedle_plonk_fp_proof_evaluations_l(void *);
void *zexe_tweedle_plonk_fp_proof_evaluations_r(void *);
void *zexe_tweedle_plonk_fp_proof_evaluations_o(void *);
void *zexe_tweedle_plonk_fp_proof_evaluations_z(void *);
void *zexe_tweedle_plonk_fp_proof_evaluations_t(void *);
void *zexe_tweedle_plonk_fp_proof_evaluations_f(void *);
void *zexe_tweedle_plonk_fp_proof_evaluations_sigma1(void *);
void *zexe_tweedle_plonk_fp_proof_evaluations_sigma2(void *);

void *zexe_tweedle_plonk_fp_proof_evaluations_make(
    void *l,
    void *r,
    void *o,
    void *z,
    void *t,
    void *f,
    void *sigma1,
    void *sigma2);
void zexe_tweedle_plonk_fp_proof_evaluations_delete(void *);

void *zexe_tweedle_plonk_fp_proof_evaluations_pair_0(void *);
void *zexe_tweedle_plonk_fp_proof_evaluations_pair_1(void *);
void zexe_tweedle_plonk_fp_proof_evaluations_pair_delete(void *);

// Fp oracles

void *zexe_tweedle_plonk_fp_oracles_create(void *index, void *proof);

void *zexe_tweedle_plonk_fp_oracles_opening_prechallenges(void *);
void *zexe_tweedle_plonk_fp_oracles_p_eval1(void *);
void *zexe_tweedle_plonk_fp_oracles_p_eval2(void *);
void *zexe_tweedle_plonk_fp_oracles_alpha(void *);
void *zexe_tweedle_plonk_fp_oracles_beta(void *);
void *zexe_tweedle_plonk_fp_oracles_gamma(void *);
void *zexe_tweedle_plonk_fp_oracles_zeta(void *);
void *zexe_tweedle_plonk_fp_oracles_v(void *);
void *zexe_tweedle_plonk_fp_oracles_u(void *);
void* zexe_tweedle_plonk_fp_oracles_digest_before_evaluations(void*);
void zexe_tweedle_plonk_fp_oracles_delete(void *);

// Fp gate vector
void *zexe_tweedle_plonk_fp_gate_vector_create(void);
int zexe_tweedle_plonk_fp_gate_vector_length(void *);
void zexe_tweedle_plonk_fp_gate_vector_delete(void *);
void zexe_tweedle_plonk_fp_gate_vector_add(
    void *v,
    int gate_type,
    size_t row,
    size_t lrow,
    int lcol,
    size_t rrow,
    int rcol,
    size_t orow,
    int ocol,
    void *c);

void zexe_tweedle_plonk_fp_gate_vector_add_zero(
    void *v, size_t row, size_t lrow, int lcol, size_t rrow, int rcol, size_t orow,
    int ocol, void *c);

void zexe_tweedle_plonk_fp_gate_vector_add_generic(
    void *v, size_t row, size_t lrow, int lcol, size_t rrow, int rcol, size_t orow,
    int ocol, void *c);

void zexe_tweedle_plonk_fp_gate_vector_add_poseidon(
    void *v, size_t row, size_t lrow, int lcol, size_t rrow, int rcol, size_t orow,
    int ocol, void *c);

void zexe_tweedle_plonk_fp_gate_vector_add_add1(
    void *v, size_t row, size_t lrow, int lcol, size_t rrow, int rcol, size_t orow,
    int ocol, void *c);

void zexe_tweedle_plonk_fp_gate_vector_add_add2(
    void *v, size_t row, size_t lrow, int lcol, size_t rrow, int rcol, size_t orow,
    int ocol, void *c);

void zexe_tweedle_plonk_fp_gate_vector_add_vbmul1(
    void *v, size_t row, size_t lrow, int lcol, size_t rrow, int rcol, size_t orow,
    int ocol, void *c);

void zexe_tweedle_plonk_fp_gate_vector_add_vbmul2(
    void *v, size_t row, size_t lrow, int lcol, size_t rrow, int rcol, size_t orow,
    int ocol, void *c);

void zexe_tweedle_plonk_fp_gate_vector_add_vbmul3(
    void *v, size_t row, size_t lrow, int lcol, size_t rrow, int rcol, size_t orow,
    int ocol, void *c);

void zexe_tweedle_plonk_fp_gate_vector_add_endomul1(
    void *v, size_t row, size_t lrow, int lcol, size_t rrow, int rcol, size_t orow,
    int ocol, void *c);

void zexe_tweedle_plonk_fp_gate_vector_add_endomul2(
    void *v, size_t row, size_t lrow, int lcol, size_t rrow, int rcol, size_t orow,
    int ocol, void *c);

void zexe_tweedle_plonk_fp_gate_vector_add_endomul3(
    void *v, size_t row, size_t lrow, int lcol, size_t rrow, int rcol, size_t orow,
    int ocol, void *c);

void zexe_tweedle_plonk_fp_gate_vector_add_endomul4(
    void *v, size_t row, size_t lrow, int lcol, size_t rrow, int rcol, size_t orow,
    int ocol, void *c);

// Fp constraint system
void *zexe_tweedle_plonk_fp_constraint_system_create(void *, size_t);
void zexe_tweedle_plonk_fp_constraint_system_delete(void *);

// Fq index stubs
size_t zexe_tweedle_plonk_fq_index_domain_d1_size(void *);
size_t zexe_tweedle_plonk_fq_index_domain_d4_size(void *);
size_t zexe_tweedle_plonk_fq_index_domain_d8_size(void *);

void *zexe_tweedle_plonk_fq_index_create(void *, size_t, void *);
void zexe_tweedle_plonk_fq_index_delete(void *);

size_t zexe_tweedle_plonk_fq_index_max_degree(void *);
size_t zexe_tweedle_plonk_fq_index_public_inputs(void *);

// Fq verifier index stubs
void *zexe_tweedle_plonk_fq_verifier_index_create(void *);

void *zexe_tweedle_plonk_fq_verifier_index_urs(void *);

void *zexe_tweedle_plonk_fq_verifier_index_make(
    size_t max_poly_size,
    size_t max_quot_size,
    void *urs,
    void *sigma_comm0,
    void *sigma_comm1,
    void *sigma_comm2,
    void *ql_comm,
    void *qr_comm,
    void *qo_comm,
    void *qm_comm,
    void *qc_comm,
    void *rcm_comm0,
    void *rcm_comm1,
    void *rcm_comm2,
    void *psm_comm,
    void *add_comm,
    void *mul1_comm,
    void *mul2_comm,
    void *emul1_comm,
    void *emul2_comm,
    void *emul3_comm,
    void *r,
    void *o);

void zexe_tweedle_plonk_fq_verifier_index_delete(void *x);

void *zexe_tweedle_plonk_fq_verifier_index_sigma_comm_0(void *);
void *zexe_tweedle_plonk_fq_verifier_index_sigma_comm_1(void *);
void *zexe_tweedle_plonk_fq_verifier_index_sigma_comm_2(void *);
void *zexe_tweedle_plonk_fq_verifier_index_ql_comm(void *);
void *zexe_tweedle_plonk_fq_verifier_index_qr_comm(void *);
void *zexe_tweedle_plonk_fq_verifier_index_qo_comm(void *);
void *zexe_tweedle_plonk_fq_verifier_index_qm_comm(void *);
void *zexe_tweedle_plonk_fq_verifier_index_qc_comm(void *);
void *zexe_tweedle_plonk_fq_verifier_index_rcm_comm_0(void *);
void *zexe_tweedle_plonk_fq_verifier_index_rcm_comm_1(void *);
void *zexe_tweedle_plonk_fq_verifier_index_rcm_comm_2(void *);
void *zexe_tweedle_plonk_fq_verifier_index_psm_comm(void *);
void *zexe_tweedle_plonk_fq_verifier_index_add_comm(void *);
void *zexe_tweedle_plonk_fq_verifier_index_mul1_comm(void *);
void *zexe_tweedle_plonk_fq_verifier_index_mul2_comm(void *);
void *zexe_tweedle_plonk_fq_verifier_index_emul1_comm(void *);
void *zexe_tweedle_plonk_fq_verifier_index_emul2_comm(void *);
void *zexe_tweedle_plonk_fq_verifier_index_emul3_comm(void *);
void *zexe_tweedle_plonk_fq_verifier_index_r(void *);
void *zexe_tweedle_plonk_fq_verifier_index_o(void *);

// Fq proof
void *zexe_tweedle_plonk_fq_proof_create(
    void *index,
    void *primary_input,
    void *auxiliary_input,
    void *prev_challenges,
    void *prev_sgs);

bool zexe_tweedle_plonk_fq_proof_verify(void *index, void *proof);

bool zexe_tweedle_plonk_fq_proof_batch_verify(void *index, void *proofs);

void *zexe_tweedle_plonk_fq_proof_make(
    void *primary_input,

    void *l_comm,
    void *r_comm,
    void *o_comm,
    void *z_comm,
    void *t_comm,

    void *lr,
    void *z1,
    void *z2,
    void *delta,
    void *sg,

    void *evals0,
    void *evals1,
    void *prev_challenges,
    void *prev_sgs);

void *zexe_tweedle_plonk_fq_proof_delete(void *);

void *zexe_tweedle_plonk_fq_proof_l_comm(void *);
void *zexe_tweedle_plonk_fq_proof_r_comm(void *);
void *zexe_tweedle_plonk_fq_proof_o_comm(void *);
void *zexe_tweedle_plonk_fq_proof_z_comm(void *);
void *zexe_tweedle_plonk_fq_proof_t_comm(void *);
void *zexe_tweedle_plonk_fq_proof_proof(void *);
void *zexe_tweedle_plonk_fq_proof_evals_nocopy(void *);

// Fq proof vector

void *zexe_tweedle_plonk_fq_proof_vector_create(void);
int zexe_tweedle_plonk_fq_proof_vector_length(void *);
void zexe_tweedle_plonk_fq_proof_vector_emplace_back(void *v, void *x);
void *zexe_tweedle_plonk_fq_proof_vector_get(void *v, int i);
void zexe_tweedle_plonk_fq_proof_vector_delete(void *);

// Fq opening proof
void zexe_tweedle_plonk_fq_opening_proof_delete(void *);

void *zexe_tweedle_plonk_fq_opening_proof_sg(void *);
void *zexe_tweedle_plonk_fq_opening_proof_lr(void *);
void *zexe_tweedle_plonk_fq_opening_proof_z1(void *);
void *zexe_tweedle_plonk_fq_opening_proof_z2(void *);
void *zexe_tweedle_plonk_fq_opening_proof_delta(void *);

// Fq proof evaluations

void *zexe_tweedle_plonk_fq_proof_evaluations_l(void *);
void *zexe_tweedle_plonk_fq_proof_evaluations_r(void *);
void *zexe_tweedle_plonk_fq_proof_evaluations_o(void *);
void *zexe_tweedle_plonk_fq_proof_evaluations_z(void *);
void *zexe_tweedle_plonk_fq_proof_evaluations_t(void *);
void *zexe_tweedle_plonk_fq_proof_evaluations_f(void *);
void *zexe_tweedle_plonk_fq_proof_evaluations_sigma1(void *);
void *zexe_tweedle_plonk_fq_proof_evaluations_sigma2(void *);

void *zexe_tweedle_plonk_fq_proof_evaluations_make(
    void *l,
    void *r,
    void *o,
    void *z,
    void *t,
    void *f,
    void *sigma1,
    void *sigma2);
void zexe_tweedle_plonk_fq_proof_evaluations_delete(void *);

void *zexe_tweedle_plonk_fq_proof_evaluations_pair_0(void *);
void *zexe_tweedle_plonk_fq_proof_evaluations_pair_1(void *);
void zexe_tweedle_plonk_fq_proof_evaluations_pair_delete(void *);

// Fq oracles

void *zexe_tweedle_plonk_fq_oracles_create(void *index, void *proof);

void *zexe_tweedle_plonk_fq_oracles_opening_prechallenges(void *);
void *zexe_tweedle_plonk_fq_oracles_p_eval1(void *);
void *zexe_tweedle_plonk_fq_oracles_p_eval2(void *);
void *zexe_tweedle_plonk_fq_oracles_alpha(void *);
void *zexe_tweedle_plonk_fq_oracles_beta(void *);
void *zexe_tweedle_plonk_fq_oracles_gamma(void *);
void *zexe_tweedle_plonk_fq_oracles_zeta(void *);
void *zexe_tweedle_plonk_fq_oracles_v(void *);
void *zexe_tweedle_plonk_fq_oracles_u(void *);
void* zexe_tweedle_plonk_fq_oracles_digest_before_evaluations(void*);
void zexe_tweedle_plonk_fq_oracles_delete(void *);

// Fq gate vector
void *zexe_tweedle_plonk_fq_gate_vector_create(void);
int zexe_tweedle_plonk_fq_gate_vector_length(void *);
void zexe_tweedle_plonk_fq_gate_vector_delete(void *);
void zexe_tweedle_plonk_fq_gate_vector_add(
    void *v,
    int gate_type,
    size_t row,
    size_t lrow,
    int lcol,
    size_t rrow,
    int rcol,
    size_t orow,
    int ocol,
    void *c);

void zexe_tweedle_plonk_fq_gate_vector_add_zero(
    void *v, size_t row, size_t lrow, int lcol, size_t rrow, int rcol, size_t orow,
    int ocol, void *c);

void zexe_tweedle_plonk_fq_gate_vector_add_generic(
    void *v, size_t row, size_t lrow, int lcol, size_t rrow, int rcol, size_t orow,
    int ocol, void *c);

void zexe_tweedle_plonk_fq_gate_vector_add_poseidon(
    void *v, size_t row, size_t lrow, int lcol, size_t rrow, int rcol, size_t orow,
    int ocol, void *c);

void zexe_tweedle_plonk_fq_gate_vector_add_add1(
    void *v, size_t row, size_t lrow, int lcol, size_t rrow, int rcol, size_t orow,
    int ocol, void *c);

void zexe_tweedle_plonk_fq_gate_vector_add_add2(
    void *v, size_t row, size_t lrow, int lcol, size_t rrow, int rcol, size_t orow,
    int ocol, void *c);

void zexe_tweedle_plonk_fq_gate_vector_add_vbmul1(
    void *v, size_t row, size_t lrow, int lcol, size_t rrow, int rcol, size_t orow,
    int ocol, void *c);

void zexe_tweedle_plonk_fq_gate_vector_add_vbmul2(
    void *v, size_t row, size_t lrow, int lcol, size_t rrow, int rcol, size_t orow,
    int ocol, void *c);

void zexe_tweedle_plonk_fq_gate_vector_add_vbmul3(
    void *v, size_t row, size_t lrow, int lcol, size_t rrow, int rcol, size_t orow,
    int ocol, void *c);

void zexe_tweedle_plonk_fq_gate_vector_add_endomul1(
    void *v, size_t row, size_t lrow, int lcol, size_t rrow, int rcol, size_t orow,
    int ocol, void *c);

void zexe_tweedle_plonk_fq_gate_vector_add_endomul2(
    void *v, size_t row, size_t lrow, int lcol, size_t rrow, int rcol, size_t orow,
    int ocol, void *c);

void zexe_tweedle_plonk_fq_gate_vector_add_endomul3(
    void *v, size_t row, size_t lrow, int lcol, size_t rrow, int rcol, size_t orow,
    int ocol, void *c);

void zexe_tweedle_plonk_fq_gate_vector_add_endomul4(
    void *v, size_t row, size_t lrow, int lcol, size_t rrow, int rcol, size_t orow,
    int ocol, void *c);

// Fq constraint system
void *zexe_tweedle_plonk_fq_constraint_system_create(void *, size_t);
void zexe_tweedle_plonk_fq_constraint_system_delete(void *);
