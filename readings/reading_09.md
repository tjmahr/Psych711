


Questions about Rex Kline's book (for Tue., Nov. 12)
===============================================================================

> Read Kline (pp. 245-261), Tabachnick and Fidell (pp. 734-749), and Kline (pp. 118-122). Be prepared to answer the questions below. Please also do the data analysis exercise described below. 
 
#### 1. It has been shown that there is a set of infinitely many equivalent models for standard multifactor CFA models. Explain why.

The covariance between the factors can be replaced by one or more factors. These factors have unit-weighted loadings on all the indicators. Here's an example of such a replacement:

![Figure from Raykov and Marcoulides (2001)](figure/09_infinite_models.PNG)



#### 2. When analyzing a hierarchical CFA model, how many first-order factors do we need for the model to be identified?

we need at least three first-order factors in order to avoid underidentifications. Also, each first-order factor should itself have two indicators.



#### 3. Which types of models are nowadays used to examine the convergent and discriminant validity of factor: "correlated trait-correlated method models" or "correlated uniqueness models"? Why is one type no longer used?

Correlated trait-correlated method models are no longer preferred because they may give illogical estimates. Correlated uniqueness models allow measurement errors to covary within each method, instead of creating a factor for each method.



#### 4. Explain to a novice the different forms of measurement invariance: (1) Configural invariance, (2) Construct-level metric invariance, (3) Invariance of construct variances and covariances, (4) Invariance of residual variances and covariances

Measurement invariance comes up when looking at how a measurement model performs between different groups (e.g., comparing men vs women). 

1. **Configural invariance** means that the same model structure (i.e., same model diagram) works for each group. This form of invariance lets you "conclude that the same constructs are manifested in some different ways [i.e., with different estimates] in each group."
2. **Construct-level metric invariance** means that the model structure and the factor loadings are the same for the groups. When this form of invariance holds, you can "conclude that the constructs are manifested the same way in each group".
3. Even stricter forms of invariance arise by assuming other estimates are the same for in each group. Two such invariances are **equivalance of construct variances and covariances** (factor-related estimates) and **equivalence of residual variances and covariances** (measurement error-related estimates). These two should be self-explanatory.



#### 5. What fit index should we look at when we test for measurement invariance?

Since the models being compared are hierarchically related, the chi-square difference test is appropriate. This test may give spurious results for very large sample sizes. The text mentions the Bentler CFI and noncentrality index (NCI) as indices that are not quite as sensitive to large sample sizes.



#### 6. The unstandardized factor loadings in the bottom half of Table 9.10 are the same for the two samples, but the standardized loadings are not. And yet, the parameters were forced to be equal across samples. Do you think the standardized loadings are reported incorrectly?

The results are reported incorrectly; the table should have a footnote saying why these solutions differ. The text blames EQS' procedure for generating standardized estimates for this discrepancy. Kline then cautions us to check how our software generates standardized solutions since there are a few different ways to come up with these solutions.



#### 7. "We can test all sorts of models (path analysis models, CFA models, structural regression models) for invariance across samples." True or false?

True.



#### 8. According to Tabachnick and Fidell, we are estimating 23 free parameters in the CFA model shown in Figure 14.8 (p. 733). Of these 23 parameters, 11 are regression coefficients (factor loadings) and 11 are variances. But aren't we estimating 9 regression coefficients and 13 variances (11 variances of measurement errors and 2 variances of exogenous factors)?

It looks like they are setting the variance of the factors (phi-11, phi-22) equal to 1 instead of scaling each factor with a reference variable. This technique is called _unit variance identification_ (p. 128).



#### 9. What are the "standardized residuals" reported on top of page 738 in Tabachnick and Fidell's book? How do we interpret them? If you don't remember reread chapter 6 of Kline's book.

The standardized residual is a covariance residuals divided by its standard error. It is interpreted as a z-test, so an absolute value of 1.96 is significant.



#### 10. Why do Tabachnick and Fidell conclude that the CODING variable is not related to the PERFORMANCE factor, as hypothesized in Figure 14.8?

Because it has a very large residual, an insignificant estimate, a miniscule standardized estimate, and an R^2 of 0.005, meaning the model accounts for less than one percent of the variance in CODING.



