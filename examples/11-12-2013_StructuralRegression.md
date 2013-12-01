Structural Regression Models
===============================================================================


```r
library(lavaan)
library(foreign)
data_carnet <- read.spss("../data/data_carnet3.sav", to.data.frame = TRUE)
round(psych::describe(data_carnet, skew = FALSE), 2)
```

```
##          var  n  mean    sd median trimmed   mad    min    max  range   se
## idvar      1 98 60.26 33.23  60.50   60.55 43.74   2.00 115.00 113.00 3.36
## cond*      2 98  1.49  0.50   1.00    1.49  0.00   1.00   2.00   1.00 0.05
## sexe*      3 98  1.07  0.26   1.00    1.00  0.00   1.00   2.00   1.00 0.03
## diffma     4 91 15.62  6.19  16.00   15.64  7.41   2.00  28.00  26.00 0.65
## difffr     5 88 17.36  5.34  18.00   17.50  5.93   5.00  28.00  23.00 0.57
## mpn1       6 98 11.24  5.74  11.00   10.99  5.93   1.00  24.00  23.00 0.58
## mpn2       7 98 11.71  7.59  12.00   11.35  8.90   1.00  28.00  27.00 0.77
## mpn3       8 98  5.56  5.37   4.00    4.66  4.45   1.00  28.00  27.00 0.54
## mpn4       9 98  8.14  6.21   7.00    7.64  8.15   1.00  21.00  20.00 0.63
## mpn5      10 98 10.34  7.81   8.50    9.75  8.15   1.00  27.00  26.00 0.79
## mpn6      11 98 10.20  6.39  10.00    9.94  7.41   1.00  26.00  25.00 0.65
## mpn7      12 98 12.76  6.17  12.50   12.72  5.19   1.00  26.00  25.00 0.62
## mpn8      13 98 10.07  6.85   8.00    9.57  8.90   1.00  26.00  25.00 0.69
## mpn9      14 98 11.63  7.49  11.00   11.26  8.90   1.00  27.00  26.00 0.76
## mpn10     15 98 14.14  6.62  14.00   14.16  7.41   1.00  28.00  27.00 0.67
## moyprj    16 98 11.38  3.82  11.37   11.31  3.95   3.27  20.60  17.33 0.39
## dismoyma  17 93 11.93  4.86  11.25   11.41  4.45   4.50  27.00  22.50 0.50
## dismoyfr  18 91 12.82  5.33  12.00   12.41  5.56   4.00  27.00  23.00 0.56
## diffmedi  19 88 -1.74  5.30  -1.00   -1.68  4.45 -17.00  15.00  32.00 0.57
## dismedi   20 91 -0.92  3.17  -0.75   -0.82  2.22  -9.50   8.75  18.25 0.33
## posit     21 98 12.88  3.96  12.88   12.83  3.06   4.00  22.62  18.62 0.40
## negat     22 98  9.67  5.18   8.71    9.49  5.29   1.29  22.86  21.57 0.52
## pair      23 98 12.59  3.92  12.29   12.44  3.71   2.57  23.86  21.29 0.40
## impair    24 98 10.32  4.16  10.62   10.28  4.54   2.25  20.00  17.75 0.42
```


> Please find below the R script I used in class today. In models 6 and 7 (which are mathematically equivalent), we are assuming that mpn7, the single indicator of the factor F2, has been measured with perfect reliability. In model 8, we are assuming that the reliability of mpn7 is .7, i.e., that 30% of its variability is due to random noise.


The Measurement Model
-------------------------------------------------------------------------------


### One latent variable


```r
m1 <- '
  # latent variable definitions
    Fsingle =~ mpn1 + mpn2 + mpn3 + mpn4 + mpn5 + 
               mpn6 + mpn7 + mpn8 + mpn9 + mpn10'
fit1 <- sem(m1, data_carnet, likelihood = "wishart")
summary(fit1, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after  44 iterations
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
## User model versus baseline model:
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
##   Bayesian (BIC)                              6234.243
##   Sample-size adjusted Bayesian (BIC)         6171.090
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.150
##   90 Percent Confidence Interval          0.119  0.182
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
##   Fsingle =~
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
##     Fsingle           7.621    3.184                      1.000    1.000
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
residuals(fit1, type = "cor")
```

