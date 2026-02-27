
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
  vector[m2] eps;
  
  vector[m] b;

}

model {
 vector[N] bias = label*b;
 for(i in 1:N) {
  y[i] ~ normal(mu + eps[study_no[i]] +bias[i], sigma_hat[i]);
 }
  eps ~ normal(0,sig);
  sig~normal(0,2.5);
  mu~normal(prior_mu,prior_sd);
  for (i in 1:m){
    b[i]~normal(0,sig_m[i]);
  }
}