#### 11. Does the addition of a path predicting comprehension from the Performance factor improve the fit of the CFA model discussed by Tabachnick and Fidell?

Yes. This hypothesis is tested and confirmed by a chi-square difference test on the added path.



#### 12. The model modifications made by Tabachnik and Fidell were made post hoc, were purely data driven and therefore capitalized on chance. What would ideally be the next step?

To test the data-driven model against a new sample.



#### 13. There are more and more claims to avoid passive voice in the writing of scientific articles (see http://allendowney.com/essays/passive.html for an example). In fact, most journals now explicitly encourage authors to use active voice. Do Tabachnick and Fidell follow this advice in their sample results section on pages 748-749?

Absolutely not. "The hypothesized model was tested next and support was found for the hypothesized model."



#### 14. "In both path analysis models and (fully latent) structural regression models, the disturbances reflect omitted causes and measurement error." True or false?

False. "Unlike path models, the disturbances of SR models reflect only omitted causes and not also measurement errors."



#### 15. Do a confirmatory factor analysis using the "carnet" data file I sent you last week (`data_carnet3.sav`). Analyze the variables mpn1 to mpn10 (N = 98). Start out with a one-factor model. You may have to adjust the starting values. I had good luck when I used 20 as a starting value for the variances of the factor and of the measurement errors. Is this model satisfactory?


```r
library(lavaan)
```

```
## Loading required package: MASS
## Loading required package: boot
## Loading required package: mnormt
## Loading required package: pbivnorm
## Loading required package: quadprog
## This is lavaan 0.5-14
## lavaan is BETA software! Please report any bugs.
```

```r
library(foreign)
d <- read.spss("../data/data_carnet3.sav", to.data.frame = TRUE)
```

```
## Warning: ../data/data_carnet3.sav: Unrecognized record type 7, subtype 18 encountered in system
## file
```

```r
# Keep just the `mpn` columns
d <- d[, paste("mpn", 1:10, sep = "")]
psych::describe(d)
```

```
##       var  n   mean    sd median trimmed   mad min max range     skew kurtosis     se
## mpn1    1 98 11.245 5.744   11.0  10.988 5.930   1  24    23  0.28365  -0.6769 0.5802
## mpn2    2 98 11.714 7.587   12.0  11.350 8.896   1  28    27  0.31082  -1.0329 0.7664
## mpn3    3 98  5.561 5.369    4.0   4.662 4.448   1  28    27  1.58974   2.4678 0.5424
## mpn4    4 98  8.143 6.206    7.0   7.638 8.154   1  21    20  0.47909  -1.0460 0.6269
## mpn5    5 98 10.337 7.810    8.5   9.750 8.154   1  27    26  0.52830  -0.9833 0.7889
## mpn6    6 98 10.204 6.388   10.0   9.938 7.413   1  26    25  0.24343  -0.9144 0.6453
## mpn7    7 98 12.755 6.171   12.5  12.725 5.189   1  26    25  0.07257  -0.3799 0.6234
## mpn8    8 98 10.071 6.852    8.0   9.575 8.896   1  26    25  0.48591  -0.7571 0.6922
## mpn9    9 98 11.633 7.485   11.0  11.262 8.896   1  27    26  0.34117  -0.9515 0.7561
## mpn10  10 98 14.143 6.624   14.0  14.162 7.413   1  28    27 -0.02311  -0.9333 0.6691
```