```
## $cor
##       mpn1   mpn2   mpn3   mpn4   mpn5   mpn6   mpn7   mpn8   mpn9  
## mpn1   0.000                                                        
## mpn2  -0.091  0.000                                                 
## mpn3  -0.046  0.039  0.000                                          
## mpn4  -0.015 -0.015  0.076  0.000                                   
## mpn5  -0.021  0.031  0.014 -0.034  0.000                            
## mpn6   0.053 -0.021 -0.024  0.102 -0.044  0.000                     
## mpn7   0.333 -0.086 -0.023 -0.053 -0.050 -0.030  0.000              
## mpn8  -0.014  0.014 -0.063 -0.098  0.078 -0.001 -0.025  0.000       
## mpn9   0.100 -0.028 -0.052  0.127 -0.096  0.107  0.201 -0.017  0.000
## mpn10  0.379 -0.056 -0.020 -0.112 -0.052 -0.086  0.514  0.029  0.053
##       mpn10 
## mpn1        
## mpn2        
## mpn3        
## mpn4        
## mpn5        
## mpn6        
## mpn7        
## mpn8        
## mpn9        
## mpn10  0.000
## 
## $mean
##  mpn1  mpn2  mpn3  mpn4  mpn5  mpn6  mpn7  mpn8  mpn9 mpn10 
##     0     0     0     0     0     0     0     0     0     0
```

```r
residuals(fit1, type = "standardized")
```

```
## $cov
##       mpn1   mpn2   mpn3   mpn4   mpn5   mpn6   mpn7   mpn8   mpn9  
## mpn1      NA                                                        
## mpn2  -2.358     NA                                                 
## mpn3  -0.899  1.029     NA                                          
## mpn4  -0.256 -0.456  1.469     NA                                   
## mpn5  -0.560  1.106  0.475 -1.431     NA                            
## mpn6   0.816 -0.629 -0.571  1.720 -2.047     NA                     
## mpn7   3.556 -1.867 -0.395 -0.815 -1.228 -0.448     NA              
## mpn8  -0.259  0.422 -2.286 -3.101  1.904 -0.034 -0.440     NA       
## mpn9   1.341 -0.693 -1.114  1.907 -4.112  1.631  2.399 -0.338     NA
## mpn10  3.909 -1.098 -0.333 -1.647 -1.192 -1.259  4.722  0.467  0.661
##       mpn10 
## mpn1        
## mpn2        
## mpn3        
## mpn4        
## mpn5        
## mpn6        
## mpn7        
## mpn8        
## mpn9        
## mpn10     NA
## 
## $mean
##  mpn1  mpn2  mpn3  mpn4  mpn5  mpn6  mpn7  mpn8  mpn9 mpn10 
##     0     0     0     0     0     0     0     0     0     0
```


### Three latent variables


```r
m2 <- '
  # latent variable definitions
    F1 =~ mpn2 + mpn4 + mpn6 + mpn9
    F2 =~ mpn1 + mpn7 + mpn10
    F3 =~ mpn3 + mpn5 + mpn8'
fit2 <- sem(m2, data_carnet, likelihood = "wishart")
summary(fit2, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after  99 iterations
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
## User model versus baseline model:
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
##   Bayesian (BIC)                              6189.909
##   Sample-size adjusted Bayesian (BIC)         6117.283
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.085
##   90 Percent Confidence Interval          0.043  0.122
##   P-value RMSEA <= 0.05                          0.079
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
residuals(fit2, type = "cor")
```

