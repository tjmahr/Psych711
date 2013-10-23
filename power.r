# Lifted from: http://www.quantpsy.org/rmsea/rmsea.htm

# Power analysis
compute_power <- function(df, n, rmseaa, rmsea0 = 0.05, alpha = 0.05) {
  # Set non-centrality parameters
  ncp <- function(rmsea, this_df = df, this_n = n) {
    ncp <- (this_n - 1) * this_df * rmsea ^ 2
    stopifnot(ncp >= 0)
    ncp
  }
  ncp0 <- ncp(rmsea0)
  ncpa <- ncp(rmseaa)
  
  # Compute power
  if (rmsea0 < rmseaa) {
    hypothesis <- "Close-fit hypothesis"
    cval <- qchisq(alpha, df, ncp = ncp0, lower.tail = FALSE)
    pow <- pchisq(cval, df, ncp = ncpa, lower.tail = FALSE)
  }
  if (rmsea0 > rmseaa) {
    hypothesis <- "Not-close-fit hypothesis"
    cval <- qchisq(1 - alpha, df, ncp = ncp0, lower.tail = FALSE)
    pow <- 1 - pchisq(cval, df, ncp = ncpa, lower.tail = FALSE)
  }
  
  structure(list(df = df,
       n = n,
       rmsea0 = rmsea0,
       rmseaa = rmseaa,
       alpha = alpha,
       hypothesis = hypothesis,
       power = pow), class = "PowerSummary")
}

print.PowerSummary <- function(...) str(...)


not_close_fit <- function(df, n, rmseaa = 0.01, rmsea0 = 0.05, alpha = 0.05) {
  if (rmseaa >= rmsea0) stop("RMSEA-Alt should be less than RMSEA-0")
  compute_power(df, n, rmseaa, rmsea0, alpha)
}


close_fit <- function(df, n, rmseaa = 0.08, rmsea0 = 0.05, alpha = 0.05) {
  if (rmseaa <= rmsea0) stop("RMSEA-Alt should be greater than RMSEA-0")
  compute_power(df, n, rmseaa, rmsea0, alpha)
}



#' Computation of minimum sample size for test of fit
#' 
#' @param df degrees of freedom  
#' @param rmseaa alternative hypothesized RMSEA
#' @param rmsea0 null hypothesized RMSEA, default = 0.05
#' @param desired desired power level, default = 0.80
#' @param alpha alpha level, default = 0.05
#' @return 
compute_sample_size <- function(df, rmseaa, rmsea0 = 0.05, desired = 0.8, alpha = 0.05) {
  # initialize values
  pow <- 0.0
  n <- 0.0
  
  # begin loop for finding initial level of n
  while (pow < desired) {
    n <- n + 100
    summary <- compute_power(df, n, rmseaa, rmsea0, alpha)
    pow <- summary$power
  }
  
  # We probably overshot our estimate. Therefore we need to tick back down from
  # the overestimated n.
  direction <- -1
  new_n <- n
  interval <- 200
  pow_diff <- pow - desired
  
  while (.001 < pow_diff) {
    interval <- interval * .5
    new_n <- new_n + direction * interval * .5
    
    # Get power from new guess
    summary <- compute_power(df, new_n, rmseaa, rmsea0, alpha)
    pow <- summary$power
    pow_diff <- abs(pow - desired)
    
    # Change direction if necessary
    if (pow < desired) direction <- 1
    if (pow > desired) direction <- -1
  }
  # Bundle into a power_summmary
  compute_power(df, new_n, rmseaa, rmsea0, alpha)
}