```r

# Model the data.
m1 <- "F =~ mpn1 + mpn2 + mpn3 + mpn4 + mpn5 + mpn6 + mpn7 + mpn8 + mpn9 + mpn10"
fit1 <- cfa(m1, d, likelihood = "wishart")
summary(fit1, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-14) converged normally after  44 iterations
## 
##   Number of observations                            98
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic              111.672
##   Degrees of freedom                                35
##   P-value (Chi-square)                           0.000
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic              439.029
##   Degrees of freedom                                45
##   P-value                                        0.000
## 
## Full model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    0.805
##   Tucker-Lewis Index (TLI)                       0.750
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)              -3071.375
##   Loglikelihood unrestricted model (H1)      -3014.963
## 
##   Number of free parameters                         20
##   Akaike (AIC)                                6182.749
##   Bayesian (BIC)                              6234.448
##   Sample-size adjusted Bayesian (BIC)         6171.291
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.150
##   90 Percent Confidence Interval          0.119  0.181
##   P-value RMSEA <= 0.05                          0.000
## 
## Standardized Root Mean Square Residual:
## 
##   SRMR                                           0.114
## 
## Parameter estimates:
## 
##   Information                                 Expected
##   Standard Errors                             Standard
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Latent variables:
##   F =~
##     mpn1              1.000                               2.761    0.481
##     mpn2              2.180    0.466    4.675    0.000    6.019    0.793
##     mpn3              1.420    0.314    4.519    0.000    3.921    0.730
##     mpn4              1.491    0.345    4.322    0.000    4.115    0.663
##     mpn5              2.353    0.495    4.758    0.000    6.497    0.832
##     mpn6              1.523    0.354    4.307    0.000    4.204    0.658
##     mpn7              0.767    0.271    2.828    0.005    2.117    0.343
##     mpn8              1.820    0.402    4.527    0.000    5.025    0.733
##     mpn9              1.481    0.380    3.897    0.000    4.090    0.546
##     mpn10             0.557    0.273    2.040    0.041    1.539    0.232
## 
## Variances:
##     mpn1             25.370    3.773                     25.370    0.769
##     mpn2             21.344    3.825                     21.344    0.371
##     mpn3             13.449    2.228                     13.449    0.467
##     mpn4             21.581    3.409                     21.581    0.560
##     mpn5             18.783    3.660                     18.783    0.308
##     mpn6             23.131    3.644                     23.131    0.567
##     mpn7             33.603    4.900                     33.603    0.882
##     mpn8             21.706    3.605                     21.706    0.462
##     mpn9             39.303    5.935                     39.303    0.701
##     mpn10            41.508    6.000                     41.508    0.946
##     F                 7.621    3.184                      1.000    1.000
## 
## R-Square:
## 
##     mpn1              0.231
##     mpn2              0.629
##     mpn3              0.533
##     mpn4              0.440
##     mpn5              0.692
##     mpn6              0.433
##     mpn7              0.118
##     mpn8              0.538
##     mpn9              0.299
##     mpn10             0.054
```

```r
residuals(fit1, "cor")
```

```
## $cor
##       mpn1   mpn2   mpn3   mpn4   mpn5   mpn6   mpn7   mpn8   mpn9   mpn10 
## mpn1   0.000                                                               
## mpn2  -0.091  0.000                                                        
## mpn3  -0.046  0.039  0.000                                                 
## mpn4  -0.015 -0.015  0.076  0.000                                          
## mpn5  -0.021  0.031  0.014 -0.034  0.000                                   
## mpn6   0.053 -0.021 -0.024  0.102 -0.044  0.000                            
## mpn7   0.333 -0.086 -0.023 -0.053 -0.050 -0.030  0.000                     
## mpn8  -0.014  0.014 -0.063 -0.098  0.078 -0.001 -0.025  0.000              
## mpn9   0.100 -0.028 -0.052  0.127 -0.096  0.107  0.201 -0.017  0.000       
## mpn10  0.379 -0.056 -0.020 -0.112 -0.052 -0.086  0.514  0.029  0.053  0.000
## 
## $mean
##  mpn1  mpn2  mpn3  mpn4  mpn5  mpn6  mpn7  mpn8  mpn9 mpn10 
##     0     0     0     0     0     0     0     0     0     0
```

```r
residuals(fit1, "standardized")
```

