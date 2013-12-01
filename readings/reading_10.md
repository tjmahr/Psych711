Questions about Rex Kline's book (for Tues., Nov. 19)
===============================================================================

> Read chapter 10 of Kline's book and be prepared to answer the questions below. Please also do the data analysis exercise described below (and send me your R script by Tuesday 9 am). 


```r
library(lavaan)
d <- structure(c(1, 0.44, 0.69, 0.37, 0.23, 0.12, 0.09, 0.03, 0.44, 1, 0.54, 
    0.08, 0.05, 0.08, 0.06, 0.02, 0.69, 0.54, 1, 0.24, 0.26, 0.08, 0.04, -0.02, 
    0.37, 0.08, 0.24, 1, 0.29, 0.08, 0.01, -0.07, 0.23, 0.05, 0.26, 0.29, 1, 
    -0.03, -0.02, -0.11, 0.12, 0.08, 0.08, 0.08, -0.03, 1, 0.38, 0.37, 0.09, 
    0.06, 0.04, 0.01, -0.02, 0.38, 1, 0.46, 0.03, 0.02, -0.02, -0.07, -0.11, 
    0.37, 0.46, 1), .Dim = c(8L, 8L), .Dimnames = list(c("acculscl", "genstat", 
    "perlife", "educ", "income", "interper", "job", "depscl"), c("acculscl", 
    "genstat", "perlife", "educ", "income", "interper", "job", "depscl")))
sd <- structure(c(3.119, 3.279, 2.408, 3.27, 3.44, 2.961, 3.604, 3.194), .Names = c("acculscl", 
    "genstat", "perlife", "educ", "income", "interper", "job", "depscl"))
# lavaan has its own cor2cov function
d <- cor2cov(R = d, sds = sd)
```


Readings
-------------------------------------------------------------------------------

### 1. Kline suggests that we should analyze a structural regression model in a two-step process. Describe this process.

1. Specify the SR first as a measurement model to determine the indicators adequately measure the factors.
2. Compare the fits of the SR models to the CFA model from step 1. An SR model with a just-identified structural part will have the same estimates as the CFA model.

If the factor loadings change substantially when different SR paths are modeled, the measurement model lacks invariance, leading to "interpretational confoundings".



### 2. How do we compute the percentage of explained variance in endogenous factors? 

> According to Kline, the model shown in Figure 10.3 explains 24.5% of the variance of the job satisfaction factor. How did he get this number?

```
R^2 = 1 - (disturbance variance / model-implied variance)
```


```r
1 - (0.467/0.618)
```

```
## [1] 0.2443
```




### 3. Figure 10.3 

> Kline suggests to retain the just-identified structural regression model shown in Figure 10.3 and not the over-identified structural regression model hypothesized by Houghton and Jinkerson (2007, see Figure 5.9, p. 120). Explain his reasoning.

When the two paths were removed from the just-identified model, Kline observed some "localized fit problems" in the correlation residuals (e.g., between Work2 and Imagery, Beliefs and Mood1/Mood2).



### 4. Power

> It turns out that the power for the model shown in Figure 10.3 is quite satisfactory. And yet, the dataset contains only 263 observations. How come that this model has satisfactory power despite the relatively small number of observations?

The relatively high number of dfs (47) makes up for the small sample size. Using a lot of indicators in your measurement models buys you a lot of additional degrees of freedoms.



### 5. Equivalent models

> Be prepared to draw on the blackboard an equivalent model of the model shown in Figure 5.9 (p. 120). Make sure that your new equivalent looks rather different than the original model. Justify why your model is equivalent.



### 6. Measurement error 

> If it is possible to take into account measurement error by specifying a latent variable with a single indicator (and then fixing the variance of the measurement error associated with this indicator at some a priori value > 0), why don't we adopt this approach routinely in path analysis?

Because we need to have a good estimate for the measurement error. And because you can get identification problems.



### 7. Describe the differences between "reflective measurement" and "formative measurement".

