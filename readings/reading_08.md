Questions about Rex Kline's book (for Tues., Nov. 5)
===============================================================================

> Read pp. 112-118 (chap. 5) and pp. 230-245 (chap. 9) of Rex Kline's book. Be prepared to answer the questions below. Please also do the data analysis exercise described below. 


```r
library(lavaan)
d <- read.csv("../data/kabc_cor2.csv", row.names = 1)
cor_mat <- as.matrix(d)
# Transform correlation matrix into a covariance matrix
sd <- c(3.4, 2.4, 2.9, 2.7, 2.7, 4.2, 2.8, 3)
covar_matrix <- cor2cov(cor_mat, sd)
covar_matrix <- round(covar_matrix, digits = 3)
```



### 1. What can researchers do when some of their indicators are formulated in one direction and other indicators in the other direction?

Reverse-code all the indicators in one direction, so that all indicators have the same direction.


```r
reverse_code <- function(values, min, max) max + min - values
reverse_code(1:5, min = 1, max = 5)
```

```
## [1] 5 4 3 2 1
```



### 2. Explain to a novice the difference between unidimensional and multidimensional measurement in factor models.

In unidimensional measurement: 

* each indicator measures a single factor, and 
* measurement errors are independent.

In multidimensional measurement, one of these constraints is violated: 

* an indicator may measure more than one factor, or 
* its measurement errors may covary with the error of another indicator.

When we allow measurement errors to covary, we are saying that the measurement errors have something in common beyond the factors inside the model. When we don't allow errors to covary, we are saying that the correlation between a pair of indicators to due to their shared factor loadings.


#### Sidebar

Suppose we have two covarying factors, each with three independent indicators. We would like to see:

1. Convergent validity: High standardized factor loadings for each indicator, x > 0.70
2. Discriminant validity: Not-excessively-high estimated correlations between the factors, r < 0.90


### 3. What are the major differences between exploratory factor analysis (EFA) and confirmatory factor analysis (CFA)?

In EFA:

* You don't have to formulate hypotheses about factor-indicator correspondences or how many factors are at play.
* Models are unrestricted factor models, which in general may not be identified. That is, each indicator can load onto every factor, making a unique solution of estimates impossible. (There may be infinite number of solutions.)

CFA on the other hand deals with hypothesis-driven, restricted-factor, largely identified models. In CFA, we also allow factors to covary.


### 4. Assuming each indicator is specified to load on only one factor, how do we interpret unstandardized and standardized factor loadings?

* Unstandardized factor loadings are interpreted like regression coefficients. 
    + Except for the coefficient set to 1 to give the factor its scale. This coefficient does not have a standard error and hence no test of significance.
    
* Standardized factor loadings are interpreted like correlations between the two indicators. 
    + If you square one, you get the proportion of variance in the indicator explained by the factor. 
    + Hopefully, the factor will explain more than 50% of the variance in each indicator.


### 5. Why can we use a chi-square difference test to compare a single-factor model to a multi-factor model?

Fixing the correlation between two factors to equal 1 essentially combines the two factors into a single factor. Therefore, the single-factor form of the model is nested within the two-factor version. We can use the chi-square difference test because the single factor model is a special case of the multi-factor model.


### 6. Kline concludes that the two-factor model in Figure 9.1 is unacceptable. Why?

* Model chi-square is significant. Exact-fit hypothesis is rejected.
* Upper bound of RMSEA exceeds 0.10, so poor-fit hypothesis is not rejected.
* Five of the residual correlations have an absolute value > 0.10.
* [_Positively_] Lower bound of RMSEA is less than 0.05, so close-fit hypothesis is not rejected.
* He also didn't like the low power.


### 7. What pattern of results suggests that you specified too many factors? Too few factors?

* Poor discriminant validity: High factor correlations: Too many factors
* Poor convergent validity: Low correlation (standardized estimates) between a factor and its indicators: Too few factors.


### 8. What are we testing when we fix the covariances between multiple factors to zero and we then compare the chi-square of this model to that of another model in which the factors are allowed to covary?

We are doing the _test for orthogonality_. This lets us know whether all of the factor covariances jointly/overall differ significantly from zero.


Data Analysis Exercise
-------------------------------------------------------------------------------

### 9. Analyze the KABC dataset described on pages 234--239.

> Start out with a one-factor model. What chi-square value do you find when you round the values of the data covariance matrix to 3 decimals (which is what I did in the script above)? Note: this value is similar but not identical to the value reported in the book. If you don't get a similar value, check whether you specified N = 200.