```
## $cov
##       mpn1   mpn2   mpn3   mpn4   mpn5   mpn6   mpn7   mpn8   mpn9   mpn10 
## mpn1      NA                                                               
## mpn2  -2.358     NA                                                        
## mpn3  -0.899  1.029     NA                                                 
## mpn4  -0.256 -0.456  1.469     NA                                          
## mpn5  -0.560  1.106  0.475 -1.431     NA                                   
## mpn6   0.816 -0.629 -0.571  1.720 -2.047     NA                            
## mpn7   3.556 -1.867 -0.395 -0.815 -1.228 -0.448     NA                     
## mpn8  -0.259  0.422 -2.286 -3.101  1.904 -0.034 -0.440     NA              
## mpn9   1.341 -0.693 -1.114  1.907 -4.112  1.631  2.399 -0.338     NA       
## mpn10  3.909 -1.098 -0.333 -1.647 -1.192 -1.259  4.722  0.467  0.661     NA
## 
## $mean
##  mpn1  mpn2  mpn3  mpn4  mpn5  mpn6  mpn7  mpn8  mpn9 mpn10 
##     0     0     0     0     0     0     0     0     0     0
```

```r
abs(residuals(fit1, "standardized")$cov) > 1.96
```

```
##        mpn1  mpn2  mpn3  mpn4  mpn5  mpn6  mpn7  mpn8  mpn9 mpn10
## mpn1     NA  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE
## mpn2   TRUE    NA FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## mpn3  FALSE FALSE    NA FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
## mpn4  FALSE FALSE FALSE    NA FALSE FALSE FALSE  TRUE FALSE FALSE
## mpn5  FALSE FALSE FALSE FALSE    NA  TRUE FALSE FALSE  TRUE FALSE
## mpn6  FALSE FALSE FALSE FALSE  TRUE    NA FALSE FALSE FALSE FALSE
## mpn7   TRUE FALSE FALSE FALSE FALSE FALSE    NA FALSE  TRUE  TRUE
## mpn8  FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE    NA FALSE FALSE
## mpn9  FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE    NA FALSE
## mpn10  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE    NA
```


The model is not satisfactory. The chi-squared test is significant, and the entire confidence interval for the RMSEA exceeds 0.10, so the model has a poor fit overall. Nine standardized residuals exceed 1.96 in magnitude, so not surprisingly the one factor-model has underpredicts some relationships among the variables.



#### 16. Now test a three-factor model. The researchers hypothesize that the indicators mpn2, mpn4, mpn6, and mpn9 are caused by factor 1, that the indicators mpn1, mpn7, and mpn10 are caused by factor 2, and that the indicators mpn3, mpn5, and mpn8 are caused by factor 3. Be prepared to draw a graphic representation of the model with the (standardized) factor loadings and the correlations between the three factors. Is this model satisfactory?



```r
m2 <- "\n  F1 =~ mpn2 + mpn4 + mpn6 + mpn9\n  F2 =~ mpn1 + mpn7 + mpn10\n  F3 =~ mpn3 + mpn5 + mpn8"
fit2 <- cfa(m2, d, likelihood = "wishart")
summary(fit2, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-14) converged normally after  99 iterations
## 
##   Number of observations                            98
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic               54.206
##   Degrees of freedom                                32
##   P-value (Chi-square)                           0.008
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic              439.029
##   Degrees of freedom                                45
##   P-value                                        0.000
## 
## Full model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    0.944
##   Tucker-Lewis Index (TLI)                       0.921
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)              -3042.345
##   Loglikelihood unrestricted model (H1)      -3014.963
## 
##   Number of free parameters                         23
##   Akaike (AIC)                                6130.690
##   Bayesian (BIC)                              6190.145
##   Sample-size adjusted Bayesian (BIC)         6117.514
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.084
##   90 Percent Confidence Interval          0.043  0.122
##   P-value RMSEA <= 0.05                          0.080
## 
## Standardized Root Mean Square Residual:
## 
##   SRMR                                           0.079
## 
## Parameter estimates:
## 
##   Information                                 Expected
##   Standard Errors                             Standard
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Latent variables:
##   F1 =~
##     mpn2              1.000                               6.134    0.808
##     mpn4              0.691    0.101    6.877    0.000    4.241    0.683
##     mpn6              0.701    0.104    6.755    0.000    4.299    0.673
##     mpn9              0.676    0.125    5.409    0.000    4.149    0.554
##   F2 =~
##     mpn1              1.000                               3.940    0.686
##     mpn7              1.210    0.219    5.528    0.000    4.767    0.773
##     mpn10             1.222    0.223    5.478    0.000    4.815    0.727
##   F3 =~
##     mpn3              1.000                               3.917    0.730
##     mpn5              1.718    0.216    7.974    0.000    6.731    0.862
##     mpn8              1.312    0.187    7.030    0.000    5.138    0.750
## 
## Covariances:
##   F1 ~~
##     F2                9.546    3.496    2.731    0.006    0.395    0.395
##     F3               22.564    4.508    5.005    0.000    0.939    0.939
##   F2 ~~
##     F3                6.300    2.250    2.800    0.005    0.408    0.408
## 
## Variances:
##     mpn2             19.940    4.078                     19.940    0.346
##     mpn4             20.526    3.390                     20.526    0.533
##     mpn6             22.318    3.655                     22.318    0.547
##     mpn9             38.815    5.959                     38.815    0.693
##     mpn1             17.466    3.402                     17.466    0.529
##     mpn7             15.357    3.943                     15.357    0.403
##     mpn10            20.690    4.497                     20.690    0.472
##     mpn3             13.485    2.280                     13.485    0.468
##     mpn5             15.683    3.737                     15.683    0.257
##     mpn8             20.556    3.560                     20.556    0.438
##     F1               37.627    8.280                      1.000    1.000
##     F2               15.525    4.630                      1.000    1.000
##     F3               15.341    3.851                      1.000    1.000
## 
## R-Square:
## 
##     mpn2              0.654
##     mpn4              0.467
##     mpn6              0.453
##     mpn9              0.307
##     mpn1              0.471
##     mpn7              0.597
##     mpn10             0.528
##     mpn3              0.532
##     mpn5              0.743
##     mpn8              0.562
```