* In formative measurement, the indicators cause the factors. For example, components in a composite measurement form the _latent composite_. (Income and education cause SES in some respect.) These indicators are not interchangable, because it would fundamentally alter the make-up of the factor to change its constituent parts. These indicators need not be positively correlated. Cause indicators are exogenous variables that are free to covary; they do not have measurement error. "Measurement error is represented at the construct level, not at the indicator level as in reflective measurement" (p. 281). The measurement errors are captured in the disturbance.
* In reflective measurement, the indicators are caused by the factors. You can interchange and swap around equally reliable reflective indicators without changing the definition of the factor. These indicators should also have positive correlations. 

[TODO: Note where dimensionality where comes into play.]



### 8. Describe the "2+ emitted paths rule"

A latent composite variable needs at least two outgoing paths (direct effects on endogenous variables) in order to have an identified disturbance variance.



### 9. Group tests

> The test of configural invariance across groups can be considered a test of moderation in that we examine whether the direct effects in the model 'depend' on group membership." True or false?

False. The test of equal direct effects may be considered a test of moderation.



### 10. Carefully read Thompson's (2000) "ten commandments" of structural equation modeling.

1. No small samples.
2. Analyze covariance, not correlation matrices.
3. Simpler models are better.
4. Verify distributional assumptions.
5. Consider theoretical and practical significance, not just statistical significance.
6. Report multiple fit statistics.
7. Use two-step modeling for structural regression models.
8. Consider theoretically plausible alternative models.
9. Respecify rationally.
10. Acknowledge equivalent models.



### 11. Name three things we can do to avoid our tendency to focus on information that confirms our expectations with regard to a hypothesized structural model.

1. Deal with equivalent models. Generative plausible alternatives and then argue for your preferred model.
2. Deal with alternative, non-equivalent models. Argue for your model.
3. Do not make claims about causality if your design is not experimental (i.e., lacks control groups, manipulated variables).





Data Analysis
-------------------------------------------------------------------------------

### 12. Fit the model in Figure 10.5 to the data in Table 10.5. 



```r
m1 <- "
  Acculturation =~ acculscl + genstat + perlife
  SES =~ educ + income
  Stress =~ interper + job
  Stress ~ Acculturation
  depscl ~ Stress + SES
  genstat ~~ perlife"
fit1 <- sem(m1, sample.cov = d, sample.nobs = 983, likelihood = "wishart")
summary(fit1, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after  86 iterations
## 
##   Number of observations                           983
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic               59.715
##   Degrees of freedom                                16
##   P-value (Chi-square)                           0.000
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic             1769.490
##   Degrees of freedom                                28
##   P-value                                        0.000
## 
## User model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    0.975
##   Tucker-Lewis Index (TLI)                       0.956
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)             -19300.129
##   Loglikelihood unrestricted model (H1)     -19270.241
## 
##   Number of free parameters                         20
##   Akaike (AIC)                               38640.257
##   Bayesian (BIC)                             38738.049
##   Sample-size adjusted Bayesian (BIC)        38674.529
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.053
##   90 Percent Confidence Interval          0.039  0.067
##   P-value RMSEA <= 0.05                          0.351
## 
## Standardized Root Mean Square Residual:
## 
##   SRMR                                           0.032
## 
## Parameter estimates:
## 
##   Information                                 Expected
##   Standard Errors                             Standard
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Latent variables:
##   Acculturation =~
##     acculscl          1.000                               3.094    0.992
##     genstat           0.469    0.046   10.228    0.000    1.452    0.443
##     perlife           0.541    0.043   12.478    0.000    1.675    0.696
##   SES =~
##     educ              1.000                               2.201    0.673
##     income            0.681    0.089    7.615    0.000    1.499    0.436
##   Stress =~
##     interper          1.000                               1.666    0.563
##     job               1.454    0.123   11.851    0.000    2.422    0.672
## 
## Regressions:
##   Stress ~
##     Acculturation     0.092    0.023    3.943    0.000    0.171    0.171
##   depscl ~
##     Stress            1.321    0.114   11.622    0.000    2.200    0.690
##     SES              -0.257    0.060   -4.276    0.000   -0.565   -0.177
## 
## Covariances:
##   genstat ~~
##     perlife           1.831    0.248    7.380    0.000    1.831    0.360
##   Acculturation ~~
##     SES               3.724    0.345   10.790    0.000    0.547    0.547
## 
## Variances:
##     acculscl          0.153    0.699                      0.153    0.016
##     genstat           8.643    0.420                      8.643    0.804
##     perlife           2.993    0.245                      2.993    0.516
##     educ              5.849    0.666                      5.849    0.547
##     income            9.588    0.524                      9.588    0.810
##     interper          5.992    0.349                      5.992    0.683
##     job               7.121    0.565                      7.121    0.548
##     depscl            5.247    0.465                      5.247    0.516
##     Acculturation     9.575    0.826                      1.000    1.000
##     SES               4.844    0.733                      1.000    1.000
##     Stress            2.694    0.354                      0.971    0.971
## 
## R-Square:
## 
##     acculscl          0.984
##     genstat           0.196
##     perlife           0.484
##     educ              0.453
##     income            0.190
##     interper          0.317
##     job               0.452
##     depscl            0.484
##     Stress            0.029
```