```
## $cor
##       mpn2   mpn4   mpn6   mpn9   mpn1   mpn7   mpn10  mpn3   mpn5  
## mpn2   0.000                                                        
## mpn4  -0.042  0.000                                                 
## mpn6  -0.043  0.078  0.000                                          
## mpn9  -0.042  0.110  0.093  0.000                                   
## mpn1   0.072  0.118  0.187  0.213  0.000                            
## mpn7  -0.061 -0.034 -0.009  0.219 -0.032  0.000                     
## mpn10 -0.104 -0.154 -0.127  0.021 -0.008  0.032  0.000              
## mpn3   0.064  0.092 -0.004 -0.033  0.101 -0.002 -0.067  0.000       
## mpn5   0.037 -0.035 -0.042 -0.091  0.138 -0.036 -0.115 -0.008  0.000
## mpn8   0.026 -0.093  0.007 -0.006  0.129 -0.010 -0.023 -0.074  0.041
##       mpn8  
## mpn2        
## mpn4        
## mpn6        
## mpn9        
## mpn1        
## mpn7        
## mpn10       
## mpn3        
## mpn5        
## mpn8   0.000
## 
## $mean
##  mpn2  mpn4  mpn6  mpn9  mpn1  mpn7 mpn10  mpn3  mpn5  mpn8 
##     0     0     0     0     0     0     0     0     0     0
```

```r
residuals(fit2, type = "standardized")
```

```
## $cov
##       mpn2   mpn4   mpn6   mpn9   mpn1   mpn7   mpn10  mpn3   mpn5  
## mpn2      NA                                                        
## mpn4  -2.536     NA                                                 
## mpn6  -2.394  1.488     NA                                          
## mpn9  -1.363  1.782  1.518     NA                                   
## mpn1   1.053  1.489  2.253  2.371     NA                            
## mpn7  -1.150 -0.499 -0.133  2.535     NA     NA                     
## mpn10 -1.805 -2.202 -1.785  0.259 -0.731  1.681     NA              
## mpn3   1.492  1.681 -0.087 -0.633  1.320 -0.037 -0.992     NA       
## mpn5   1.313 -1.681 -2.009 -3.584  2.025 -0.754 -2.216 -0.621     NA
## mpn8   0.741 -2.871  0.159 -0.122  1.691 -0.162 -0.344 -3.848  1.525
##       mpn8  
## mpn2        
## mpn4        
## mpn6        
## mpn9        
## mpn1        
## mpn7        
## mpn10       
## mpn3        
## mpn5        
## mpn8      NA
## 
## $mean
##  mpn2  mpn4  mpn6  mpn9  mpn1  mpn7 mpn10  mpn3  mpn5  mpn8 
##     0     0     0     0     0     0     0     0     0     0
```


Problem: Factors F1 and F3 are too highly correlated (r = .94).

### Two latent variables


```r
m3 <- '
  # latent variable definitions
    F1 =~ mpn2 + mpn3 + mpn4 + mpn5 + mpn6 + mpn8 + mpn9
    F2 =~ mpn1 + mpn7 + mpn10'
fit3 <- sem(m3, data_carnet, likelihood = "wishart")
summary(fit3, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after  70 iterations
## 
##   Number of observations                            98
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic               56.307
##   Degrees of freedom                                34
##   P-value (Chi-square)                           0.009
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic              439.029
##   Degrees of freedom                                45
##   P-value                                        0.000
## 
## User model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    0.943
##   Tucker-Lewis Index (TLI)                       0.925
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)              -3043.407
##   Loglikelihood unrestricted model (H1)      -3014.963
## 
##   Number of free parameters                         21
##   Akaike (AIC)                                6128.814
##   Bayesian (BIC)                              6182.883
##   Sample-size adjusted Bayesian (BIC)         6116.572
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.082
##   90 Percent Confidence Interval          0.041  0.119
##   P-value RMSEA <= 0.05                          0.089
## 
## Standardized Root Mean Square Residual:
## 
##   SRMR                                           0.081
## 
## Parameter estimates:
## 
##   Information                                 Expected
##   Standard Errors                             Standard
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Latent variables:
##   F1 =~
##     mpn2              1.000                               6.110    0.805
##     mpn3              0.646    0.084    7.691    0.000    3.945    0.735
##     mpn4              0.674    0.099    6.797    0.000    4.120    0.664
##     mpn5              1.070    0.118    9.045    0.000    6.540    0.838
##     mpn6              0.683    0.102    6.666    0.000    4.173    0.653
##     mpn8              0.824    0.107    7.686    0.000    5.032    0.734
##     mpn9              0.651    0.124    5.252    0.000    3.978    0.531
##   F2 =~
##     mpn1              1.000                               3.939    0.686
##     mpn7              1.211    0.219    5.527    0.000    4.771    0.773
##     mpn10             1.222    0.223    5.476    0.000    4.813    0.727
## 
## Covariances:
##   F1 ~~
##     F2                9.858    3.386    2.911    0.004    0.410    0.410
## 
## Variances:
##     mpn2             20.236    3.724                     20.236    0.352
##     mpn3             13.264    2.211                     13.264    0.460
##     mpn4             21.538    3.408                     21.538    0.559
##     mpn5             18.211    3.629                     18.211    0.299
##     mpn6             23.392    3.680                     23.392    0.573
##     mpn8             21.632    3.605                     21.632    0.461
##     mpn9             40.207    6.051                     40.207    0.718
##     mpn1             17.477    3.403                     17.477    0.530
##     mpn7             15.324    3.944                     15.324    0.402
##     mpn10            20.712    4.498                     20.712    0.472
##     F1               37.331    8.082                      1.000    1.000
##     F2               15.514    4.629                      1.000    1.000
## 
## R-Square:
## 
##     mpn2              0.648
##     mpn3              0.540
##     mpn4              0.441
##     mpn5              0.701
##     mpn6              0.427
##     mpn8              0.539
##     mpn9              0.282
##     mpn1              0.470
##     mpn7              0.598
##     mpn10             0.528
```