```r

residuals(fit2, "cor")
```

```
## $cor
##       mpn2   mpn4   mpn6   mpn9   mpn1   mpn7   mpn10  mpn3   mpn5   mpn8  
## mpn2   0.000                                                               
## mpn4  -0.042  0.000                                                        
## mpn6  -0.043  0.078  0.000                                                 
## mpn9  -0.042  0.110  0.093  0.000                                          
## mpn1   0.072  0.118  0.187  0.213  0.000                                   
## mpn7  -0.061 -0.034 -0.009  0.219 -0.032  0.000                            
## mpn10 -0.104 -0.154 -0.127  0.021 -0.008  0.032  0.000                     
## mpn3   0.064  0.092 -0.004 -0.033  0.101 -0.002 -0.067  0.000              
## mpn5   0.037 -0.035 -0.042 -0.091  0.138 -0.036 -0.115 -0.008  0.000       
## mpn8   0.026 -0.093  0.007 -0.006  0.129 -0.010 -0.023 -0.074  0.041  0.000
## 
## $mean
##  mpn2  mpn4  mpn6  mpn9  mpn1  mpn7 mpn10  mpn3  mpn5  mpn8 
##     0     0     0     0     0     0     0     0     0     0
```

```r
residuals(fit2, "standardized")
```

```
## $cov
##       mpn2   mpn4   mpn6   mpn9   mpn1   mpn7   mpn10  mpn3   mpn5   mpn8  
## mpn2      NA                                                               
## mpn4  -2.536     NA                                                        
## mpn6  -2.394  1.488     NA                                                 
## mpn9  -1.363  1.782  1.518     NA                                          
## mpn1   1.053  1.489  2.253  2.371     NA                                   
## mpn7  -1.150 -0.499 -0.133  2.535     NA     NA                            
## mpn10 -1.805 -2.202 -1.785  0.259 -0.731  1.681     NA                     
## mpn3   1.492  1.681 -0.087 -0.633  1.320 -0.037 -0.992     NA              
## mpn5   1.313 -1.681 -2.009 -3.584  2.025 -0.754 -2.216 -0.621     NA       
## mpn8   0.741 -2.871  0.159 -0.122  1.691 -0.162 -0.344 -3.848  1.525     NA
## 
## $mean
##  mpn2  mpn4  mpn6  mpn9  mpn1  mpn7 mpn10  mpn3  mpn5  mpn8 
##     0     0     0     0     0     0     0     0     0     0
```

```r
abs(residuals(fit2, "standardized")$cov) > 1.96
```