```r
m1 <- "
  f =~ hand + number + word + gestalt + triangles + 
       spatial + analogies + photo"
fit1 <- cfa(m1, sample.cov = covar_matrix, sample.nobs = 200, 
            likelihood = "wishart")
summary(fit1, fit.measures = TRUE)
```

```
## lavaan (0.5-15) converged normally after  36 iterations
## 
##   Number of observations                           200
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic              104.876
##   Degrees of freedom                                20
##   P-value (Chi-square)                           0.000
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic              495.829
##   Degrees of freedom                                28
##   P-value                                        0.000
## 
## User model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    0.819
##   Tucker-Lewis Index (TLI)                       0.746
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)              -3816.598
##   Loglikelihood unrestricted model (H1)      -3763.896
## 
##   Number of free parameters                         16
##   Akaike (AIC)                                7665.196
##   Bayesian (BIC)                              7717.889
##   Sample-size adjusted Bayesian (BIC)         7667.200
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.146
##   90 Percent Confidence Interval          0.119  0.174
##   P-value RMSEA <= 0.05                          0.000
## 
## Standardized Root Mean Square Residual:
## 
##   SRMR                                           0.084
## 
## Parameter estimates:
## 
##   Information                                 Expected
##   Standard Errors                             Standard
## 
##                    Estimate  Std.err  Z-value  P(>|z|)
## Latent variables:
##   f =~
##     hand              1.000
##     number            0.636    0.112    5.694    0.000
##     word              0.805    0.137    5.895    0.000
##     gestalt           0.659    0.123    5.348    0.000
##     triangles         0.963    0.138    6.967    0.000
##     spatial           1.433    0.211    6.779    0.000
##     analogies         0.883    0.137    6.443    0.000
##     photo             1.166    0.160    7.306    0.000
## 
## Variances:
##     hand              7.851    0.870
##     number            4.261    0.460
##     word              6.005    0.655
##     gestalt           5.681    0.604
##     triangles         3.850    0.471
##     spatial          10.029    1.188
##     analogies         4.950    0.563
##     photo             3.956    0.535
##     f                 3.709    0.928
```

```r
fitMeasures(fit1, "chisq")
```

```
## chisq 
## 104.9
```



### 10. Now run the two-factor model described in Figure 9.1. 

> Do you find similar fit indices than the ones reported in Table 9.4? What is your value for chi-square and RMSEA? Do you have similar parameter estimates than the ones reported in Table 9.2? Compute your value for the standardized estimate of the path from "F2" to "photo series". Explain your computations.


```r
m2 <- "
  f1 =~ hand + number + word
  f2 =~ gestalt + triangles + spatial + analogies + photo"
fit2 <- cfa(m2, sample.cov = covar_matrix, sample.nobs = 200, 
            likelihood = "wishart")
summary(fit2, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after  43 iterations
## 
##   Number of observations                           200
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic               38.129
##   Degrees of freedom                                19
##   P-value (Chi-square)                           0.006
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic              495.829
##   Degrees of freedom                                28
##   P-value                                        0.000
## 
## User model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    0.959
##   Tucker-Lewis Index (TLI)                       0.940
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)              -3783.057
##   Loglikelihood unrestricted model (H1)      -3763.896
## 
##   Number of free parameters                         17
##   Akaike (AIC)                                7600.114
##   Bayesian (BIC)                              7656.100
##   Sample-size adjusted Bayesian (BIC)         7602.243
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.071
##   90 Percent Confidence Interval          0.037  0.104
##   P-value RMSEA <= 0.05                          0.135
## 
## Standardized Root Mean Square Residual:
## 
##   SRMR                                           0.072
## 
## Parameter estimates:
## 
##   Information                                 Expected
##   Standard Errors                             Standard
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Latent variables:
##   f1 =~
##     hand              1.000                               1.689    0.497
##     number            1.147    0.181    6.325    0.000    1.937    0.807
##     word              1.388    0.219    6.324    0.000    2.344    0.808
##   f2 =~
##     gestalt           1.000                               1.358    0.503
##     triangles         1.445    0.228    6.336    0.000    1.961    0.726
##     spatial           2.029    0.336    6.046    0.000    2.755    0.656
##     analogies         1.212    0.213    5.702    0.000    1.646    0.588
##     photo             1.727    0.266    6.505    0.000    2.345    0.782
## 
## Covariances:
##   f1 ~~
##     f2                1.277    0.327    3.908    0.000    0.557    0.557
## 
## Variances:
##     hand              8.708    0.945                      8.708    0.753
##     number            2.009    0.417                      2.009    0.349
##     word              2.917    0.609                      2.917    0.347
##     gestalt           5.446    0.590                      5.446    0.747
##     triangles         3.443    0.461                      3.443    0.472
##     spatial          10.048    1.211                     10.048    0.570
##     analogies         5.130    0.582                      5.130    0.654
##     photo             3.500    0.541                      3.500    0.389
##     f1                2.852    0.844                      1.000    1.000
##     f2                1.844    0.534                      1.000    1.000
## 
## R-Square:
## 
##     hand              0.247
##     number            0.651
##     word              0.653
##     gestalt           0.253
##     triangles         0.528
##     spatial           0.430
##     analogies         0.346
##     photo             0.611
```