### 13. Respecify this model with depression as a latent variable with a single indicator. 

> Compare the output to that of the previous model: every single value should be identical!


```r
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
```

```
## lavaan (0.5-15) converged normally after 118 iterations
## 
##   Number of observations                           983
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic               59.715
##   Degrees of freedom                                16
##   P-value (Chi-square)                           0.000
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic             1769.490
##   Degrees of freedom                                28
##   P-value                                        0.000
## 
## User model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    0.975
##   Tucker-Lewis Index (TLI)                       0.956
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)             -19300.129
##   Loglikelihood unrestricted model (H1)     -19270.241
## 
##   Number of free parameters                         20
##   Akaike (AIC)                               38640.257
##   Bayesian (BIC)                             38738.049
##   Sample-size adjusted Bayesian (BIC)        38674.529
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.053
##   90 Percent Confidence Interval          0.039  0.067
##   P-value RMSEA <= 0.05                          0.351
## 
## Standardized Root Mean Square Residual:
## 
##   SRMR                                           0.032
## 
## Parameter estimates:
## 
##   Information                                 Expected
##   Standard Errors                             Standard
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Latent variables:
##   Acculturation =~
##     acculscl          1.000                               3.094    0.992
##     genstat           0.469    0.046   10.228    0.000    1.452    0.443
##     perlife           0.541    0.043   12.478    0.000    1.675    0.696
##   SES =~
##     educ              1.000                               2.201    0.673
##     income            0.681    0.089    7.615    0.000    1.499    0.436
##   Stress =~
##     interper          1.000                               1.666    0.563
##     job               1.454    0.123   11.851    0.000    2.422    0.672
##   Depression =~
##     depscl            1.000                               3.190    1.000
## 
## Regressions:
##   Stress ~
##     Acculturation     0.092    0.023    3.943    0.000    0.171    0.171
##   Depression ~
##     Stress            1.321    0.114   11.622    0.000    0.690    0.690
##     SES              -0.257    0.060   -4.276    0.000   -0.177   -0.177
## 
## Covariances:
##   genstat ~~
##     perlife           1.831    0.248    7.380    0.000    1.831    0.360
##   Acculturation ~~
##     SES               3.724    0.345   10.790    0.000    0.547    0.547
## 
## Variances:
##     depscl            0.000                               0.000    0.000
##     acculscl          0.153    0.699                      0.153    0.016
##     genstat           8.643    0.420                      8.643    0.804
##     perlife           2.993    0.245                      2.993    0.516
##     educ              5.849    0.666                      5.849    0.547
##     income            9.588    0.524                      9.588    0.810
##     interper          5.992    0.349                      5.992    0.683
##     job               7.121    0.565                      7.121    0.548
##     Acculturation     9.575    0.826                      1.000    1.000
##     SES               4.844    0.733                      1.000    1.000
##     Stress            2.694    0.354                      0.971    0.971
##     Depression        5.247    0.465                      0.516    0.516
## 
## R-Square:
## 
##     depscl            1.000
##     acculscl          0.984
##     genstat           0.196
##     perlife           0.484
##     educ              0.453
##     income            0.190
##     interper          0.317
##     job               0.452
##     Stress            0.029
##     Depression        0.484
```