```
##        mpn2  mpn4  mpn6  mpn9  mpn1  mpn7 mpn10  mpn3  mpn5  mpn8
## mpn2     NA  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## mpn4   TRUE    NA FALSE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE
## mpn6   TRUE FALSE    NA FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE
## mpn9  FALSE FALSE FALSE    NA  TRUE  TRUE FALSE FALSE  TRUE FALSE
## mpn1  FALSE FALSE  TRUE  TRUE    NA    NA FALSE FALSE  TRUE FALSE
## mpn7  FALSE FALSE FALSE  TRUE    NA    NA FALSE FALSE FALSE FALSE
## mpn10 FALSE  TRUE FALSE FALSE FALSE FALSE    NA FALSE  TRUE FALSE
## mpn3  FALSE FALSE FALSE FALSE FALSE FALSE FALSE    NA FALSE  TRUE
## mpn5  FALSE FALSE  TRUE  TRUE  TRUE FALSE  TRUE FALSE    NA FALSE
## mpn8  FALSE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE    NA
```


The model is not satisfactory. The overall model fit is not great, but the close-fit hypothesis is not rejected outright (lower bound RMSEA = 0.048). Twelve of the standardized residuals are significant, so this model underpredicts relatively more relationships than the single-factor model.



#### 17. If you concluded that the three-factor model is unsatisfactory, run a model in which you "fix" the problem you identified in the previous step. Be prepared to draw a graphic representation of the model with the (standardized) factor loadings and the correlations between the factors. Is your new model satisfactory?
 
I committed the great sin of doing data-driven model-building. Of course, I had no choice because these variables are meaningless labels that start with with letters "mpn". I noticed significant standardized residuals between mpn1-mpn5, mpn1-mpn6 and mpn1-mpn9, and between mpn7-mpn9. Therefore I let factor 1 additionally load onto mpn1 and factor 2 additionally load onto mp9.


```r
m3 <- "\n  F1 =~ mpn2 + mpn4 + mpn6 + mpn9 + mpn1\n  F2 =~ mpn1 + mpn7 + mpn10 + mpn9\n  F3 =~ mpn3 + mpn5 + mpn8"
fit3 <- cfa(m3, d, likelihood = "wishart")
summary(fit3, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-14) converged normally after 102 iterations
## 
##   Number of observations                            98
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic               39.740
##   Degrees of freedom                                30
##   P-value (Chi-square)                           0.110
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic              439.029
##   Degrees of freedom                                45
##   P-value                                        0.000
## 
## Full model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    0.975
##   Tucker-Lewis Index (TLI)                       0.963
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)              -3035.038
##   Loglikelihood unrestricted model (H1)      -3014.963
## 
##   Number of free parameters                         25
##   Akaike (AIC)                                6120.076
##   Bayesian (BIC)                              6184.700
##   Sample-size adjusted Bayesian (BIC)         6105.754
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.058
##   90 Percent Confidence Interval          0.000  0.101
##   P-value RMSEA <= 0.05                          0.371
## 
## Standardized Root Mean Square Residual:
## 
##   SRMR                                           0.048
## 
## Parameter estimates:
## 
##   Information                                 Expected
##   Standard Errors                             Standard
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Latent variables:
##   F1 =~
##     mpn2              1.000                               6.127    0.808
##     mpn4              0.696    0.101    6.902    0.000    4.264    0.687
##     mpn6              0.708    0.104    6.803    0.000    4.335    0.679
##     mpn9              0.573    0.126    4.547    0.000    3.508    0.469
##     mpn1              0.260    0.089    2.914    0.004    1.592    0.277
##   F2 =~
##     mpn1              1.000                               3.212    0.559
##     mpn7              1.571    0.331    4.745    0.000    5.047    0.818
##     mpn10             1.502    0.311    4.832    0.000    4.823    0.728
##     mpn9              0.614    0.252    2.435    0.015    1.973    0.264
##   F3 =~
##     mpn3              1.000                               3.910    0.728
##     mpn5              1.726    0.216    7.981    0.000    6.749    0.864
##     mpn8              1.313    0.187    7.016    0.000    5.133    0.749
## 
## Covariances:
##   F1 ~~
##     F2                5.192    2.775    1.871    0.061    0.264    0.264
##     F3               22.433    4.495    4.991    0.000    0.936    0.936
##   F2 ~~
##     F3                3.948    1.837    2.149    0.032    0.314    0.314
## 
## Variances:
##     mpn2             20.028    4.098                     20.028    0.348
##     mpn4             20.336    3.375                     20.336    0.528
##     mpn6             22.013    3.626                     22.013    0.539
##     mpn9             36.173    5.581                     36.173    0.646
##     mpn1             17.443    3.041                     17.443    0.529
##     mpn7             12.615    4.238                     12.615    0.331
##     mpn10            20.611    4.608                     20.611    0.470
##     mpn3             13.540    2.282                     13.540    0.470
##     mpn5             15.446    3.713                     15.446    0.253
##     mpn8             20.608    3.560                     20.608    0.439
##     F1               37.539    8.281                      1.000    1.000
##     F2               10.314    3.774                      1.000    1.000
##     F3               15.287    3.845                      1.000    1.000
## 
## R-Square:
## 
##     mpn2              0.652
##     mpn4              0.472
##     mpn6              0.461
##     mpn9              0.354
##     mpn1              0.471
##     mpn7              0.669
##     mpn10             0.530
##     mpn3              0.530
##     mpn5              0.747
##     mpn8              0.561
```

