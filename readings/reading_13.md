Questions about Rex Kline's book (for Tues., Dec. 10)
===============================================================================

> Read chapter 13 of Kline's book and pp. 750-772 of Tabachnick and Fidell's book. Be prepared to answer the questions below. Please also do the data analysis exercise described at the end. 


```r
library(lavaan)
d <- as.matrix(read.csv("../data/data_israel.csv", row.names = 1))

stem_residuals <- function(model) {
    cor_resid <- residuals(model, type = "cor")$cor
    cor_resid[upper.tri(cor_resid, diag = TRUE)] <- NA
    stem(cor_resid)
}
```


Kline Reading: How to Fool Yourself with SEM
-------------------------------------------------------------------------------

> For each section, be prepared to name at least two or three of these points without looking at your notes. Identify the error (or the two errors) that you are most likely to commit. Discuss with your other group members "your error" and why you think you are particularly likely to commit this error. Then, formulate a goal and say what you are going to do in the future in order to avoid this error.


### 1. Specification

1. Specify the model after the data are collected rather than before.
1. Omit causes that are correlated with other variables in a structural model.
1. Fail to include unanalyzed associations between pairs of measured exogenous variables (path models) or exogenous factors (structural regression models).
1. Use psychometrically inadequate measures.
1. Fail to give careful consideration to the question of directionality.
1. Specify feedback effects in structural models as a way to mask uncertainty about directionality.
1. Add disturbance or measurement error correlations without substantive reason.
1. Fail to include design-driven correlated residuals.
1. Overfit the model (forget parsimony)
1. Fail to have sufficient numbers of indicators of latent variables.
1. Specify that indicators load on > 1 factors without a substantive reason.
1. Specify that a set of effect indicators with low intercorrelations loads on a common factor.
1. In a complex sampling design, assume that the within-group model and the between-group model are the same without verification.
1. Forget that the main goal of specification is test a theory, not a model.

Me:

* motivate directionality.
* Before gathering data, make sure I can express my hypotheses in an SEM model specification


### 2. Data

1. Don't check the accuracy of data input or coding.
1. Ignore whether the pattern of missing data is random or systematic.
1. Fail to examine distributional characteristics.
1. Don't screen for outliers.
1. Assume that all relations are linear.
1. Ignore lack of independence among scores.

Me:

* examine missingness
* report outliers 
* report summary statistics that include distributional information

### 3. Analysis and respecification

1. When identification status is uncertain, fail to conduct tests of solution uniqueness.
1. Fail to recognize empirical underidentification.
1. Ignore the problem of start values.
1. Fail to check accuracy of computer syntax.
1. Fail to carefully inspect the solution for admissibility.
1. Interpret results from a nonconverged solution or one where the computer imposed a zero constraint to avoid a Heywood case.
1. Respecify a model based entirely on statistical criteria.
1. Analyze a correlation matrix without standard deviations when it is clearly inappropriate.
1. Estimate a covariance structure with a correlation matrix without using proper methods.
1. Fail to check for constraint interaction when testing for equality of loadings across different factors or of direct effects on different endogenous variables.
1. Analyze variables so highly correlated (_r_ > 0.85) that a solution is unstable.
1. Estimate a complex model within a small sample.
1. Report only standardized estimates.
1. Set scales for latent variables inappropriately.
1. Fail to separately evaluate the measurement and structural portions of a structural regression model.
1. Estimate relative group mean or intercept differences on latent variables without establishing at least partial measurement invariance of the indicators.
1. Analyze parcels of items on Likert-type scales as continuous indicators without checking to see whether items in each parcel are unidimensional.

Me: 

* Examine correlations of variables

### 4. Interpretation

1. Look only at values of fit statistics; ignore other types of information about fit.
1. Ignore a failed model chi-square test.
1. Rely solely on suggested thresholds for approximate fit indexes to justify retaining the model.
1. Interpret 'closer to fit' as 'closer to truth'.
1. Interpret good fit as meaning that the endogenous variables are strongly predicted.
1. Rely solely on statistical criteria in model evaluation.
1. Rely too much on statistical tests.
1. Interpet the standardized solution in inappropriate ways.
1. Fail to consider equivalent or near-equivalent models.
1. Fail to consider (non-equivalent) alternative models.
1. Reify the factors.
1. Believe that naming a factor means that it is understood (i.e., commit the naming fallacy).
1. Believe that a strong analytic method like SEM can compensate for poor study design or slipshod ideas.
1. As the researcher, fail to report enough information so that your readers can reproduce your results.
1. Interpret estimates of relatively large direct effects in a structural model as "proof" of causality.

Me:

* Describe constructs as hypothetical or provisional
* Use "air quotes" when describing constructs so I don't take them too seriously.

Tabachnick and Fidell reading
-------------------------------------------------------------------------------

