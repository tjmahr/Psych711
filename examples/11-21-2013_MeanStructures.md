



Mean structures
===============================================================================


```r
d <- read.table(file = "../data/data_apgar.dat", header = TRUE, row.names = "SubID")
psych::describe(d)
```

```
##         var  n    mean      sd median trimmed     mad min max range
## apgar     1 60  6.6833  2.1032    7.0  6.7708  2.2239   1  10     9
## gestat    2 60 37.1167  5.3870   38.0 38.3333  2.9652  20  42    22
## smokes    3 60  0.2667  0.4459    0.0  0.2083  0.0000   0   1     1
## prenat    4 60  1.9667  0.9909    2.0  2.0833  1.4826   0   3     3
## anninc    5 60 55.7833 40.5760   41.5 49.7917 30.3933  10 180   170
## wgtgain   6 60 27.0833 12.5904   25.0 25.3750  9.6369   8  75    67
## gender    7 60  0.5000  0.5042    0.5  0.5000  0.7413   0   1     1
##            skew kurtosis      se
## apgar   -0.3926  -0.3733 0.27152
## gestat  -2.0986   3.8121 0.69546
## smokes   1.0290  -0.9562 0.05757
## prenat  -0.5516  -0.8337 0.12793
## anninc   1.2588   0.9653 5.23834
## wgtgain  1.5101   2.8728 1.62541
## gender   0.0000  -2.0331 0.06509
```

```r
d$one <- 1
```


## Use regression analysis to get the mean

### Get the mean of X

The coefficient for `one` is the mean of X:


```r
reg1 <- lm(smokes ~ 0 + one, data = d)
summary(reg1)
```

```
## 
## Call:
## lm(formula = smokes ~ 0 + one, data = d)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -0.267 -0.267 -0.267  0.733  0.733 
## 
## Coefficients:
##     Estimate Std. Error t value Pr(>|t|)    
## one   0.2667     0.0576    4.63    2e-05 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.446 on 59 degrees of freedom
## Multiple R-squared:  0.267,	Adjusted R-squared:  0.254 
## F-statistic: 21.5 on 1 and 59 DF,  p-value: 2.04e-05
```


Using the intercept term instead of regressing onto `one` yields an equivalent model.


```r
reg1b <- lm(smokes ~ 1, data = d)
```


### Get the mean of Y

The mean of Y is the total effect of `one` on Y:


```r
reg2 <- lm(gestat ~ 0 + smokes + one, data = d)
summary(reg2)
```

```
## 
## Call:
## lm(formula = gestat ~ 0 + smokes + one, data = d)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -12.438  -1.818   0.182   2.277   9.562 
## 
## Coefficients:
##        Estimate Std. Error t value Pr(>|t|)    
## smokes   -6.381      1.347   -4.74  1.4e-05 ***
## one      38.818      0.696   55.81  < 2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 4.61 on 58 degrees of freedom
## Multiple R-squared:  0.985,	Adjusted R-squared:  0.985 
## F-statistic: 1.95e+03 on 2 and 58 DF,  p-value: <2e-16
```

```r
# Indirect effect
one_to_smokes <- reg1$coefficients[["one"]]
smokes_to_gestat <- reg2$coefficients[["smokes"]]
# Direct effect
one_to_gestat <- reg2$coefficients[["one"]]
# Compute mean
one_to_smokes * smokes_to_gestat + one_to_gestat
```

```
## [1] 37.12
```

```r
mean(d$gestat)
```

```
## [1] 37.12
```


As above, we get equivalent models by using an intercept term instead of regressing onto `one`.


```r
reg2b <- lm(gestat ~ 1 + smokes, data = d)
# Don't even need the '~ 1' part if there is another predictor.
reg2c <- lm(gestat ~ smokes, data = d)
```


## Using mean structures in `lavaan`