```r
residuals(fit3, type = "cor")
```

```
## $cor
##       mpn2   mpn3   mpn4   mpn5   mpn6   mpn8   mpn9   mpn1   mpn7  
## mpn2   0.000                                                        
## mpn3   0.027  0.000                                                 
## mpn4  -0.024  0.073  0.000                                          
## mpn5   0.017  0.006 -0.038  0.000                                   
## mpn6  -0.025 -0.023  0.105 -0.044  0.000                            
## mpn8   0.004 -0.067 -0.099  0.073  0.001  0.000                     
## mpn9  -0.022 -0.044  0.136 -0.087  0.119 -0.006  0.000              
## mpn1   0.064  0.099  0.117  0.144  0.185  0.132  0.214  0.000       
## mpn7  -0.069 -0.005 -0.036 -0.029 -0.011 -0.006  0.220 -0.032  0.000
## mpn10 -0.111 -0.069 -0.155 -0.108 -0.128 -0.019  0.022 -0.007  0.032
##       mpn10 
## mpn2        
## mpn3        
## mpn4        
## mpn5        
## mpn6        
## mpn8        
## mpn9        
## mpn1        
## mpn7        
## mpn10  0.000
## 
## $mean
##  mpn2  mpn3  mpn4  mpn5  mpn6  mpn8  mpn9  mpn1  mpn7 mpn10 
##     0     0     0     0     0     0     0     0     0     0
```

```r
residuals(fit3, type = "standardized")
```

```
## $cov
##       mpn2   mpn3   mpn4   mpn5   mpn6   mpn8   mpn9   mpn1   mpn7  
## mpn2      NA                                                        
## mpn3   0.783     NA                                                 
## mpn4  -0.797  1.426     NA                                          
## mpn5   0.746  0.230 -1.834     NA                                   
## mpn6  -0.806 -0.556  1.754 -2.141     NA                            
## mpn8   0.146 -2.605 -3.211  1.852  0.031     NA                     
## mpn9  -0.567 -0.912  2.015 -3.556  1.774 -0.123     NA              
## mpn1   0.910  1.276  1.421  1.990  2.169  1.682  2.331     NA       
## mpn7  -1.202 -0.076 -0.495 -0.537 -0.146 -0.095  2.474     NA     NA
## mpn10 -1.816 -1.006 -2.113 -1.873 -1.717 -0.273  0.263 -0.677  1.679
##       mpn10 
## mpn2        
## mpn3        
## mpn4        
## mpn5        
## mpn6        
## mpn8        
## mpn9        
## mpn1        
## mpn7        
## mpn10     NA
## 
## $mean
##  mpn2  mpn3  mpn4  mpn5  mpn6  mpn8  mpn9  mpn1  mpn7 mpn10 
##     0     0     0     0     0     0     0     0     0     0
```