### 5. T&F claim that it is not possible to examine all pairwise scatterplots to check for linearity between all nine manifest variables. What do they do instead?

They randomly select scatterplots and check them for linearity.


### 6.It turns out that most of the variables in their example are skewed. What do T&F do to address this skew? If they apply a transformation, which transformation do they use? If not, what do they do?

They do not transform the skewed variables. They instead use the Satorra-Bentler scaled chi-square and adjusted standard errors to account for the non-normality.


### 7.Look at the fit indices reported in Table 14.19, especially at the RMSEA and its associated confidence interval. Is the close-fit hypothesis rejected? Is the non-close fit hypothesis rejected?

The close-fit is rejected and the non-close fit hypothesis is retained, RMSEA = 0.085, CI: 0.067-0.104.


### 8. T&F do a number of model modifications after the estimation of the initial model. In general, do they handle these post-hoc modifications in a satisfactory manner?

They motivate the modifications by calling them "reasonable" changes. At one point, they say that they could stop modifying paths, but "the RMSEA is somewhat high and CFI is a little too low" so they decide to inspect the correlation residuals for any "conceptually justifiable" changes. They verify the model improvements using chi-square difference tests. They then warn us to exercise caution when adding paths post hoc. They do use the phrase "post hoc" and "data fishing" in the text. Lastly, they check the bivariate correlations between parameter estimates in the initial model and the final modified model.


### 9. T&F say that when we add covariances between error terms, "we don't exactly know what we are correlating but only what we are not correlating". Why is that?

The disturbances represent all other causes not included in the model, so allowing disturbances to covary specifies that the two variables have some unknown, unmodeled cause(s) in common.


### 10. T&F say that under ideal circumstances one would re-estimate the final model (the one presented in Figure 14.13) and drop all the nonsignificant paths. What do you think about this suggestion?

I don't like this suggestion. Parsimony should be a part of the theory that specifies the model.


### 11. Is T&F's results section complete? Would you have added (or changed) anything?

Some consideration of alternative or equivalent models.


### 12.In the final model, the direct path from "age" to "health care utilization" is non significant. This is surprising. After all, we would expect older people to see doctors more often and to take more drugs, wouldn't we? Explain what is going on here.

Perceived Ill Health mediates the effect of Age on Health Care Utilization. The indirect paths from Age to Utilization via Life Change Units are also significant.


Data Analysis
-------------------------------------------------------------------------------

### 13. One-Factor CFA

> Run additional analyses on the Israel dataset. First, run a one-factor confirmatory factor analysis with the variables v7, v8, v9, v11, v12, v13, v16, v17, v18, and v24. Determine whether this model has a satisfactory fit.


```r
m1 <- "F =~ V7 + V8 + V9 + V11 + V12 + V13 + V16 + V17 + V18 + V24"
fit1 <- cfa(m1, sample.cov = d, sample.nobs = 450, likelihood = "wishart")
# Inspect the model
summary(fit1, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after  32 iterations
## 
##   Number of observations                           450
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic              843.150
##   Degrees of freedom                                35
##   P-value (Chi-square)                           0.000
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic             2023.414
##   Degrees of freedom                                45
##   P-value                                        0.000
## 
## User model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    0.592
##   Tucker-Lewis Index (TLI)                       0.475
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)              -5044.397
##   Loglikelihood unrestricted model (H1)      -4621.883
## 
##   Number of free parameters                         20
##   Akaike (AIC)                               10128.794
##   Bayesian (BIC)                             10210.935
##   Sample-size adjusted Bayesian (BIC)        10147.462
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.227
##   90 Percent Confidence Interval          0.214  0.240
##   P-value RMSEA <= 0.05                          0.000
## 
## Standardized Root Mean Square Residual:
## 
##   SRMR                                           0.120
## 
## Parameter estimates:
## 
##   Information                                 Expected
##   Standard Errors                             Standard
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Latent variables:
##   F =~
##     V7                1.000                               0.431    0.593
##     V8                1.522    0.142   10.740    0.000    0.657    0.650
##     V9                1.571    0.141   11.153    0.000    0.678    0.687
##     V11               1.478    0.147   10.077    0.000    0.638    0.595
##     V12               1.551    0.140   11.058    0.000    0.669    0.678
##     V13               1.514    0.150   10.116    0.000    0.653    0.598
##     V16               0.895    0.085   10.544    0.000    0.386    0.633
##     V17              -1.092    0.107  -10.241    0.000   -0.471   -0.608
##     V18               1.005    0.099   10.201    0.000    0.434    0.605
##     V24               0.246    0.080    3.085    0.002    0.106    0.159
## 
## Variances:
##     V7                0.344    0.025                      0.344    0.649
##     V8                0.589    0.045                      0.589    0.577
##     V9                0.514    0.040                      0.514    0.528
##     V11               0.742    0.055                      0.742    0.646
##     V12               0.525    0.041                      0.525    0.540
##     V13               0.766    0.056                      0.766    0.642
##     V16               0.223    0.017                      0.223    0.599
##     V17               0.378    0.028                      0.378    0.630
##     V18               0.326    0.024                      0.326    0.634
##     V24               0.433    0.029                      0.433    0.975
##     F                 0.186    0.029                      1.000    1.000
## 
## R-Square:
## 
##     V7                0.351
##     V8                0.423
##     V9                0.472
##     V11               0.354
##     V12               0.460
##     V13               0.358
##     V16               0.401
##     V17               0.370
##     V18               0.366
##     V24               0.025
```