```r
m2 <- '
  gestat ~ smokes
  apgar ~ wgtgain
  apgar ~ gestat'
fit2 <- sem(m2, data = d, likelihood = "wishart")
summary(fit2, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after  24 iterations
## 
##   Number of observations                            60
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic               10.341
##   Degrees of freedom                                 2
##   P-value (Chi-square)                           0.006
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic               71.434
##   Degrees of freedom                                 5
##   P-value                                        0.000
## 
## User model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    0.874
##   Tucker-Lewis Index (TLI)                       0.686
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)               -554.703
##   Loglikelihood unrestricted model (H1)       -549.445
## 
##   Number of free parameters                          5
##   Akaike (AIC)                                1119.406
##   Bayesian (BIC)                              1129.793
##   Sample-size adjusted Bayesian (BIC)         1114.070
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.266
##   90 Percent Confidence Interval          0.122  0.436
##   P-value RMSEA <= 0.05                          0.011
## 
## Standardized Root Mean Square Residual:
## 
##   SRMR                                           0.103
## 
## Parameter estimates:
## 
##   Information                                 Expected
##   Standard Errors                             Standard
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Regressions:
##   gestat ~
##     smokes           -6.381    1.335   -4.778    0.000   -6.381   -0.528
##   apgar ~
##     wgtgain          -0.086    0.016   -5.529    0.000   -0.086   -0.486
##     gestat            0.276    0.036    7.599    0.000    0.276    0.667
## 
## Variances:
##     gestat           20.923    3.852                     20.923    0.721
##     apgar             2.178    0.401                      2.178    0.439
## 
## R-Square:
## 
##     gestat            0.279
##     apgar             0.561
```

```r
residuals(fit2, type = "cor")
```

```
## $cor
##         gestat apgar  smokes wgtgan
## gestat   0.000                     
## apgar   -0.052  0.000              
## smokes   0.000 -0.214  0.000       
## wgtgain  0.167  0.096  0.000  0.000
## 
## $mean
##  gestat   apgar  smokes wgtgain 
##       0       0       0       0
```

```r
residuals(fit2, type = "standardized")
```

```
## $cov
##         gestat apgar  smokes wgtgan
## gestat      NA                     
## apgar       NA     NA              
## smokes      NA -2.848  0.000       
## wgtgain  1.527  2.858  0.000  0.000
## 
## $mean
##  gestat   apgar  smokes wgtgain 
##       0       0       0       0
```


Model `apgar11` tries to add a mean-structure to `apgar2`. `lavaan` does not automatically estimate the covariance between the exogenous variables, so have to manually specify it, as in model `apgar12`.


```r
m11 <- '
  gestat ~ smokes
  apgar ~ wgtgain
  apgar ~ gestat
  smokes + wgtgain + gestat + apgar ~ 1'
fit11 <- sem(m11, data = d, likelihood = "wishart")
```

```
## Warning: lavaan WARNING: model syntax contains variance/covariance/intercept formulas
##   involving (an) exogenous variable(s): [smokes wgtgain];
##   Please use fixed.x=FALSE or leave them alone
```

```r
summary(fit11, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after  36 iterations
## 
##   Number of observations                            60
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic               18.107
##   Degrees of freedom                                 3
##   P-value (Chi-square)                           0.000
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic               79.199
##   Degrees of freedom                                 6
##   P-value                                        0.000
## 
## User model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    0.794
##   Tucker-Lewis Index (TLI)                       0.587
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)               -558.651
##   Loglikelihood unrestricted model (H1)       -549.445
## 
##   Number of free parameters                         11
##   Akaike (AIC)                                1139.303
##   Bayesian (BIC)                              1162.156
##   Sample-size adjusted Bayesian (BIC)         1127.564
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.292
##   90 Percent Confidence Interval          0.172  0.428
##   P-value RMSEA <= 0.05                          0.001
## 
## Standardized Root Mean Square Residual:
## 
##   SRMR                                           0.171
## 
## Parameter estimates:
## 
##   Information                                 Expected
##   Standard Errors                             Standard
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Regressions:
##   gestat ~
##     smokes           -6.381    1.335   -4.778    0.000   -6.381   -0.528
##   apgar ~
##     wgtgain          -0.086    0.015   -5.627    0.000   -0.086   -0.459
##     gestat            0.276    0.036    7.733    0.000    0.276    0.630
## 
## Intercepts:
##     smokes            0.267    0.058    4.593    0.000    0.267    0.598
##     wgtgain          27.083    1.639   16.523    0.000   27.083    2.151
##     gestat           38.818    0.694   55.945    0.000   38.818    7.206
##     apgar            -1.228    1.400   -0.877    0.380   -1.228   -0.521
## 
## Variances:
##     gestat           20.923    3.852                     20.923    0.721
##     apgar             2.178    0.401                      2.178    0.392
##     smokes            0.199    0.037                      0.199    1.000
##     wgtgain         158.518   29.186                    158.518    1.000
## 
## R-Square:
## 
##     gestat            0.279
##     apgar             0.608
```