```r
anova(fit1, fit3)
```

```
## Chi Square Difference Test
## 
##      Df  AIC  BIC Chisq Chisq diff Df diff Pr(>Chisq)    
## fit3 34 6129 6183  56.3                                  
## fit1 35 6183 6234 111.7       55.4       1      1e-13 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```


## Introduction to structural models

Let's ignore the fact that F1 and F3 are too highly correlated.

### Our first structural model: three causal paths


```r
m4 <- '
  # latent variable definitions
    F1 =~ mpn2 + mpn4 + mpn6 + mpn9
    F2 =~ mpn1 + mpn7 + mpn10
    F3 =~ mpn3 + mpn5 + mpn8
  # regressions
    F3 ~ F1
    F2 ~ F3 + F1'
fit4 <- sem(m4, data_carnet, likelihood = "wishart")
summary(fit4, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after  94 iterations
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
## User model versus baseline model:
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
##   Bayesian (BIC)                              6189.909
##   Sample-size adjusted Bayesian (BIC)         6117.283
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.085
##   90 Percent Confidence Interval          0.043  0.122
##   P-value RMSEA <= 0.05                          0.079
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
## Regressions:
##   F3 ~
##     F1                0.600    0.089    6.770    0.000    0.939    0.939
##   F2 ~
##     F3                0.318    0.675    0.471    0.638    0.316    0.316
##     F1                0.063    0.433    0.145    0.884    0.098    0.098
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
##     F2               12.920    3.950                      0.832    0.832
##     F3                1.810    1.301                      0.118    0.118
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
##     F2                0.168
##     F3                0.882
```

```r
anova(fit2,fit4)
```

```
## Chi Square Difference Test
## 
##      Df  AIC  BIC Chisq Chisq diff Df diff Pr(>Chisq)
## fit2 32 6131 6190  54.2                              
## fit4 32 6131 6190  54.2  -2.69e-11       0          1
```


### Two causal paths (over-identified structural component)


```r
m5 <- '
  # latent variable definitions
    F1 =~ mpn2 + mpn4 + mpn6 + mpn9
    F2 =~ mpn1 + mpn7 + mpn10
    F3 =~ mpn3 + mpn5 + mpn8
  # regressions
    F3 ~ F1
    F2 ~ F3'
fit5 <- sem(m5, data_carnet, likelihood = "wishart")
summary(fit5, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after  78 iterations
## 
##   Number of observations                            98
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic               54.225
##   Degrees of freedom                                33
##   P-value (Chi-square)                           0.011
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic              439.029
##   Degrees of freedom                                45
##   P-value                                        0.000
## 
## User model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    0.946
##   Tucker-Lewis Index (TLI)                       0.927
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)              -3042.355
##   Loglikelihood unrestricted model (H1)      -3014.963
## 
##   Number of free parameters                         22
##   Akaike (AIC)                                6128.710
##   Bayesian (BIC)                              6185.353
##   Sample-size adjusted Bayesian (BIC)         6115.885
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.081
##   90 Percent Confidence Interval          0.039  0.119
##   P-value RMSEA <= 0.05                          0.098
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
##   F1 =~
##     mpn2              1.000                               6.140    0.809
##     mpn4              0.691    0.100    6.883    0.000    4.241    0.683
##     mpn6              0.700    0.104    6.757    0.000    4.297    0.673
##     mpn9              0.674    0.125    5.395    0.000    4.137    0.553
##   F2 =~
##     mpn1              1.000                               3.938    0.686
##     mpn7              1.210    0.219    5.526    0.000    4.765    0.772
##     mpn10             1.224    0.223    5.478    0.000    4.821    0.728
##   F3 =~
##     mpn3              1.000                               3.919    0.730
##     mpn5              1.716    0.215    7.980    0.000    6.723    0.861
##     mpn8              1.311    0.186    7.033    0.000    5.136    0.749
## 
## Regressions:
##   F3 ~
##     F1                0.600    0.088    6.794    0.000    0.941    0.941
##   F2 ~
##     F3                0.414    0.132    3.136    0.002    0.412    0.412
## 
## Variances:
##     mpn2             19.863    4.071                     19.863    0.345
##     mpn4             20.530    3.390                     20.530    0.533
##     mpn6             22.341    3.656                     22.341    0.548
##     mpn9             38.916    5.970                     38.916    0.695
##     mpn1             17.485    3.403                     17.485    0.530
##     mpn7             15.376    3.942                     15.376    0.404
##     mpn10            20.635    4.498                     20.635    0.470
##     mpn3             13.470    2.276                     13.470    0.467
##     mpn5             15.795    3.713                     15.795    0.259
##     mpn8             20.580    3.559                     20.580    0.438
##     F1               37.704    8.284                      1.000    1.000
##     F2               12.877    3.942                      0.830    0.830
##     F3                1.769    1.283                      0.115    0.115
## 
## R-Square:
## 
##     mpn2              0.655
##     mpn4              0.467
##     mpn6              0.452
##     mpn9              0.305
##     mpn1              0.470
##     mpn7              0.596
##     mpn10             0.530
##     mpn3              0.533
##     mpn5              0.741
##     mpn8              0.562
##     F2                0.170
##     F3                0.885
```


