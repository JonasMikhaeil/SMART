data {
  int<lower=0> N; // number of studies
  int<lower=1> m; // number of methods
  vector[N] y; // study outcomes
  vector[N] sigma_hat; // study reported standard error
  vector[m] sig_m; // belief about method's m bias. (In draft kappa_m)
  matrix[N,m] label; // dummy matrix encoding whether study used method m
}

parameters {
  real mu;
  real<lower=0> sig;
  vector[N] eps_raw;
  vector[m] b_raw;
}

transformed parameters {
  // Non-centered versions of the original latent variables. 
  vector[m] b = sig_m .* b_raw;
  vector[N] eps = label * b + sig * eps_raw;
}

model {
  // The likelihood and priors are algebraically identical to SMART.stan:
  //   b[i] ~ normal(0, sig_m[i])
  //   eps   ~ normal(label * b, sig)
  // but sampling takes place on independent standard-normal coordinates.
  y ~ normal(mu + eps, sigma_hat);
  mu ~ normal(0, 3);
  sig ~ normal(0, 2.5);
  eps_raw ~ std_normal();
  b_raw ~ std_normal();
}