```r
residuals(fit1, type = "cor")$cor
```

```
##     V7     V8     V9     V11    V12    V13    V16    V17    V18    V24   
## V7   0.000                                                               
## V8   0.220  0.000                                                        
## V9   0.176  0.353  0.000                                                 
## V11 -0.082 -0.106 -0.084  0.000                                          
## V12 -0.079 -0.083 -0.070  0.272  0.000                                   
## V13 -0.054 -0.101 -0.102  0.177  0.227  0.000                            
## V16 -0.069 -0.089 -0.083 -0.083 -0.100 -0.088  0.000                     
## V17  0.080  0.121  0.091  0.083  0.058  0.074 -0.303  0.000              
## V18 -0.109 -0.157 -0.119 -0.039 -0.043  0.011  0.269 -0.232  0.000       
## V24  0.021 -0.026 -0.053  0.016 -0.017  0.008  0.039 -0.023  0.015  0.000
```

```r
residuals(fit1, type = "standardized")$cov
```

```
##     V7     V8     V9     V11    V12    V13    V16    V17    V18    V24   
## V7      NA                                                               
## V8   6.590     NA                                                        
## V9   5.747  9.308     NA                                                 
## V11 -3.287 -4.895 -4.172     NA                                          
## V12 -3.748 -4.535 -4.208  7.786     NA                                   
## V13 -2.106 -4.688 -5.230  5.389  6.897     NA                            
## V16 -2.918 -4.349 -4.469 -3.591 -5.478 -3.826     NA                     
## V17  3.277  5.853  4.672  3.390  2.736  3.040 -8.211     NA              
## V18 -4.572 -7.958 -6.396 -1.504 -1.953  0.408  7.565 -6.716     NA       
## V24  0.590 -0.798 -1.727  0.446 -0.531  0.221  1.156 -0.664  0.416     NA
```

```r
stem_residuals(fit1)
```

```
## 
##   The decimal point is 1 digit(s) to the left of the |
## 
##   -3 | 0
##   -2 | 3
##   -1 | 6211000
##   -0 | 99888888775544322
##    0 | 11122467889
##    1 | 288
##    2 | 2377
##    3 | 5
```


The overall model fit is very poor, chi-square(35) = 843.15, p < 0.001. The RMSEA equals 0.23 (90% CI: 0.21, 0.24); the close-fit hypothesis is rejected and the poor fit hypothesis is retained. SRMR equals 0.12, exceeding the 0.08 rule of thumb.


### 14. Four-Factor CFA with a fixed measurement error

> Regardless of what you found in the previous step, run a confirmatory factor analysis with four factors defined as follows: "Friends" (v7, v8, v9), "Attitude" (v11, v12, v13), "Relaxed" (v16, v17, v18), and "Variability" (v24). You want to fix the variance of the measurement error of v24 to zero. Determine whether this model has a satisfactory fit.