The two models have the same estimates.


```r
c1 <- data.frame(as.list(coef(fit1)))
c2 <- data.frame(as.list(coef(fit2)))
t(merge(c1, c2, all = TRUE))
```

```
##                                  [,1]     [,2]
## Acculturation..genstat        0.46930  0.46930
## Acculturation..perlife        0.54129  0.54129
## SES..income                   0.68090  0.68090
## Stress..job                   1.45398  1.45397
## Stress.Acculturation          0.09232  0.09232
## genstat..perlife              1.83130  1.83130
## acculscl..acculscl            0.15271  0.15271
## genstat..genstat              8.64288  8.64288
## perlife..perlife              2.99290  2.99290
## educ..educ                    5.84928  5.84929
## income..income                9.58801  9.58800
## interper..interper            5.99203  5.99203
## job..job                      7.12130  7.12130
## Acculturation..Acculturation  9.57545  9.57545
## SES..SES                      4.84362  4.84361
## Stress..Stress                2.69388  2.69388
## Acculturation..SES            3.72372  3.72372
## depscl.Stress                      NA  1.32052
## depscl.SES                         NA -0.25691
## depscl..depscl                     NA  5.24680
## Depression.Stress             1.32052       NA
## Depression.SES               -0.25691       NA
## Depression..Depression        5.24680       NA
```



### 14. Estimate the same model but this time the variance of the measurement error of the single indicator should be fixed to 30% of the (rescaled) variance of the manifest depression variable (3.06).

> Once you are done estimating the model, compare the output to that of the previous model: what is identical and what has changed? Look especially at (a) the path from stress to depression, (b) the path from SES to depression, and (c) the variance of the disturbance associated with the latent variable "depression". Finally, read the Rex Kline's explanations on page 383. Be prepared to explain to a novice what is going on here.


```r
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
```

```
## lavaan (0.5-15) converged normally after  88 iterations
## 
##   Number of observations                           983
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic               59.715
##   Degrees of freedom                                16
##   P-value (Chi-square)                           0.000
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic             1769.490
##   Degrees of freedom                                28
##   P-value                                        0.000
## 
## User model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    0.975
##   Tucker-Lewis Index (TLI)                       0.956
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)             -19300.129
##   Loglikelihood unrestricted model (H1)     -19270.241
## 
##   Number of free parameters                         20
##   Akaike (AIC)                               38640.257
##   Bayesian (BIC)                             38738.049
##   Sample-size adjusted Bayesian (BIC)        38674.529
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.053
##   90 Percent Confidence Interval          0.039  0.067
##   P-value RMSEA <= 0.05                          0.351
## 
## Standardized Root Mean Square Residual:
## 
##   SRMR                                           0.032
## 
## Parameter estimates:
## 
##   Information                                 Expected
##   Standard Errors                             Standard
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Latent variables:
##   Acculturation =~
##     acculscl          1.000                               3.094    0.992
##     genstat           0.469    0.046   10.228    0.000    1.452    0.443
##     perlife           0.541    0.043   12.478    0.000    1.675    0.696
##   SES =~
##     educ              1.000                               2.201    0.673
##     income            0.681    0.089    7.615    0.000    1.499    0.436
##   Stress =~
##     interper          1.000                               1.666    0.563
##     job               1.454    0.123   11.851    0.000    2.422    0.672
##   Depression =~
##     depscl            1.000                               2.667    0.836
## 
## Regressions:
##   Stress ~
##     Acculturation     0.092    0.023    3.943    0.000    0.171    0.171
##   Depression ~
##     Stress            1.321    0.114   11.622    0.000    0.825    0.825
##     SES              -0.257    0.060   -4.276    0.000   -0.212   -0.212
## 
## Covariances:
##   genstat ~~
##     perlife           1.831    0.248    7.380    0.000    1.831    0.360
##   Acculturation ~~
##     SES               3.724    0.345   10.790    0.000    0.547    0.547
## 
## Variances:
##     depscl            3.060                               3.060    0.301
##     acculscl          0.153    0.699                      0.153    0.016
##     genstat           8.643    0.420                      8.643    0.804
##     perlife           2.993    0.245                      2.993    0.516
##     educ              5.849    0.666                      5.849    0.547
##     income            9.588    0.524                      9.588    0.810
##     interper          5.992    0.349                      5.992    0.683
##     job               7.121    0.565                      7.121    0.548
##     Acculturation     9.575    0.826                      1.000    1.000
##     SES               4.844    0.733                      1.000    1.000
##     Stress            2.694    0.354                      0.971    0.971
##     Depression        2.187    0.465                      0.307    0.307
## 
## R-Square:
## 
##     depscl            0.699
##     acculscl          0.984
##     genstat           0.196
##     perlife           0.484
##     educ              0.453
##     income            0.190
##     interper          0.317
##     job               0.452
##     Stress            0.029
##     Depression        0.693
```


