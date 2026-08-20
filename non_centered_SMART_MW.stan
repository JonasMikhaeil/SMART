data {
  int<lower=0> N;
  int<lower=1> m; // number of methods
  int<lower=1> m2; // number of studies

  vector[N] y;
  vector[N] sigma_hat;
  vector[m] sig_m;
  matrix[N,m] label;
  real prior_mu;
  real prior_sd;
  array[N] int<lower=1, upper=m2> study_no;
}

parameters {
  real mu;
  real<lower=0> sig;
  vector[m2] eps_raw;
  vector[m] b_raw;
}

transformed parameters {
  // Non-centered versions of the original latent variables. 
  vector[m2] eps = sig * eps_raw;
  vector[m] b = sig_m .* b_raw;
}

model {
  // This is algebraically identical to SMART_MW.stan, expressed in
  // independent standard-normal coordinates for more favorable HMC geometry.
  for (i in 1:N) {
    y[i] ~ normal(mu + eps[study_no[i]] + label[i] * b, sigma_hat[i]);
  }
  mu ~ normal(prior_mu, prior_sd);
  sig ~ normal(0, 2.5);
  eps_raw ~ std_normal();
  b_raw ~ std_normal();
}