```r
m2 <- "
  Friends =~ V7 + V8 + V9
  Attitude =~ V11 + V12 + V13
  Relaxed =~ V16 + V17 + V18
  Variability =~ V24
  # Fixed measurement error
  V24 ~~ 0*V24"
fit2 <- cfa(m2, sample.cov = d, sample.nobs = 450, likelihood = "wishart")
summary(fit2, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after  42 iterations
## 
##   Number of observations                           450
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic               39.766
##   Degrees of freedom                                30
##   P-value (Chi-square)                           0.109
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic             2023.414
##   Degrees of freedom                                45
##   P-value                                        0.000
## 
## User model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    0.995
##   Tucker-Lewis Index (TLI)                       0.993
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)              -4641.811
##   Loglikelihood unrestricted model (H1)      -4621.883
## 
##   Number of free parameters                         25
##   Akaike (AIC)                                9333.621
##   Bayesian (BIC)                              9436.297
##   Sample-size adjusted Bayesian (BIC)         9356.957
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.027
##   90 Percent Confidence Interval          0.000  0.047
##   P-value RMSEA <= 0.05                          0.970
## 
## Standardized Root Mean Square Residual:
## 
##   SRMR                                           0.028
## 
## Parameter estimates:
## 
##   Information                                 Expected
##   Standard Errors                             Standard
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Latent variables:
##   Friends =~
##     V7                1.000                               0.488    0.670
##     V8                1.841    0.117   15.785    0.000    0.898    0.890
##     V9                1.812    0.115   15.802    0.000    0.884    0.896
##   Attitude =~
##     V11               1.000                               0.809    0.755
##     V12               1.085    0.066   16.348    0.000    0.878    0.890
##     V13               0.963    0.066   14.532    0.000    0.779    0.713
##   Relaxed =~
##     V16               1.000                               0.522    0.856
##     V17              -1.185    0.068  -17.536    0.000   -0.619   -0.798
##     V18               1.045    0.062   16.803    0.000    0.546    0.761
##   Variability =~
##     V24               1.000                               0.666    1.000
## 
## Covariances:
##   Friends ~~
##     Attitude          0.188    0.026    7.107    0.000    0.477    0.477
##     Relaxed           0.111    0.016    6.868    0.000    0.434    0.434
##     Variability       0.027    0.016    1.666    0.096    0.084    0.084
##   Attitude ~~
##     Relaxed           0.206    0.027    7.533    0.000    0.488    0.488
##     Variability       0.064    0.028    2.313    0.021    0.119    0.119
##   Relaxed ~~
##     Variability       0.054    0.018    3.007    0.003    0.156    0.156
## 
## Variances:
##     V24               0.000                               0.000    0.000
##     V7                0.292    0.021                      0.292    0.551
##     V8                0.213    0.031                      0.213    0.209
##     V9                0.192    0.029                      0.192    0.197
##     V11               0.495    0.044                      0.495    0.430
##     V12               0.202    0.035                      0.202    0.207
##     V13               0.586    0.048                      0.586    0.491
##     V16               0.099    0.013                      0.099    0.267
##     V17               0.217    0.021                      0.217    0.362
##     V18               0.216    0.019                      0.216    0.421
##     Friends           0.238    0.031                      1.000    1.000
##     Attitude          0.654    0.075                      1.000    1.000
##     Relaxed           0.273    0.026                      1.000    1.000
##     Variability       0.444    0.030                      1.000    1.000
## 
## R-Square:
## 
##     V24               1.000
##     V7                0.449
##     V8                0.791
##     V9                0.803
##     V11               0.570
##     V12               0.793
##     V13               0.509
##     V16               0.733
##     V17               0.638
##     V18               0.579
```

```r
residuals(fit2, type = "cor")$cor
```

```
##     V7     V8     V9     V11    V12    V13    V16    V17    V18    V24   
## V7   0.000                                                               
## V8   0.009  0.000                                                        
## V9  -0.017  0.003  0.000                                                 
## V11  0.029 -0.039  0.002  0.000                                          
## V12  0.039 -0.019  0.015  0.003  0.000                                   
## V13  0.073 -0.015  0.004 -0.005 -0.002  0.000                            
## V16  0.057 -0.008  0.019 -0.022 -0.043 -0.007  0.000                     
## V17 -0.048  0.034 -0.016  0.015 -0.008 -0.011 -0.004  0.000              
## V18  0.028 -0.058  0.001  0.041  0.037  0.108  0.000  0.008  0.000       
## V24  0.059  0.003 -0.019  0.021 -0.015  0.018  0.007  0.004 -0.007  0.000
```

```r
stem_residuals(fit2)
```

```
## 
##   The decimal point is 2 digit(s) to the left of the |
## 
##   -4 | 883
##   -2 | 92
##   -0 | 99765518877542
##    0 | 012333447895589
##    2 | 189479
##    4 | 179
##    6 | 3
##    8 | 
##   10 | 8
```

```r
residuals(fit2, type = "standardized")$cov
```

```
##     V7     V8     V9     V11    V12    V13    V16    V17    V18    V24   
## V7      NA                                                               
## V8   1.147     NA                                                        
## V9      NA  1.651     NA                                                 
## V11  0.833 -1.597  0.076     NA                                          
## V12  1.233 -1.237  0.919  0.880     NA                                   
## V13  1.964 -0.546  0.156 -0.485 -0.717     NA                            
## V16  1.713 -0.383  0.955 -0.852 -2.759 -0.247     NA                     
## V17 -1.370  1.454 -0.682  0.522 -0.336 -0.369 -0.946     NA              
## V18  0.774 -2.311  0.029  1.301  1.429  3.126  0.052  1.449     NA       
## V24  1.775  0.182 -1.257  0.764 -1.156  0.607  0.405  0.178 -0.286     NA
```


The overall model fit is satisfactory, chi-square(30) = 39.67, p = 0.11, Exact-Fit Hypothesis retained. The RMSEA equals 0.027 (90% CI: 0, 0.047); the close-fit hypothesis is retained and the poor fit hypothesis is rejected. SRMR equals 0.028, satisfying the 0.08 rule of thumb. Only one correlation residual exceeds 0.1 in magnitude (V18:V13).