Only one unstandardized (free parameter) estimate has changed.


```r
c2 <- data.frame(as.list(round(coef(fit2), 3)))
c3 <- data.frame(as.list(round(coef(fit3), 3)))
coefs <- data.frame(t(merge(c2, c3, all = TRUE)))
names(coefs) <- c("C3", "C2")
subset(coefs, C2 != C3)
```

```
##                           C3    C2
## Depression..Depression 2.187 5.247
```


But several standardized estimates have changed. The standardized estimate from Stress to Depression increased and the standardized estimate from SES increased in magnitude.


```r
standardized <- inspect(fit3, "std.coef")[1:4]
names(standardized)[4] <- "Fit3"
standardized <- cbind(standardized, Fit2 = inspect(fit2, "std.coef")$est.std)
subset(standardized, round(Fit3, 3) != round(Fit2, 3))
```

```
##           lhs op        rhs    Fit3    Fit2
## 8  Depression =~     depscl  0.8362  1.0000
## 10 Depression  ~     Stress  0.8249  0.6897
## 11 Depression  ~        SES -0.2120 -0.1773
## 13     depscl ~~     depscl  0.3008  0.0000
## 24 Depression ~~ Depression  0.3074  0.5158
```



The explained variance in depscl decreased by .30 while the explained variance in Depression increased by .21.


```r
round(cbind(M2 = inspect(fit2, "rsquare"), M3 = inspect(fit3, "rsquare")), 3)
```

```
##               M2    M3
## depscl     1.000 0.699
## acculscl   0.984 0.984
## genstat    0.196 0.196
## perlife    0.484 0.484
## educ       0.453 0.453
## income     0.190 0.190
## interper   0.317 0.317
## job        0.452 0.452
## Stress     0.029 0.029
## Depression 0.484 0.693
```


For the novice: In the original model, we assumed we were measuring the 
depression factor with no measurement error. All of this error was being 
captured in the disturbance for the Depression factor. By shifting some of
that unexplained variance into measurement error, the disturbance variance and
the structural paths to this factor will be estimated controlling for
measurement error in the factor. 



***


```r
sessionInfo()
```

```
## R version 3.0.1 (2013-05-16)
## Platform: x86_64-w64-mingw32/x64 (64-bit)
## 
## locale:
## [1] LC_COLLATE=English_United States.1252 
## [2] LC_CTYPE=English_United States.1252   
## [3] LC_MONETARY=English_United States.1252
## [4] LC_NUMERIC=C                          
## [5] LC_TIME=English_United States.1252    
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
## [1] lavaan_0.5-15 knitr_1.5    
## 
## loaded via a namespace (and not attached):
## [1] evaluate_0.5.1 formatR_0.10   mnormt_1.4-5   pbivnorm_0.5-1
## [5] quadprog_1.5-5 stats4_3.0.1   stringr_0.6.2  tools_3.0.1
```

