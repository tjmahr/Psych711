## Tristan Mahr
## Reading 10 exercises
## Nov. 19, 2013
## Psych 711

## 12. Fit the model in Figure 10.5 to the data in Table 10.5. 
library(lavaan)

# I used dput(...) to get the text version of the correlation matrix after I
# loaded it into R. I did the same thing with the SD vector. dput is one way to
# embed data directly into an R script.
d <- structure(
  c(1, 0.44, 0.69, 0.37, 0.23, 0.12, 0.09, 0.03, 0.44, 1, 0.54, 0.08, 0.05, 
    0.08, 0.06, 0.02, 0.69, 0.54, 1, 0.24, 0.26, 0.08, 0.04, -0.02, 0.37, 0.08, 
    0.24, 1, 0.29, 0.08, 0.01, -0.07, 0.23, 0.05, 0.26, 0.29, 1, -0.03, -0.02, 
    -0.11, 0.12, 0.08, 0.08, 0.08, -0.03, 1, 0.38, 0.37, 0.09, 0.06, 0.04, 0.01, 
    -0.02, 0.38, 1, 0.46, 0.03, 0.02, -0.02, -0.07, -0.11, 0.37, 0.46, 1), .Dim = c(8L, 8L), 
  .Dimnames = list(c("acculscl", "genstat", "perlife", "educ", "income", "interper", "job", "depscl"), 
                   c("acculscl", "genstat", "perlife", "educ", "income", "interper", "job", "depscl")))

sd <- structure(c(3.119, 3.279, 2.408, 3.27, 3.44, 2.961, 3.604, 3.194), 
                .Names = c("acculscl", "genstat", "perlife", "educ", "income", "interper", "job", "depscl"))

# lavaan has its own cor2cov function
d <- cor2cov(R = d, sds = sd)

# Generate the model
m1 <- "
  Acculturation =~ acculscl + genstat + perlife
  SES =~ educ + income
  Stress =~ interper + job
  
  Stress ~ Acculturation
  depscl ~ Stress + SES
  
  genstat ~~ perlife"

fit1 <- sem(m1, sample.cov = d, sample.nobs = 983, likelihood = "wishart")
summary(fit1, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)




## 13. Now respecify this model with depression as a latent variable with a
## single indicator. Compare the output to that of the previous model: every
## single value should be identical!

m2 <- "
  Acculturation =~ acculscl + genstat + perlife
  SES =~ educ + income
  Stress =~ interper + job
  Depression =~ depscl
  
  Stress ~ Acculturation
  Depression ~ Stress + SES
  
  genstat ~~ perlife
  depscl ~~ 0*depscl"

fit2 <- sem(m2, sample.cov = d, sample.nobs = 983, likelihood = "wishart")
summary(fit2, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)

# The two models have the same estimates.
c1 <- data.frame(as.list(coef(fit1)))
c2 <- data.frame(as.list(coef(fit2)))
t(merge(c1, c2, all = TRUE))




## 14. Now estimate the same model but this time the variance of the measurement
## error of the single indicator should be fixed to 30% of the (rescaled)
## variance of the manifest depression variable (3.06).

m3 <- "
  Acculturation =~ acculscl + genstat + perlife
  SES =~ educ + income
  Stress =~ interper + job
  Depression =~ depscl
  
  Stress ~ Acculturation
  Depression ~ Stress + SES
  
  genstat ~~ perlife
  depscl ~~ 3.06*depscl"

fit3 <- sem(m3, sample.cov = d, sample.nobs = 983, likelihood = "wishart")
summary(fit3, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)


## Once you are done estimating the model, compare the output to that of the
## previous model: what is identical and what has changed? Look especially at
## (a) the path from stress to depression, (b) the path from SES to depression,
## and (c) the variance of the disturbance associated with the latent variable
## "depression". Finally, read the Rex Kline's explanations on page 383. Be
## prepared to explain to a novice what is going on here.

# Only one unstandardized (free parameter) estimate has changed.
c2 <- data.frame(as.list(round(coef(fit2), 3)))
c3 <- data.frame(as.list(round(coef(fit3), 3)))
coefs <- data.frame(t(merge(c2, c3, all = TRUE)))
names(coefs) <- c("C3", "C2")
subset(coefs, C2 != C3)

# But several standardized estimates have changed. Updating lavaan broke these.

# standardized <- inspect(fit3, "std.coef")[1:4]
# names(standardized)[4] <- "Fit3"
# standardized <- cbind(standardized, Fit2 = inspect(fit2, "std.coef")$est.std)
# subset(standardized, round(Fit3, 3) != round(Fit2, 3))

# The standardized estimate from Stress to Depression increased and the
# standardized estimate from SES increased in magnitude.

inspect(fit2, "rsquare")
inspect(fit3, "rsquare")

# The explained variance in depscl decrease by .30 while the explained variance
# in Depression increased by .21.
library(semPlot)
semPaths(fit2, whatLabels = "par")
semPaths(fit2, whatLabels = "std")

semPaths(fit3, whatLabels = "par")
semPaths(fit3, whatLabels = "std")


# For the novice: In the original model, we assumed we were measuring the 
# depression factor with no measurement error. All of this error was being 
# captured in the disturbance for the Depression factor. By shifting some of
# that unexplained variance into measurement error, the disturbance variance and
# the structural paths to this factor will be estimated controlling for
# measurement error in the factor. 