### 15. Structural Regression model

> Regardless of what you found in the previous step, run the structural regression model depicted below (see Figure 1). Determine whether this model has a satisfactory fit (chi square, fit indices, correlation residuals...). What conclusions would you draw from the analyses you have run in steps 13, 14, and 15?

![Model 1](figure/reading13_m1.png)


```r
m3 <- "
  Friends =~ V7 + V8 + V9
  Attitude =~ V11 + V12 + V13
  Relaxed =~ V16 + V17 + V18
  Variability =~ V24

  Attitude ~ Friends + Relaxed
  Friends ~ Relaxed
  Relaxed ~ Variability

  V24 ~~ 0*V24"
fit3 <- cfa(m3, sample.cov = d, sample.nobs = 450, likelihood = "wishart")
summary(fit3, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after  34 iterations
## 
##   Number of observations                           450
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic               40.648
##   Degrees of freedom                                32
##   P-value (Chi-square)                           0.140
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic             2023.414
##   Degrees of freedom                                45
##   P-value                                        0.000
## 
## User model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    0.996
##   Tucker-Lewis Index (TLI)                       0.994
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)              -4642.253
##   Loglikelihood unrestricted model (H1)      -4621.883
## 
##   Number of free parameters                         23
##   Akaike (AIC)                                9330.505
##   Bayesian (BIC)                              9424.967
##   Sample-size adjusted Bayesian (BIC)         9351.974
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.025
##   90 Percent Confidence Interval          0.000  0.045
##   P-value RMSEA <= 0.05                          0.983
## 
## Standardized Root Mean Square Residual:
## 
##   SRMR                                           0.030
## 
## Parameter estimates:
## 
##   Information                                 Expected
##   Standard Errors                             Standard
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Latent variables:
##   Friends =~
##     V7                1.000                               0.488    0.670
##     V8                1.841    0.117   15.783    0.000    0.898    0.890
##     V9                1.812    0.115   15.801    0.000    0.884    0.896
##   Attitude =~
##     V11               1.000                               0.808    0.754
##     V12               1.087    0.067   16.334    0.000    0.879    0.891
##     V13               0.963    0.066   14.520    0.000    0.779    0.713
##   Relaxed =~
##     V16               1.000                               0.522    0.856
##     V17              -1.185    0.068  -17.542    0.000   -0.618   -0.798
##     V18               1.046    0.062   16.808    0.000    0.546    0.761
##   Variability =~
##     V24               1.000                               0.666    1.000
## 
## Regressions:
##   Attitude ~
##     Friends           0.539    0.096    5.633    0.000    0.325    0.325
##     Relaxed           0.539    0.089    6.039    0.000    0.348    0.348
##   Friends ~
##     Relaxed           0.406    0.053    7.652    0.000    0.435    0.435
##   Relaxed ~
##     Variability       0.125    0.040    3.160    0.002    0.159    0.159
## 
## Variances:
##     V24               0.000                               0.000    0.000
##     V7                0.292    0.022                      0.292    0.551
##     V8                0.213    0.031                      0.213    0.209
##     V9                0.192    0.029                      0.192    0.197
##     V11               0.496    0.044                      0.496    0.431
##     V12               0.200    0.035                      0.200    0.206
##     V13               0.587    0.048                      0.587    0.492
##     V16               0.100    0.013                      0.100    0.268
##     V17               0.218    0.021                      0.218    0.363
##     V18               0.216    0.019                      0.216    0.421
##     Friends           0.193    0.026                      0.811    0.811
##     Attitude          0.441    0.053                      0.675    0.675
##     Relaxed           0.265    0.026                      0.975    0.975
##     Variability       0.444    0.030                      1.000    1.000
## 
## R-Square:
## 
##     V24               1.000
##     V7                0.449
##     V8                0.791
##     V9                0.803
##     V11               0.569
##     V12               0.794
##     V13               0.508
##     V16               0.732
##     V17               0.637
##     V18               0.579
##     Friends           0.189
##     Attitude          0.325
##     Relaxed           0.025
```

```r
residuals(fit3, type = "cor")$cor
```

```
##     V7     V8     V9     V11    V12    V13    V16    V17    V18    V24   
## V7   0.000                                                               
## V8   0.009  0.000                                                        
## V9  -0.017  0.003  0.000                                                 
## V11  0.030 -0.039  0.002  0.000                                          
## V12  0.038 -0.019  0.015  0.003  0.000                                   
## V13  0.073 -0.015  0.005 -0.005 -0.002  0.000                            
## V16  0.057 -0.008  0.019 -0.022 -0.044 -0.007  0.000                     
## V17 -0.048  0.034 -0.016  0.015 -0.006 -0.011 -0.005  0.000              
## V18  0.027 -0.058  0.000  0.040  0.036  0.107  0.000  0.008  0.000       
## V24  0.069  0.016 -0.006  0.052  0.022  0.047  0.004  0.007 -0.010  0.000
```