```r
# Residuals
residuals(fit2)
```

```
## $cov
##           hand   number word   gestlt trngls spatil analgs photo 
## hand       0.000                                                 
## number    -0.089  0.000                                          
## word      -0.507  0.124  0.000                                   
## gestalt    0.651 -0.752 -0.520  0.000                            
## triangles  1.093 -0.366 -0.289  0.107  0.000                     
## spatial    3.120 -0.049 -0.187 -0.339 -0.075  0.000              
## analogies  2.165  0.374  0.287  0.109 -0.054  0.286  0.000       
## photo      1.772 -0.442  0.158  0.218  0.098 -0.036 -0.332  0.000
## 
## $mean
##      hand    number      word   gestalt triangles   spatial analogies 
##         0         0         0         0         0         0         0 
##     photo 
##         0
```

```r
residuals(fit2, "cor")
```

```
## $cor
##           hand   number word   gestlt trngls spatil analgs photo 
## hand       0.000                                                 
## number    -0.011  0.000                                          
## word      -0.051  0.018  0.000                                   
## gestalt    0.071 -0.116 -0.066  0.000                            
## triangles  0.119 -0.056 -0.037  0.015  0.000                     
## spatial    0.218 -0.005 -0.015 -0.030 -0.007  0.000              
## analogies  0.227  0.056  0.035  0.014 -0.007  0.024  0.000       
## photo      0.174 -0.061  0.018  0.027  0.012 -0.003 -0.040  0.000
## 
## $mean
##      hand    number      word   gestalt triangles   spatial analogies 
##         0         0         0         0         0         0         0 
##     photo 
##         0
```

```r
residuals(fit2, "standardized")
```

```
## $cov
##           hand   number word   gestlt trngls spatil analgs photo 
## hand          NA                                                 
## number    -0.617     NA                                          
## word      -4.105  1.800     NA                                   
## gestalt    1.127 -2.334 -1.318     NA                            
## triangles  2.050 -1.568 -1.008  0.432     NA                     
## spatial    3.468 -0.113 -0.358 -0.790 -0.273     NA              
## analogies  3.509  1.132  0.729  0.326 -0.249  0.671     NA       
## photo      2.996 -2.026  0.529  0.924  0.714 -0.150 -2.049     NA
## 
## $mean
##      hand    number      word   gestalt triangles   spatial analogies 
##         0         0         0         0         0         0         0 
##     photo 
##         0
```

```r
# Calculate r_photo from variances
inspect(fit2, "sampstat")
```

```
## $cov
##           hand   number word   gestlt trngls spatil analgs photo 
## hand      11.560                                                 
## number     3.182  5.760                                          
## word       3.451  4.663  8.410                                   
## gestalt    1.928  0.713  1.253  7.290                            
## triangles  2.938  1.750  2.271  2.770  7.290                     
## spatial    5.712  2.923  3.410  3.402  5.330 17.640              
## analogies  3.713  2.150  2.436  2.344  3.175  4.822  7.840       
## photo      3.978  2.088  3.219  3.402  4.698  6.426  3.528  9.000
## 
## $mean
##      hand    number      word   gestalt triangles   spatial analogies 
##         0         0         0         0         0         0         0 
##     photo 
##         0
```

```r
r_squared <- 1 - (3.500 / 9.000)
sqrt(r_squared)
```

```
## [1] 0.7817
```


The standardized estimates and the factor loadings are the same. The variances all differ slightly (still within 1 unit).


### 11.  Now run a different two-factor model. This time, "number" and "word" load on the first factor, all other variables load on the second factor. Look at as many fit indices that you can get. Is this a satisfactory model?