### Model where outcome variable is an observed (manifest) variable


```r
m6 <- '
  # latent variable definitions
    F1 =~ mpn2 + mpn4 + mpn6 + mpn9
    F3 =~ mpn3 + mpn5 + mpn8
  # regressions
    F3 ~ F1
    mpn7 ~ F3'
fit6 <- sem(m6, data_carnet, likelihood = "wishart")
summary(fit6, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after  66 iterations
## 
##   Number of observations                            98
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic               36.881
##   Degrees of freedom                                19
##   P-value (Chi-square)                           0.008
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic              340.555
##   Degrees of freedom                                28
##   P-value                                        0.000
## 
## User model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    0.943
##   Tucker-Lewis Index (TLI)                       0.916
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)              -2448.624
##   Loglikelihood unrestricted model (H1)      -2429.993
## 
##   Number of free parameters                         17
##   Akaike (AIC)                                4931.248
##   Bayesian (BIC)                              4975.018
##   Sample-size adjusted Bayesian (BIC)         4921.338
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.099
##   90 Percent Confidence Interval          0.049  0.146
##   P-value RMSEA <= 0.05                          0.053
## 
## Standardized Root Mean Square Residual:
## 
##   SRMR                                           0.061
## 
## Parameter estimates:
## 
##   Information                                 Expected
##   Standard Errors                             Standard
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Latent variables:
##   F1 =~
##     mpn2              1.000                               6.145    0.810
##     mpn4              0.690    0.100    6.894    0.000    4.243    0.684
##     mpn6              0.698    0.103    6.752    0.000    4.291    0.672
##     mpn9              0.672    0.125    5.388    0.000    4.129    0.552
##   F3 =~
##     mpn3              1.000                               3.923    0.731
##     mpn5              1.713    0.215    7.982    0.000    6.721    0.861
##     mpn8              1.305    0.186    7.016    0.000    5.121    0.747
## 
## Regressions:
##   F3 ~
##     F1                0.601    0.088    6.811    0.000    0.942    0.942
##   mpn7 ~
##     F3                0.469    0.169    2.772    0.006    1.840    0.298
## 
## Variances:
##     mpn2             19.801    4.064                     19.801    0.344
##     mpn4             20.513    3.387                     20.513    0.533
##     mpn6             22.394    3.661                     22.394    0.549
##     mpn9             38.977    5.977                     38.977    0.696
##     mpn3             13.436    2.275                     13.436    0.466
##     mpn5             15.810    3.733                     15.810    0.259
##     mpn8             20.733    3.580                     20.733    0.442
##     mpn7             34.699    5.045                     34.699    0.911
##     F1               37.766    8.287                      1.000    1.000
##     F3                1.730    1.287                      0.112    0.112
## 
## R-Square:
## 
##     mpn2              0.656
##     mpn4              0.467
##     mpn6              0.451
##     mpn9              0.304
##     mpn3              0.534
##     mpn5              0.741
##     mpn8              0.558
##     mpn7              0.089
##     F3                0.888
```