```r
stem_residuals(fit3)
```

```
## 
##   The decimal point is 2 digit(s) to the left of the |
## 
##   -4 | 884
##   -2 | 92
##   -0 | 9765108766552
##    0 | 00233457895569
##    2 | 270468
##    4 | 0727
##    6 | 93
##    8 | 
##   10 | 7
```

```r
residuals(fit3, type = "standardized")$cov
```

```
##     V7     V8     V9     V11    V12    V13    V16    V17    V18    V24   
## V7      NA                                                               
## V8   1.153     NA                                                        
## V9      NA  1.660     NA                                                 
## V11  0.840 -1.579  0.089     NA                                          
## V12  1.228 -1.260  0.905  0.868     NA                                   
## V13  1.969 -0.535  0.165 -0.409 -0.854     NA                            
## V16  1.708 -0.394  0.941 -0.862 -2.840 -0.259     NA                     
## V17 -1.364  1.466 -0.669  0.534 -0.290 -0.356 -0.983     NA              
## V18  0.767 -2.324  0.015  1.288  1.392  3.114  0.100  1.413     NA       
## V24  1.545  0.369 -0.138  1.203  0.529  1.092  0.213  0.307 -0.396     NA
```

```r
anova(fit2, fit3)
```

```
## Chi Square Difference Test
## 
##      Df  AIC  BIC Chisq Chisq diff Df diff Pr(>Chisq)
## fit2 30 9334 9436  39.8                              
## fit3 32 9331 9425  40.6      0.882       2       0.64
```


The overall model fit is satisfactory, chi-square(32) = 40.65, p = 0.14, Exact-Fit Hypothesis retained. The RMSEA equals 0.025 (90% CI: 0, 0.045); the close-fit hypothesis is retained and the poor fit hypothesis is rejected. SRMR equals 0.03, satisfying the 0.08 rule of thumb. Only one correlation residual exceeds 0.1 in magnitude (V18:V13). The structural model is not an oversimplification of the pure measurement model, chi-square-diff(2) = 0.88, p = 0.64. 


### 16. Conduct a power analysis of this model.


```r
# Load my power functions
source("../power.r")
not_close_fit(df = 32, n = 450)
```

```
## List of 7
##  $ df        : num 32
##  $ n         : num 450
##  $ rmsea0    : num 0.05
##  $ rmseaa    : num 0.01
##  $ alpha     : num 0.05
##  $ hypothesis: chr "Not-close-fit hypothesis"
##  $ power     : num 0.921
##  - attr(*, "class")= chr "PowerSummary"
```

```r
close_fit(df = 32, n = 450)
```

```
## List of 7
##  $ df        : num 32
##  $ n         : num 450
##  $ rmsea0    : num 0.05
##  $ rmseaa    : num 0.08
##  $ alpha     : num 0.05
##  $ hypothesis: chr "Close-fit hypothesis"
##  $ power     : num 0.94
##  - attr(*, "class")= chr "PowerSummary"
```


The model has power = 0.92 to test the not-close-fit hypothesis and power = 0.94 to test the close fit hypothesis.


### 17. Test whether the direct path from the "Relaxed" factor to the "Attitude" factor is really necessary. 

> Does model fit decrease significantly if we take out this path (i.e., do a chi square difference test)?