```r
residuals(fit3, "standardized")
```

```
## $cov
##       mpn2   mpn4   mpn6   mpn9   mpn1   mpn7   mpn10  mpn3   mpn5   mpn8  
## mpn2      NA                                                               
## mpn4  -2.909     NA                                                        
## mpn6  -2.943  1.407     NA                                                 
## mpn9  -0.859  1.904  1.630     NA                                          
## mpn1  -1.488  0.196  1.274 -0.055     NA                                   
## mpn7   0.237  0.392  0.723  1.944     NA     NA                            
## mpn10 -0.437 -1.231 -0.866 -2.507  1.388     NA     NA                     
## mpn3   1.536  1.675 -0.124 -0.636 -0.213  0.620 -0.245     NA              
## mpn5   1.334 -1.930 -2.452 -3.795  0.073  0.307 -1.026 -0.696     NA       
## mpn8   0.801 -2.898  0.114 -0.133  0.228  0.538  0.398 -3.585  1.508     NA
## 
## $mean
##  mpn2  mpn4  mpn6  mpn9  mpn1  mpn7 mpn10  mpn3  mpn5  mpn8 
##     0     0     0     0     0     0     0     0     0     0
```

```r
abs(residuals(fit3, "standardized")$cov) > 1.96
```

```
##        mpn2  mpn4  mpn6  mpn9  mpn1  mpn7 mpn10  mpn3  mpn5  mpn8
## mpn2     NA  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## mpn4   TRUE    NA FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
## mpn6   TRUE FALSE    NA FALSE FALSE FALSE FALSE FALSE  TRUE FALSE
## mpn9  FALSE FALSE FALSE    NA FALSE FALSE  TRUE FALSE  TRUE FALSE
## mpn1  FALSE FALSE FALSE FALSE    NA    NA FALSE FALSE FALSE FALSE
## mpn7  FALSE FALSE FALSE FALSE    NA    NA    NA FALSE FALSE FALSE
## mpn10 FALSE FALSE FALSE  TRUE FALSE    NA    NA FALSE FALSE FALSE
## mpn3  FALSE FALSE FALSE FALSE FALSE FALSE FALSE    NA FALSE  TRUE
## mpn5  FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE    NA FALSE
## mpn8  FALSE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE    NA
```

```r
anova(fit2, fit3)
```

```
## Chi Square Difference Test
## 
##      Df  AIC  BIC Chisq Chisq diff Df diff Pr(>Chisq)    
## fit3 30 6120 6185  39.7                                  
## fit2 32 6131 6190  54.2       14.5       2    0.00072 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```


The revised model no longer has a significant chi-square test, and the RMSEA is improved. The model has fewer significant standardized residuals (7). AIC and chi-square difference tests support the conclusion that this model is _more_ satistisfactory than the previous model. Philosophically, the model is unsatisfactory because I had no theoretical motive for manipulating the paths.