### One factor has only one indicator (same model, written differently)

Note: in both models, which are equivalent, we are assuming that the latent factor explains 100% of the variance in its (single) indicator. Probably an unreasonable assumption.


```r
m7 <- '
  # latent variable definitions
    F1 =~ mpn2 + mpn4 + mpn6 + mpn9
    F2 =~ mpn7
    F3 =~ mpn3 + mpn5 + mpn8
  # regressions
    F3 ~ F1
    F2 ~ F3
  # residual correlations
    mpn7 ~~ 0*mpn7'
fit7 <- sem(m7, data_carnet, likelihood = "wishart")
summary(fit7, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after 148 iterations
## 
##   Number of observations                            98
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic               36.881
##   Degrees of freedom                                19
##   P-value (Chi-square)                           0.008
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic              340.555
##   Degrees of freedom                                28
##   P-value                                        0.000
## 
## User model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    0.943
##   Tucker-Lewis Index (TLI)                       0.916
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)              -2448.624
##   Loglikelihood unrestricted model (H1)      -2429.993
## 
##   Number of free parameters                         17
##   Akaike (AIC)                                4931.248
##   Bayesian (BIC)                              4975.018
##   Sample-size adjusted Bayesian (BIC)         4921.338
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.099
##   90 Percent Confidence Interval          0.049  0.146
##   P-value RMSEA <= 0.05                          0.053
## 
## Standardized Root Mean Square Residual:
## 
##   SRMR                                           0.061
## 
## Parameter estimates:
## 
##   Information                                 Expected
##   Standard Errors                             Standard
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Latent variables:
##   F1 =~
##     mpn2              1.000                               6.145    0.810
##     mpn4              0.690    0.100    6.894    0.000    4.243    0.684
##     mpn6              0.698    0.103    6.752    0.000    4.291    0.672
##     mpn9              0.672    0.125    5.388    0.000    4.129    0.552
##   F2 =~
##     mpn7              1.000                               6.171    1.000
##   F3 =~
##     mpn3              1.000                               3.923    0.731
##     mpn5              1.713    0.215    7.982    0.000    6.721    0.861
##     mpn8              1.305    0.186    7.016    0.000    5.121    0.747
## 
## Regressions:
##   F3 ~
##     F1                0.601    0.088    6.811    0.000    0.942    0.942
##   F2 ~
##     F3                0.469    0.169    2.772    0.006    0.298    0.298
## 
## Variances:
##     mpn7              0.000                               0.000    0.000
##     mpn2             19.801    4.064                     19.801    0.344
##     mpn4             20.513    3.387                     20.513    0.533
##     mpn6             22.394    3.661                     22.394    0.549
##     mpn9             38.977    5.977                     38.977    0.696
##     mpn3             13.436    2.275                     13.436    0.466
##     mpn5             15.810    3.733                     15.810    0.259
##     mpn8             20.733    3.580                     20.733    0.442
##     F1               37.766    8.287                      1.000    1.000
##     F2               34.699    5.045                      0.911    0.911
##     F3                1.730    1.287                      0.112    0.112
## 
## R-Square:
## 
##     mpn7              1.000
##     mpn2              0.656
##     mpn4              0.467
##     mpn6              0.451
##     mpn9              0.304
##     mpn3              0.534
##     mpn5              0.741
##     mpn8              0.558
##     F2                0.089
##     F3                0.888
```

```r
# Get the sample covariance matrix
inspect(fit7, "sampstat")
```

```
## $cov
##      mpn2   mpn4   mpn6   mpn9   mpn7   mpn3   mpn5   mpn8  
## mpn2 57.567                                                 
## mpn4 24.041 38.515                                          
## mpn6 24.286 21.342 40.803                                   
## mpn9 23.038 22.723 22.292 56.029                            
## mpn7  8.713  6.685  7.731 17.950 38.084                     
## mpn3 25.183 18.682 15.678 13.940  7.541 28.826              
## mpn5 40.963 25.096 25.096 20.929 11.362 26.046 60.989       
## mpn8 30.969 16.526 21.057 19.697  9.564 17.392 36.800 46.954
## 
## $mean
##   mpn2   mpn4   mpn6   mpn9   mpn7   mpn3   mpn5   mpn8 
## 11.714  8.143 10.204 11.633 12.755  5.561 10.337 10.071
```