```r
m3 <- "
  f1 =~ number + word
  f2 =~ hand + gestalt + triangles + spatial + analogies + photo"
fit3 <- cfa(m3, sample.cov = covar_matrix, sample.nobs = 200, 
            likelihood = "wishart")
summary(fit3, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after  49 iterations
## 
##   Number of observations                           200
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic               26.293
##   Degrees of freedom                                19
##   P-value (Chi-square)                           0.122
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic              495.829
##   Degrees of freedom                                28
##   P-value                                        0.000
## 
## User model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    0.984
##   Tucker-Lewis Index (TLI)                       0.977
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)              -3777.109
##   Loglikelihood unrestricted model (H1)      -3763.896
## 
##   Number of free parameters                         17
##   Akaike (AIC)                                7588.218
##   Bayesian (BIC)                              7644.205
##   Sample-size adjusted Bayesian (BIC)         7590.348
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.044
##   90 Percent Confidence Interval          0.000  0.081
##   P-value RMSEA <= 0.05                          0.562
## 
## Standardized Root Mean Square Residual:
## 
##   SRMR                                           0.047
## 
## Parameter estimates:
## 
##   Information                                 Expected
##   Standard Errors                             Standard
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Latent variables:
##   f1 =~
##     number            1.000                               1.893    0.789
##     word              1.302    0.187    6.950    0.000    2.464    0.850
##   f2 =~
##     hand              1.000                               1.852    0.545
##     gestalt           0.717    0.133    5.402    0.000    1.329    0.492
##     triangles         1.033    0.152    6.813    0.000    1.913    0.709
##     spatial           1.510    0.229    6.586    0.000    2.797    0.666
##     analogies         0.911    0.147    6.199    0.000    1.687    0.602
##     photo             1.249    0.176    7.089    0.000    2.313    0.771
## 
## Covariances:
##   f1 ~~
##     f2                1.900    0.434    4.380    0.000    0.542    0.542
## 
## Variances:
##     number            2.177    0.514                      2.177    0.378
##     word              2.341    0.823                      2.341    0.278
##     hand              8.130    0.893                      8.130    0.703
##     gestalt           5.524    0.593                      5.524    0.758
##     triangles         3.629    0.462                      3.629    0.498
##     spatial           9.814    1.181                      9.814    0.556
##     analogies         4.995    0.568                      4.995    0.637
##     photo             3.651    0.529                      3.651    0.406
##     f1                3.583    0.709                      1.000    1.000
##     f2                3.430    0.901                      1.000    1.000
## 
## R-Square:
## 
##     number            0.622
##     word              0.722
##     hand              0.297
##     gestalt           0.242
##     triangles         0.502
##     spatial           0.444
##     analogies         0.363
##     photo             0.594
```

```r
residuals(fit3, type = "cor") 
```

```
## $cor
##           number word   hand   gestlt trngls spatil analgs photo 
## number     0.000                                                 
## word       0.000  0.000                                          
## hand       0.157  0.099  0.000                                   
## gestalt   -0.100 -0.067 -0.058  0.000                            
## triangles -0.033 -0.036 -0.066  0.031  0.000                     
## spatial    0.005 -0.027  0.037 -0.028 -0.002  0.000              
## analogies  0.062  0.023  0.062  0.014 -0.007  0.009  0.000       
## photo     -0.040  0.015 -0.030  0.041  0.034 -0.003 -0.044  0.000
## 
## $mean
##    number      word      hand   gestalt triangles   spatial analogies 
##         0         0         0         0         0         0         0 
##     photo 
##         0
```

```r
residuals(fit3, type = "standardized")
```

```
## $cov
##           number word   hand   gestlt trngls spatil analgs photo 
## number        NA                                                 
## word          NA     NA                                          
## hand       2.900  1.936     NA                                   
## gestalt   -1.987 -1.344 -1.278     NA                            
## triangles -0.895 -1.024 -2.202  0.835     NA                     
## spatial    0.126 -0.676  0.955 -0.729 -0.074     NA              
## analogies  1.301  0.496  1.409  0.307 -0.229  0.254     NA       
## photo     -1.336  0.477 -1.183  1.257  1.457 -0.166 -2.152     NA
## 
## $mean
##    number      word      hand   gestalt triangles   spatial analogies 
##         0         0         0         0         0         0         0 
##     photo 
##         0
```


* RMSEA looks good.
* SRMR is small.
* Only one standardized estimate is less than .5
* 4 of 8 indicators variances have R^2 > 0.5.
* Only two residual correlations exceed 0.10.
* Model chi-square is not rejected.
* 3-4 of the residual correlations are significant.

It certainly is an improvement over the other model.

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