```r
m4 <- "
  Friends =~ V7 + V8 + V9
  Attitude =~ V11 + V12 + V13
  Relaxed =~ V16 + V17 + V18
  Variability =~ V24

  Attitude ~ Friends
  Friends ~ Relaxed
  Relaxed ~ Variability

  V24 ~~ 0*V24"
fit4 <- cfa(m4, sample.cov = d, sample.nobs = 450, likelihood = "wishart")
summary(fit4, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after  31 iterations
## 
##   Number of observations                           450
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic               79.226
##   Degrees of freedom                                33
##   P-value (Chi-square)                           0.000
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic             2023.414
##   Degrees of freedom                                45
##   P-value                                        0.000
## 
## User model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    0.977
##   Tucker-Lewis Index (TLI)                       0.968
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)              -4661.584
##   Loglikelihood unrestricted model (H1)      -4621.883
## 
##   Number of free parameters                         22
##   Akaike (AIC)                                9367.169
##   Bayesian (BIC)                              9457.523
##   Sample-size adjusted Bayesian (BIC)         9387.704
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.056
##   90 Percent Confidence Interval          0.040  0.072
##   P-value RMSEA <= 0.05                          0.253
## 
## Standardized Root Mean Square Residual:
## 
##   SRMR                                           0.080
## 
## Parameter estimates:
## 
##   Information                                 Expected
##   Standard Errors                             Standard
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Latent variables:
##   Friends =~
##     V7                1.000                               0.489    0.672
##     V8                1.826    0.115   15.823    0.000    0.893    0.884
##     V9                1.811    0.114   15.880    0.000    0.885    0.897
##   Attitude =~
##     V11               1.000                               0.806    0.752
##     V12               1.098    0.069   15.930    0.000    0.885    0.897
##     V13               0.959    0.067   14.388    0.000    0.773    0.708
##   Relaxed =~
##     V16               1.000                               0.530    0.868
##     V17              -1.162    0.067  -17.318    0.000   -0.615   -0.794
##     V18               1.016    0.062   16.494    0.000    0.538    0.750
##   Variability =~
##     V24               1.000                               0.666    1.000
## 
## Regressions:
##   Attitude ~
##     Friends           0.810    0.098    8.255    0.000    0.492    0.492
##   Friends ~
##     Relaxed           0.418    0.052    7.965    0.000    0.453    0.453
##   Relaxed ~
##     Variability       0.125    0.040    3.116    0.002    0.157    0.157
## 
## Variances:
##     V24               0.000                               0.000    0.000
##     V7                0.291    0.021                      0.291    0.549
##     V8                0.223    0.030                      0.223    0.218
##     V9                0.190    0.028                      0.190    0.195
##     V11               0.500    0.045                      0.500    0.435
##     V12               0.190    0.037                      0.190    0.195
##     V13               0.596    0.049                      0.596    0.499
##     V16               0.092    0.013                      0.092    0.246
##     V17               0.222    0.022                      0.222    0.369
##     V18               0.225    0.019                      0.225    0.437
##     Friends           0.190    0.025                      0.795    0.795
##     Attitude          0.492    0.059                      0.758    0.758
##     Relaxed           0.274    0.026                      0.975    0.975
##     Variability       0.444    0.030                      1.000    1.000
## 
## R-Square:
## 
##     V24               1.000
##     V7                0.451
##     V8                0.782
##     V9                0.805
##     V11               0.565
##     V12               0.805
##     V13               0.501
##     V16               0.754
##     V17               0.631
##     V18               0.563
##     Friends           0.205
##     Attitude          0.242
##     Relaxed           0.025
```

```r
anova(fit3, fit4)
```

```
## Chi Square Difference Test
## 
##      Df  AIC  BIC Chisq Chisq diff Df diff Pr(>Chisq)    
## fit3 32 9331 9425  40.6                                  
## fit4 33 9367 9458  79.2       38.6       1    5.3e-10 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```


Yes, the model fit gets significantly worse if we remove this causal path, chi-square-diff(1) = 38.58, p < 0.0001.


### 18. Run the SR model depicted below and compare your output to the one obtained in step 15. Explain the differences and similarities. 

![Model 2](figure/reading13_m2.png)


```r
m5 <- "\n  Friends =~ V7 + V8 + V9\n  Attitude =~ V11 + V12 + V13\n  Relaxed =~ V16 + V17 + V18 + V24\n\n  Attitude ~ Friends + Relaxed\n  Friends ~ Relaxed"
fit5 <- cfa(m5, sample.cov = d, sample.nobs = 450, likelihood = "wishart")
summary(fit5, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after  32 iterations
## 
##   Number of observations                           450
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic               40.648
##   Degrees of freedom                                32
##   P-value (Chi-square)                           0.140
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic             2023.414
##   Degrees of freedom                                45
##   P-value                                        0.000
## 
## User model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    0.996
##   Tucker-Lewis Index (TLI)                       0.994
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)              -4642.253
##   Loglikelihood unrestricted model (H1)      -4621.883
## 
##   Number of free parameters                         23
##   Akaike (AIC)                                9330.505
##   Bayesian (BIC)                              9424.967
##   Sample-size adjusted Bayesian (BIC)         9351.974
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.025
##   90 Percent Confidence Interval          0.000  0.045
##   P-value RMSEA <= 0.05                          0.983
## 
## Standardized Root Mean Square Residual:
## 
##   SRMR                                           0.030
## 
## Parameter estimates:
## 
##   Information                                 Expected
##   Standard Errors                             Standard
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Latent variables:
##   Friends =~
##     V7                1.000                               0.488    0.670
##     V8                1.841    0.117   15.783    0.000    0.898    0.890
##     V9                1.812    0.115   15.801    0.000    0.884    0.896
##   Attitude =~
##     V11               1.000                               0.808    0.754
##     V12               1.087    0.067   16.334    0.000    0.879    0.891
##     V13               0.963    0.066   14.520    0.000    0.779    0.713
##   Relaxed =~
##     V16               1.000                               0.522    0.856
##     V17              -1.185    0.068  -17.542    0.000   -0.618   -0.798
##     V18               1.046    0.062   16.808    0.000    0.546    0.761
##     V24               0.204    0.065    3.155    0.002    0.106    0.159
## 
## Regressions:
##   Attitude ~
##     Friends           0.539    0.096    5.633    0.000    0.325    0.325
##     Relaxed           0.539    0.089    6.039    0.000    0.348    0.348
##   Friends ~
##     Relaxed           0.406    0.053    7.652    0.000    0.435    0.435
## 
## Variances:
##     V7                0.292    0.022                      0.292    0.551
##     V8                0.213    0.031                      0.213    0.209
##     V9                0.192    0.029                      0.192    0.197
##     V11               0.496    0.044                      0.496    0.431
##     V12               0.200    0.035                      0.200    0.206
##     V13               0.587    0.048                      0.587    0.492
##     V16               0.100    0.013                      0.100    0.268
##     V17               0.218    0.021                      0.218    0.363
##     V18               0.216    0.019                      0.216    0.421
##     V24               0.433    0.029                      0.433    0.975
##     Friends           0.193    0.026                      0.811    0.811
##     Attitude          0.441    0.053                      0.675    0.675
##     Relaxed           0.272    0.026                      1.000    1.000
## 
## R-Square:
## 
##     V7                0.449
##     V8                0.791
##     V9                0.803
##     V11               0.569
##     V12               0.794
##     V13               0.508
##     V16               0.732
##     V17               0.637
##     V18               0.579
##     V24               0.025
##     Friends           0.189
##     Attitude          0.325
```