### Fixed measurement error

Our third structural model: same model, but this time we are fixing the variance of the measurement error of mpn7 to 30% of the variance of mpn7.


```r
m8 <- '
  # latent variable definitions
    F1 =~ mpn2 + mpn4 + mpn6 + mpn9
    F2 =~ mpn7
    F3 =~ mpn3 + mpn5 + mpn8
  # regressions
    F3 ~ F1
    F2 ~ F3
  # residual correlations
    mpn7 ~~ 11.42*mpn7'
fit8 <- sem(m8, data_carnet, likelihood = "wishart")
summary(fit8, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after  72 iterations
## 
##   Number of observations                            98
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic               36.881
##   Degrees of freedom                                19
##   P-value (Chi-square)                           0.008
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic              340.555
##   Degrees of freedom                                28
##   P-value                                        0.000
## 
## User model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    0.943
##   Tucker-Lewis Index (TLI)                       0.916
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)              -2448.624
##   Loglikelihood unrestricted model (H1)      -2429.993
## 
##   Number of free parameters                         17
##   Akaike (AIC)                                4931.248
##   Bayesian (BIC)                              4975.018
##   Sample-size adjusted Bayesian (BIC)         4921.338
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.099
##   90 Percent Confidence Interval          0.049  0.146
##   P-value RMSEA <= 0.05                          0.053
## 
## Standardized Root Mean Square Residual:
## 
##   SRMR                                           0.061
## 
## Parameter estimates:
## 
##   Information                                 Expected
##   Standard Errors                             Standard
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Latent variables:
##   F1 =~
##     mpn2              1.000                               6.145    0.810
##     mpn4              0.690    0.100    6.894    0.000    4.243    0.684
##     mpn6              0.698    0.103    6.752    0.000    4.291    0.672
##     mpn9              0.672    0.125    5.388    0.000    4.129    0.552
##   F2 =~
##     mpn7              1.000                               5.164    0.837
##   F3 =~
##     mpn3              1.000                               3.923    0.731
##     mpn5              1.713    0.215    7.982    0.000    6.721    0.861
##     mpn8              1.305    0.186    7.016    0.000    5.121    0.747
## 
## Regressions:
##   F3 ~
##     F1                0.601    0.088    6.811    0.000    0.942    0.942
##   F2 ~
##     F3                0.469    0.169    2.772    0.006    0.356    0.356
## 
## Variances:
##     mpn7             11.420                              11.420    0.300
##     mpn2             19.801    4.064                     19.801    0.344
##     mpn4             20.513    3.387                     20.513    0.533
##     mpn6             22.394    3.661                     22.394    0.549
##     mpn9             38.977    5.977                     38.977    0.696
##     mpn3             13.436    2.275                     13.436    0.466
##     mpn5             15.810    3.733                     15.810    0.259
##     mpn8             20.733    3.580                     20.733    0.442
##     F1               37.766    8.287                      1.000    1.000
##     F2               23.279    5.045                      0.873    0.873
##     F3                1.730    1.287                      0.112    0.112
## 
## R-Square:
## 
##     mpn7              0.700
##     mpn2              0.656
##     mpn4              0.467
##     mpn6              0.451
##     mpn9              0.304
##     mpn3              0.534
##     mpn5              0.741
##     mpn8              0.558
##     F2                0.127
##     F3                0.888
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
## [1] foreign_0.8-53 lavaan_0.5-15  knitr_1.5     
## 
## loaded via a namespace (and not attached):
##  [1] evaluate_0.5.1  formatR_0.10    MASS_7.3-26     mnormt_1.4-5   
##  [5] pbivnorm_0.5-1  psych_1.3.10.12 quadprog_1.5-5  stats4_3.0.1   
##  [9] stringr_0.6.2   tools_3.0.1
```