```r
residuals(fit11, type = "cor")
```

```
## $cor
##         gestat apgar  smokes wgtgan
## gestat   0.000                     
## apgar   -0.105  0.000              
## smokes   0.000 -0.063  0.000       
## wgtgain  0.352  0.193 -0.351  0.000
## 
## $mean
##  gestat   apgar  smokes wgtgain 
##       0       0       0       0
```

```r
residuals(fit11, type = "standardized")
```

```
## $cov
##         gestat apgar  smokes wgtgan
## gestat      NA                     
## apgar       NA     NA              
## smokes      NA -0.296     NA       
## wgtgain  2.573 10.767 -2.567     NA
## 
## $mean
##  gestat   apgar  smokes wgtgain 
##      NA      NA      NA      NA
```


Specify the covariance between the exogenous variables.


```r
m12 <- '
  gestat ~ smokes
  apgar ~ wgtgain
  apgar ~ gestat
  smokes ~~ wgtgain
  smokes + wgtgain + gestat + apgar ~ 1'
fit12 <- sem(m12, data = d, likelihood = "wishart")
```

```
## Warning: lavaan WARNING: model syntax contains variance/covariance/intercept formulas
##   involving (an) exogenous variable(s): [smokes wgtgain];
##   Please use fixed.x=FALSE or leave them alone
```

```r
summary(fit12, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after  42 iterations
## 
##   Number of observations                            60
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic               10.341
##   Degrees of freedom                                 2
##   P-value (Chi-square)                           0.006
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic               79.199
##   Degrees of freedom                                 6
##   P-value                                        0.000
## 
## User model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    0.886
##   Tucker-Lewis Index (TLI)                       0.658
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)               -554.703
##   Loglikelihood unrestricted model (H1)       -549.445
## 
##   Number of free parameters                         12
##   Akaike (AIC)                                1133.406
##   Bayesian (BIC)                              1158.336
##   Sample-size adjusted Bayesian (BIC)         1120.600
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.266
##   90 Percent Confidence Interval          0.122  0.436
##   P-value RMSEA <= 0.05                          0.011
## 
## Standardized Root Mean Square Residual:
## 
##   SRMR                                           0.087
## 
## Parameter estimates:
## 
##   Information                                 Expected
##   Standard Errors                             Standard
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Regressions:
##   gestat ~
##     smokes           -6.381    1.335   -4.778    0.000   -6.381   -0.528
##   apgar ~
##     wgtgain          -0.086    0.016   -5.529    0.000   -0.086   -0.486
##     gestat            0.276    0.036    7.599    0.000    0.276    0.667
## 
## Covariances:
##   smokes ~~
##     wgtgain          -1.972    0.775   -2.545    0.011   -1.972   -0.351
## 
## Intercepts:
##     smokes            0.267    0.058    4.593    0.000    0.267    0.598
##     wgtgain          27.083    1.639   16.523    0.000   27.083    2.151
##     gestat           38.818    0.694   55.945    0.000   38.818    7.206
##     apgar            -1.228    1.349   -0.911    0.362   -1.228   -0.552
## 
## Variances:
##     gestat           20.923    3.852                     20.923    0.721
##     apgar             2.178    0.401                      2.178    0.439
##     smokes            0.199    0.037                      0.199    1.000
##     wgtgain         158.518   29.186                    158.518    1.000
## 
## R-Square:
## 
##     gestat            0.279
##     apgar             0.561
```

```r
residuals(fit12, type = "cor")
```

```
## $cor
##         gestat apgar  smokes wgtgan
## gestat   0.000                     
## apgar   -0.052  0.000              
## smokes   0.000 -0.214  0.000       
## wgtgain  0.167  0.096  0.000  0.000
## 
## $mean
##  gestat   apgar  smokes wgtgain 
##       0       0       0       0
```