```r
residuals(fit5, type = "cor")$cor
```

```
##     V7     V8     V9     V11    V12    V13    V16    V17    V18    V24   
## V7   0.000                                                               
## V8   0.009  0.000                                                        
## V9  -0.017  0.003  0.000                                                 
## V11  0.030 -0.039  0.002  0.000                                          
## V12  0.038 -0.019  0.015  0.003  0.000                                   
## V13  0.073 -0.015  0.005 -0.005 -0.002  0.000                            
## V16  0.057 -0.008  0.019 -0.022 -0.044 -0.007  0.000                     
## V17 -0.048  0.034 -0.016  0.015 -0.006 -0.011 -0.005  0.000              
## V18  0.027 -0.058  0.000  0.040  0.036  0.107  0.000  0.008  0.000       
## V24  0.069  0.016 -0.006  0.052  0.022  0.047  0.004  0.007 -0.010  0.000
```

```r
stem_residuals(fit5)
```

```
## 
##   The decimal point is 2 digit(s) to the left of the |
## 
##   -4 | 884
##   -2 | 92
##   -0 | 9765108766552
##    0 | 00233457895569
##    2 | 270468
##    4 | 0727
##    6 | 93
##    8 | 
##   10 | 7
```

```r
residuals(fit5, type = "standardized")$cov
```

```
##     V7     V8     V9     V11    V12    V13    V16    V17    V18    V24   
## V7      NA                                                               
## V8   1.153     NA                                                        
## V9      NA  1.659     NA                                                 
## V11  0.840 -1.579  0.089     NA                                          
## V12  1.228 -1.260  0.905  0.868     NA                                   
## V13  1.969 -0.535  0.165 -0.409 -0.854     NA                            
## V16  1.708 -0.394  0.941 -0.862 -2.840 -0.259     NA                     
## V17 -1.364  1.466 -0.669  0.534 -0.290 -0.356 -0.983     NA              
## V18  0.767 -2.324  0.015  1.288  1.392  3.114  0.100  1.413     NA       
## V24  1.545  0.369 -0.138  1.203  0.529  1.092  0.213  0.307 -0.396     NA
```


The model fit is identical to the original structural model. The three causal paths shared between the two model have the same estimates. What differs are the variances associated with the V24 indicator, the factors loaded onto by V24, as well as the fact that in the first model Relaxed is endogenous and exogenous in the second model. These differences can be attributed to the fact that the measurement error of V24 is fixed to 0 in model one and estimated in model 2.

```
                   Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
M1 Regression:
  Relaxed ~
    Variability       0.125    0.040    3.160    0.002    0.159    0.159
    
M2 Factor Loading:
  Relaxed =~
    V24               0.204    0.065    3.155    0.002    0.106    0.159

M1 Factor Loading:
  Variability =~
    V24               1.000                               0.666    1.000

M1 Variances:
    V24               0.000                               0.000    0.000
    Relaxed           0.265    0.026                      0.975    0.975
    Variability       0.444    0.030                      1.000    1.000
    
M2 Variances:
    V24               0.433    0.029                      0.433    0.975
    Relaxed           0.272    0.026                      1.000    1.000    


M1 R-Square:
    V24               1.000
    Relaxed           0.025

M2 R-Square:
    V24               0.025
```

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
## [1] evaluate_0.5.1 formatR_0.10   MASS_7.3-26    mnormt_1.4-7  
## [5] pbivnorm_0.5-1 quadprog_1.5-5 stats4_3.0.1   stringr_0.6.2 
## [9] tools_3.0.1
```