```r
residuals(fit12, type = "standardized")
```

```
## $cov
##         gestat apgar  smokes wgtgan
## gestat      NA                     
## apgar       NA     NA              
## smokes      NA -2.848     NA       
## wgtgain  1.527  2.858     NA     NA
## 
## $mean
##  gestat   apgar  smokes wgtgain 
##      NA      NA      NA      NA
```


We can also use `meanstructure = TRUE` instead of specifying all the intercept terms.


```r
m13 <- '
  gestat ~ smokes
  apgar ~ wgtgain
  apgar ~ gestat
  smokes ~~ wgtgain'
fit13 <- sem(m13, data = d, likelihood = "wishart", meanstructure = TRUE)
```

```
## Warning: lavaan WARNING: model syntax contains variance/covariance/intercept formulas
##   involving (an) exogenous variable(s): [smokes wgtgain];
##   Please use fixed.x=FALSE or leave them alone
```

```r
summary(fit13, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after  42 iterations
## 
##   Number of observations                            60
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic               10.341
##   Degrees of freedom                                 2
##   P-value (Chi-square)                           0.006
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic               79.199
##   Degrees of freedom                                 6
##   P-value                                        0.000
## 
## User model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    0.886
##   Tucker-Lewis Index (TLI)                       0.658
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)               -554.703
##   Loglikelihood unrestricted model (H1)       -549.445
## 
##   Number of free parameters                         12
##   Akaike (AIC)                                1133.406
##   Bayesian (BIC)                              1158.336
##   Sample-size adjusted Bayesian (BIC)         1120.600
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.266
##   90 Percent Confidence Interval          0.122  0.436
##   P-value RMSEA <= 0.05                          0.011
## 
## Standardized Root Mean Square Residual:
## 
##   SRMR                                           0.087
## 
## Parameter estimates:
## 
##   Information                                 Expected
##   Standard Errors                             Standard
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Regressions:
##   gestat ~
##     smokes           -6.381    1.335   -4.778    0.000   -6.381   -0.528
##   apgar ~
##     wgtgain          -0.086    0.016   -5.529    0.000   -0.086   -0.486
##     gestat            0.276    0.036    7.599    0.000    0.276    0.667
## 
## Covariances:
##   smokes ~~
##     wgtgain          -1.972    0.775   -2.545    0.011   -1.972   -0.351
## 
## Intercepts:
##     gestat           38.818    0.694   55.945    0.000   38.818    7.206
##     apgar            -1.228    1.349   -0.911    0.362   -1.228   -0.552
##     smokes            0.267    0.058    4.593    0.000    0.267    0.598
##     wgtgain          27.083    1.639   16.523    0.000   27.083    2.151
## 
## Variances:
##     gestat           20.923    3.852                     20.923    0.721
##     apgar             2.178    0.401                      2.178    0.439
##     smokes            0.199    0.037                      0.199    1.000
##     wgtgain         158.518   29.186                    158.518    1.000
## 
## R-Square:
## 
##     gestat            0.279
##     apgar             0.561
```

```r
residuals(fit13, type = "cor")
```

```
## $cor
##         gestat apgar  smokes wgtgan
## gestat   0.000                     
## apgar   -0.052  0.000              
## smokes   0.000 -0.214  0.000       
## wgtgain  0.167  0.096  0.000  0.000
## 
## $mean
##  gestat   apgar  smokes wgtgain 
##       0       0       0       0
```

```r
residuals(fit13, type = "standardized")
```

```
## $cov
##         gestat apgar  smokes wgtgan
## gestat      NA                     
## apgar       NA     NA              
## smokes      NA -2.848     NA       
## wgtgain  1.527  2.858     NA     NA
## 
## $mean
##  gestat   apgar  smokes wgtgain 
##      NA      NA      NA      NA
```


***


```r
sessionInfo()
```

```
## R version 3.0.2 (2013-09-25)
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
## [1] evaluate_0.5.1  formatR_0.10    mnormt_1.4-5    pbivnorm_0.5-1 
## [5] psych_1.3.10.12 quadprog_1.5-5  stats4_3.0.2    stringr_0.6.2  
## [9] tools_3.0.2
```


