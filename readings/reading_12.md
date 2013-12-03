Questions about Rex Kline's book (for Tues., Dec. 3)
===============================================================================

> Read chapter 12 of Kline's book and be prepared to answer the questions below. Please also do the data analysis exercise described in steps 14, 15, and 16. 


```r
library(lavaan)
library(foreign)
options(width = 100, digits = 3)
# Data for exercise 20.
covmatrix <- matrix(c(6.5025, 4.79349, 4.652985, 4.37376, 0.19941, 4.79349, 
    5.8081, 4.521401, 4.391984, 0.22172, 4.652985, 4.521401, 6.6049, 5.1657, 
    0.242351, 4.37376, 4.391984, 5.1657, 7.1824, 0.295872, 0.19941, 0.22172, 
    0.242351, 0.295872, 0.0529), nrow = 5, dimnames = list(c("sales1", "sales2", 
    "sales3", "sales4", "region"), c("sales1", "sales2", "sales3", "sales4", 
    "region")))
myDataMeans <- c(6.08, 7.22, 8.14, 9.38, 0.48)
names(myDataMeans) <- c("sales1", "sales2", "sales3", "sales4", "region")
```


Reading
-------------------------------------------------------------------------------

### 1. Kline talks about "conditional regression lines"? What are they? How do we know whether the slope of a given "conditional regression line" is statistically significant?



### 2. According to Whisman and McClelland (2005), is better to focus on standardized or unstandardized regression coefficients in moderated multiple regression? Why?



### 3. When we include product terms in a multiple regression analysis, we often face the problem that the product term is very highly correlated with at least one of the two variables that constitute it. What can be done about this problem of collinearity?



### 4. According to Kenny, interactive effects can easily be confounded with curvilinear effects. Why is that?



### 5. Explain to a novice what "mediated moderation" is (without looking at your notes).  

Stuffing and turkey are just okay, but compliment each other really well (moderation). But no matter how well the two go together, you need gravy for a truly delicious thanksgiving plate (mediation).


### 6. Briefly describe the "indicant product approach" of SEM (the Kenny-Judd method) using the example of an interaction between two exogenous latent factors (A and B) that each has two indicators.



### 7. What are two major problems of the "indicant product approach" (the Kenny-Judd method)?



### 8. Andreas Klein and his colleagues recently suggested new approaches to estimate interaction effects in SEM. What are these approaches called and what is their advantage over the "indicant product approach" (the Kenny-Judd method)?



### 9. Explain to a novice what a "design effect" is (without looking at your notes).



### 10. What does Kline mean when he talks about "cross-level interactions"?



### 11. What is a "slopes-and-intercepts-as-outcomes model"?



### 12. Which hypothesis exactly is being tested in the slopes-and intercepts-as-outcomes model" shown in Figure 12.8?



### 13. Kline talks about three basic steps in analyzing a multilevel structural equation model. Describe these three steps.

1. 
2. 
3. 

Israel Data Analysis
-------------------------------------------------------------------------------

### 14. Run analyses on the Israel dataset. 

> First, run a one-factor confirmatory factor analysis with the variables v7, v8, v9, v11, v12, v13, v16, v17, v18, v19, v20, and v21. Determine whether this model has a satisfactory fit.


```r
# Load data and fit model
d <- as.matrix(read.csv("../data/data_israel.csv", row.names = 1))
m1 <- "F =~ V7 + V8 + V9 + V11 + V12 + V13 + V16 + V17 + V18 + V19 + V20 + V21"
fit1 <- cfa(m1, sample.cov = d, sample.nobs = 450, likelihood = "wishart")
# Inspect the model
summary(fit1, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after  28 iterations
## 
##   Number of observations                           450
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic             1595.144
##   Degrees of freedom                                54
##   P-value (Chi-square)                           0.000
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic             2898.287
##   Degrees of freedom                                66
##   P-value                                        0.000
## 
## User model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    0.456
##   Tucker-Lewis Index (TLI)                       0.335
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)              -6302.756
##   Loglikelihood unrestricted model (H1)      -5503.408
## 
##   Number of free parameters                         24
##   Akaike (AIC)                               12653.513
##   Bayesian (BIC)                             12752.081
##   Sample-size adjusted Bayesian (BIC)        12675.914
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.252
##   90 Percent Confidence Interval          0.242  0.263
##   P-value RMSEA <= 0.05                          0.000
## 
## Standardized Root Mean Square Residual:
## 
##   SRMR                                           0.161
## 
## Parameter estimates:
## 
##   Information                                 Expected
##   Standard Errors                             Standard
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Latent variables:
##   F =~
##     V7                1.000                               0.464    0.637
##     V8                1.492    0.125   11.963    0.000    0.692    0.685
##     V9                1.503    0.123   12.246    0.000    0.697    0.707
##     V11               1.329    0.128   10.390    0.000    0.617    0.575
##     V12               1.379    0.120   11.456    0.000    0.640    0.648
##     V13               1.363    0.131   10.440    0.000    0.632    0.579
##     V16               0.783    0.073   10.692    0.000    0.363    0.596
##     V17              -0.950    0.092  -10.294    0.000   -0.441   -0.569
##     V18               0.863    0.085   10.128    0.000    0.400    0.558
##     V19              -0.781    0.098   -7.959    0.000   -0.362   -0.424
##     V20              -0.723    0.101   -7.174    0.000   -0.336   -0.379
##     V21              -0.733    0.110   -6.675    0.000   -0.340   -0.351
## 
## Variances:
##     V7                0.315    0.024                      0.315    0.594
##     V8                0.541    0.042                      0.541    0.530
##     V9                0.488    0.039                      0.488    0.501
##     V11               0.769    0.056                      0.769    0.669
##     V12               0.564    0.043                      0.564    0.580
##     V13               0.793    0.058                      0.793    0.665
##     V16               0.240    0.018                      0.240    0.645
##     V17               0.406    0.029                      0.406    0.676
##     V18               0.354    0.025                      0.354    0.688
##     V19               0.598    0.041                      0.598    0.820
##     V20               0.671    0.046                      0.671    0.856
##     V21               0.824    0.056                      0.824    0.877
##     F                 0.215    0.030                      1.000    1.000
## 
## R-Square:
## 
##     V7                0.406
##     V8                0.470
##     V9                0.499
##     V11               0.331
##     V12               0.420
##     V13               0.335
##     V16               0.355
##     V17               0.324
##     V18               0.312
##     V19               0.180
##     V20               0.144
##     V21               0.123
```


The model has a very unsatisfactory fit, RMSEA = 0.25, SRMR = 0.16, chi-square(54) = 1595.14, p < 0.001.


### 15. Run a confirmatory factor analysis with four factors

> "Friends" (v7, v8, v9), "Attitude" (v11, v12, v13), "Relaxed" (v16, v17, v18), and "Religion" (v19, v20, v21). Determine whether this model has a satisfactory fit.


```r
m2 <- "
  Friends =~ V7 + V8 + V9 
  Attitude =~ V11 + V12 + V13
  Relaxed =~ V16 + V17 + V18 
  Religion =~ V19 + V20 + V21"
fit2 <- cfa(m2, sample.cov = d, sample.nobs = 450, likelihood = "wishart")
summary(fit2, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after  41 iterations
## 
##   Number of observations                           450
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic               82.442
##   Degrees of freedom                                48
##   P-value (Chi-square)                           0.001
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic             2898.287
##   Degrees of freedom                                66
##   P-value                                        0.000
## 
## User model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    0.988
##   Tucker-Lewis Index (TLI)                       0.983
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)              -5544.721
##   Loglikelihood unrestricted model (H1)      -5503.408
## 
##   Number of free parameters                         30
##   Akaike (AIC)                               11149.442
##   Bayesian (BIC)                             11272.652
##   Sample-size adjusted Bayesian (BIC)        11177.444
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.040
##   90 Percent Confidence Interval          0.025  0.054
##   P-value RMSEA <= 0.05                          0.868
## 
## Standardized Root Mean Square Residual:
## 
##   SRMR                                           0.040
## 
## Parameter estimates:
## 
##   Information                                 Expected
##   Standard Errors                             Standard
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Latent variables:
##   Friends =~
##     V7                1.000                               0.492    0.675
##     V8                1.836    0.115   15.971    0.000    0.903    0.894
##     V9                1.785    0.112   15.956    0.000    0.878    0.890
##   Attitude =~
##     V11               1.000                               0.811    0.756
##     V12               1.081    0.066   16.379    0.000    0.876    0.888
##     V13               0.963    0.066   14.566    0.000    0.781    0.715
##   Relaxed =~
##     V16               1.000                               0.522    0.856
##     V17              -1.186    0.068  -17.509    0.000   -0.619   -0.799
##     V18               1.046    0.062   16.783    0.000    0.546    0.761
##   Religion =~
##     V19               1.000                               0.699    0.819
##     V20               1.141    0.053   21.510    0.000    0.798    0.902
##     V21               1.189    0.057   20.760    0.000    0.831    0.858
## 
## Covariances:
##   Friends ~~
##     Attitude          0.190    0.027    7.119    0.000    0.476    0.476
##     Relaxed           0.111    0.016    6.866    0.000    0.433    0.433
##     Religion         -0.097    0.020   -4.960    0.000   -0.282   -0.282
##   Attitude ~~
##     Relaxed           0.207    0.027    7.542    0.000    0.489    0.489
##     Religion         -0.127    0.032   -4.012    0.000   -0.225   -0.225
##   Relaxed ~~
##     Religion         -0.069    0.020   -3.453    0.001   -0.190   -0.190
## 
## Variances:
##     V7                0.288    0.021                      0.288    0.544
##     V8                0.205    0.030                      0.205    0.201
##     V9                0.203    0.029                      0.203    0.209
##     V11               0.492    0.044                      0.492    0.428
##     V12               0.206    0.035                      0.206    0.212
##     V13               0.584    0.048                      0.584    0.489
##     V16               0.100    0.013                      0.100    0.268
##     V17               0.217    0.021                      0.217    0.362
##     V18               0.216    0.019                      0.216    0.420
##     V19               0.240    0.021                      0.240    0.329
##     V20               0.147    0.020                      0.147    0.187
##     V21               0.249    0.026                      0.249    0.265
##     Friends           0.242    0.031                      1.000    1.000
##     Attitude          0.657    0.075                      1.000    1.000
##     Relaxed           0.272    0.026                      1.000    1.000
##     Religion          0.489    0.048                      1.000    1.000
## 
## R-Square:
## 
##     V7                0.456
##     V8                0.799
##     V9                0.791
##     V11               0.572
##     V12               0.788
##     V13               0.511
##     V16               0.732
##     V17               0.638
##     V18               0.580
##     V19               0.671
##     V20               0.813
##     V21               0.735
```

```r
residuals(fit2, type = "standardized")$cov
```

```
##     V7     V8     V9     V11    V12    V13    V16    V17    V18    V19    V20    V21   
## V7      NA                                                                             
## V8   0.239     NA                                                                      
## V9      NA  1.454     NA                                                               
## V11  0.779 -1.697  0.154     NA                                                        
## V12  1.203 -1.289  1.103  0.943     NA                                                 
## V13  1.921 -0.619  0.221 -0.701 -0.514     NA                                          
## V16  1.688 -0.421  1.088 -0.890 -2.682 -0.280     NA                                   
## V17 -1.340  1.511 -0.786  0.564 -0.346 -0.334 -0.972     NA                            
## V18  0.743 -2.366  0.133  1.272  1.437  3.104  0.099  1.616     NA                     
## V19 -4.409 -2.689 -1.649 -1.664 -1.012 -2.086 -0.794  0.376  0.081     NA              
## V20 -3.662  0.085  3.517 -0.635  2.040 -0.195 -0.065  0.002  0.324     NA     NA       
## V21 -2.168  1.443  3.435 -0.663  1.777 -1.136  0.238  0.144  0.767     NA  1.490     NA
```

```r
# Look at the distribution of the correlation residuals
(cor_resid <- residuals(fit2, type = "cor")$cor)
```

```
##     V7     V8     V9     V11    V12    V13    V16    V17    V18    V19    V20    V21   
## V7   0.000                                                                             
## V8   0.002  0.000                                                                      
## V9  -0.018  0.004  0.000                                                               
## V11  0.027 -0.041  0.004  0.000                                                        
## V12  0.038 -0.020  0.019  0.004  0.000                                                 
## V13  0.071 -0.017  0.006 -0.007 -0.002  0.000                                          
## V16  0.056 -0.008  0.023 -0.023 -0.042 -0.008  0.000                                   
## V17 -0.047  0.034 -0.019  0.016 -0.008 -0.010 -0.004  0.000                            
## V18  0.026 -0.059  0.004  0.040  0.037  0.107  0.000  0.009  0.000                     
## V19 -0.169 -0.074 -0.045 -0.055 -0.026 -0.073 -0.022  0.012  0.003  0.000              
## V20 -0.129  0.002  0.065 -0.018  0.037 -0.006 -0.001  0.000  0.009 -0.003  0.000       
## V21 -0.077  0.033  0.076 -0.021  0.039 -0.038  0.006  0.004  0.024 -0.003  0.004  0.000
```

```r
cor_resid[upper.tri(cor_resid, diag = TRUE)] <- NA
stem(cor_resid)
```

```
## 
##   The decimal point is 1 digit(s) to the left of the |
## 
##   -1 | 7
##   -1 | 3
##   -0 | 877665
##   -0 | 444432222222211111100000
##    0 | 00000000000111112222333344444
##    0 | 6778
##    1 | 1
```


The model has a much more satisfactory fit. The RMSEA equals 0.04 with a 90% confidence interval between 0.025--0.054, so the close-fit hypothesis is retained and the poor-fit hypothesis is rejected. The SRMR equals 0.04 with 5 residual correlations equaling or exceeding 0.8 in absolute value. The chi-square test for 48 degrees of freedom equals 82.44, p = 0.001, so the exact-fit hypothesis is rejected. 

### 16. Run the structural regression model depicted below

![Exercise 16 Model](figure/reading12_sr_model.png)

> Determine whether this model has a satisfactory fit. What conclusions would you draw from the analyses you have run in steps 14, 15, and 16?


```r
m3 <- "\n  Friends =~ V7 + V8 + V9 \n  Attitude =~ V11 + V12 + V13\n  Relaxed =~ V16 + V17 + V18 \n  Religion =~ V19 + V20 + V21\n  Attitude ~ Relaxed\n  Relaxed ~ Friends\n  Friends ~ Religion"
fit3 <- cfa(m3, likelihood = "wishart", sample.cov = d, sample.nobs = 450)
summary(fit3, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after  37 iterations
## 
##   Number of observations                           450
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic              123.076
##   Degrees of freedom                                51
##   P-value (Chi-square)                           0.000
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic             2898.287
##   Degrees of freedom                                66
##   P-value                                        0.000
## 
## User model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    0.975
##   Tucker-Lewis Index (TLI)                       0.967
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)              -5565.083
##   Loglikelihood unrestricted model (H1)      -5503.408
## 
##   Number of free parameters                         27
##   Akaike (AIC)                               11184.167
##   Bayesian (BIC)                             11295.057
##   Sample-size adjusted Bayesian (BIC)        11209.369
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.056
##   90 Percent Confidence Interval          0.044  0.069
##   P-value RMSEA <= 0.05                          0.203
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
##   Friends =~
##     V7                1.000                               0.492    0.675
##     V8                1.844    0.116   15.931    0.000    0.907    0.898
##     V9                1.777    0.112   15.899    0.000    0.874    0.885
##   Attitude =~
##     V11               1.000                               0.811    0.757
##     V12               1.080    0.067   16.022    0.000    0.876    0.888
##     V13               0.962    0.066   14.515    0.000    0.780    0.714
##   Relaxed =~
##     V16               1.000                               0.518    0.849
##     V17              -1.193    0.068  -17.540    0.000   -0.618   -0.797
##     V18               1.055    0.063   16.814    0.000    0.546    0.762
##   Religion =~
##     V19               1.000                               0.699    0.819
##     V20               1.143    0.053   21.494    0.000    0.799    0.902
##     V21               1.189    0.057   20.738    0.000    0.831    0.857
## 
## Regressions:
##   Attitude ~
##     Relaxed           0.804    0.089    8.992    0.000    0.514    0.514
##   Relaxed ~
##     Friends           0.484    0.059    8.153    0.000    0.460    0.460
##   Friends ~
##     Religion         -0.202    0.038   -5.349    0.000   -0.287   -0.287
## 
## Variances:
##     V7                0.288    0.021                      0.288    0.544
##     V8                0.198    0.031                      0.198    0.194
##     V9                0.211    0.030                      0.211    0.216
##     V11               0.491    0.045                      0.491    0.428
##     V12               0.206    0.037                      0.206    0.212
##     V13               0.584    0.048                      0.584    0.490
##     V16               0.104    0.013                      0.104    0.279
##     V17               0.219    0.021                      0.219    0.364
##     V18               0.216    0.019                      0.216    0.420
##     V19               0.240    0.021                      0.240    0.330
##     V20               0.146    0.021                      0.146    0.186
##     V21               0.249    0.026                      0.249    0.265
##     Friends           0.222    0.029                      0.917    0.917
##     Attitude          0.484    0.058                      0.736    0.736
##     Relaxed           0.212    0.022                      0.789    0.789
##     Religion          0.489    0.048                      1.000    1.000
## 
## R-Square:
## 
##     V7                0.456
##     V8                0.806
##     V9                0.784
##     V11               0.572
##     V12               0.788
##     V13               0.510
##     V16               0.721
##     V17               0.636
##     V18               0.580
##     V19               0.670
##     V20               0.814
##     V21               0.735
##     Friends           0.083
##     Attitude          0.264
##     Relaxed           0.211
```

```r
residuals(fit3, type = "standardized")$cov
```

```
##     V7     V8     V9     V11    V12    V13    V16    V17    V18    V19    V20    V21   
## V7      NA                                                                             
## V8  -0.241     NA                                                                      
## V9      NA  1.495     NA                                                               
## V11  3.385  2.921  3.942     NA                                                        
## V12  4.166  4.248  5.109  1.019     NA                                                 
## V13  4.137  3.229  3.745 -0.831 -0.571     NA                                          
## V16  1.302 -1.468  0.328 -1.457 -3.836 -0.735     NA                                   
## V17 -0.956  2.492 -0.111  1.101  0.414  0.098 -1.571     NA                            
## V18  0.360 -3.313 -0.512  0.833  0.815  2.772  0.746  1.127     NA                     
## V19 -4.342 -2.550 -1.542 -3.248 -3.023 -3.502 -1.475  1.145 -0.768     NA              
## V20 -3.579  0.357  3.624 -2.697 -1.936 -2.307 -1.113  0.984 -0.709     NA     NA       
## V21 -2.091  1.670  3.507 -2.628 -1.744 -2.866 -0.880  1.024 -0.334     NA  1.515     NA
```

```r
# Look at the distribution of the correlation residuals
(cor_resid2 <- residuals(fit3, type = "cor")$cor)
```

```
##     V7     V8     V9     V11    V12    V13    V16    V17    V18    V19    V20    V21   
## V7   0.000                                                                             
## V8  -0.001  0.000                                                                      
## V9  -0.015  0.005  0.000                                                               
## V11  0.150  0.121  0.166  0.000                                                        
## V12  0.182  0.170  0.210  0.004  0.000                                                 
## V13  0.187  0.136  0.160 -0.007 -0.001  0.000                                          
## V16  0.043 -0.027  0.007 -0.036 -0.058 -0.020  0.000                                   
## V17 -0.033  0.054 -0.003  0.030  0.009  0.003 -0.011  0.000                            
## V18  0.013 -0.078 -0.013  0.025  0.020  0.093  0.005  0.008  0.000                     
## V19 -0.166 -0.069 -0.042 -0.152 -0.141 -0.165 -0.064  0.050 -0.034  0.000              
## V20 -0.126  0.007  0.068 -0.125 -0.089 -0.107 -0.047  0.042 -0.031 -0.003  0.000       
## V21 -0.074  0.037  0.079 -0.122 -0.080 -0.134 -0.038  0.044 -0.014 -0.002  0.004  0.000
```

```r
cor_resid2[upper.tri(cor_resid2, diag = TRUE)] <- NA
stem(cor_resid2)
```

```
## 
##   The decimal point is 1 digit(s) to the left of the |
## 
##   -1 | 775
##   -1 | 433321
##   -0 | 98877665
##   -0 | 444333321111100000
##    0 | 00000111112334444
##    0 | 55789
##    1 | 24
##    1 | 567789
##    2 | 1
```

```r
anova(fit2, fit3)
```

```
## Chi Square Difference Test
## 
##      Df   AIC   BIC Chisq Chisq diff Df diff Pr(>Chisq)    
## fit2 48 11149 11273  82.4                                  
## fit3 51 11184 11295 123.1       40.6       3    7.8e-09 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```


The model is an over-simplification of the previous CFA model. The RMSEA equals 0.056 with a 90% confidence interval between 0.044--0.069, so the close-fit hypothesis is retained and the poor-fit hypothesis is rejected. However, the SRMR equals 0.08 with 23 residual correlations equaling or exceeding 0.8 in absolute value; this is a case where an acceptable average correlation residual obscures a significant number of large correlation residuals. The model is a significant oversimplification of the related model with no causal paths, chi-square-diff(3) = 40.64, p < 0.001.


### 17. Transform the covariance matrix into a correlation matrix and examine the correlations. 

> Are the variables supposed to measure the same latent construct highly (and positively) correlated with each other? Are there out-of-bounds correlations? If you think there is a problem with these correlations, say what the problem is? If not, what did you look at before concluding that these correlations are OK?


```r
# Prepare subsets of the correlation matrix
d_cor <- cov2cor(d)
v_friends <- c("V7", "V8", "V9")
v_attitude <- c("V11", "V12", "V13")
v_relaxed <- c("V16", "V17", "V18")
v_religion <- c("V19", "V20", "V21")
v_all <- c(v_friends, v_attitude, v_relaxed, v_religion)
# Check for out of bounds values
abs(d_cor[v_all, v_all]) > 1
```

```
##        V7    V8    V9   V11   V12   V13   V16   V17   V18   V19   V20   V21
## V7  FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## V8  FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## V9  FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## V11 FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## V12 FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## V13 FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## V16 FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## V17 FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## V18 FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## V19 FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## V20 FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## V21 FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
```

```r
# Check correlations within factors
d_cor[v_friends, v_friends]
```

```
##       V7    V8    V9
## V7 1.000 0.605 0.583
## V8 0.605 1.000 0.800
## V9 0.583 0.800 1.000
```

```r
d_cor[v_religion, v_religion]
```

```
##       V19   V20   V21
## V19 1.000 0.735 0.699
## V20 0.735 1.000 0.777
## V21 0.699 0.777 1.000
```

```r
d_cor[v_relaxed, v_relaxed]
```

```
##        V16    V17    V18
## V16  1.000 -0.688  0.652
## V17 -0.688  1.000 -0.600
## V18  0.652 -0.600  1.000
```

```r
d_cor[v_attitude, v_attitude]
```

```
##       V11   V12   V13
## V11 1.000 0.675 0.533
## V12 0.675 1.000 0.633
## V13 0.533 0.633 1.000
```


There are no out of bounds values. However, one of the indicators for the relaxed factor is reverse-coded with respect to its counterparts. This error in coding undermines the validity of the above analyses.




Multigroup CFA
-------------------------------------------------------------------------------

### 18. Go through the R script "multigroup CFA and test of difference of factor means" I sent you last Tuesday. 


```r
# Load the data-sets
d_intell_fem <- read.spss("../data/Grnt_fem.sav", to.data.frame = TRUE)
d_intell_mal <- read.spss("../data/Grnt_mal.sav", to.data.frame = TRUE)
d_intell_fem$gender <- "female"
d_intell_mal$gender <- "male"
d <- rbind(d_intell_fem, d_intell_mal)
# Make a numeric version of `gender`
d <- transform(d, sex = ifelse(gender == "female", 0, 1))
```


> Redo all the analyses on your computer. In addition, obtain a large number of fit indices (and the correlation residuals) for the final model (the one with the over-identified mean structure = "m6"). Is this model satisfactory? Which parameters tell us whether there is a gender difference on each of the two factors? Are these parameters statistically significant? What conclusions can you draw from all the analyses performed on this dataset?

I already computed all of these last week, so I am going to jump ahead to the final model.


```r
m_factor_means <- "\n  spatial =~ visperc + cubes + lozenges \n  verbal =~ paragrap + sentence + wordmean\n  verbal ~ c(a, b)*1\n  spatial ~ c(c, d)*1\n  a == 0\n  c == 0"
h_factor_means <- cfa(m_factor_means, data = d, likelihood = "wishart", group = "gender", group.equal = c("loadings", 
    "intercepts"))
summary(h_factor_means, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after 567 iterations
## 
##   Number of observations per group         
##   female                                            73
##   male                                              72
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic               22.536
##   Degrees of freedom                                24
##   P-value (Chi-square)                           0.547
## 
## Chi-square for each group:
## 
##   female                                        10.878
##   male                                          11.658
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic              337.557
##   Degrees of freedom                                30
##   P-value                                        0.000
## 
## User model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    1.000
##   Tucker-Lewis Index (TLI)                       1.006
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)              -2573.097
##   Loglikelihood unrestricted model (H1)      -2561.672
## 
##   Number of free parameters                         30
##   Akaike (AIC)                                5206.194
##   Bayesian (BIC)                              5295.080
##   Sample-size adjusted Bayesian (BIC)         5200.155
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.000
##   90 Percent Confidence Interval          0.000  0.089
##   P-value RMSEA <= 0.05                          0.749
## 
## Standardized Root Mean Square Residual:
## 
##   SRMR                                           0.051
## 
## Parameter estimates:
## 
##   Information                                 Expected
##   Standard Errors                             Standard
## 
## Group 1 [female]:
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Latent variables:
##   spatial =~
##     visperc           1.000                               4.637    0.673
##     cubes             0.557    0.114    4.866    0.000    2.582    0.586
##     lozenges          1.371    0.255    5.370    0.000    6.358    0.786
##   verbal =~
##     paragrap          1.000                               3.176    0.882
##     sentence          1.279    0.114   11.266    0.000    4.062    0.815
##     wordmean          2.211    0.194   11.389    0.000    7.020    0.842
## 
## Covariances:
##   spatial ~~
##     verbal            7.288    2.483    2.935    0.003    0.495    0.495
## 
## Intercepts:
##     verbal    (a)     0.000    0.000    7.677    0.000    0.000    0.000
##     spatial   (c)     0.000    0.000    6.640    0.000    0.000    0.000
##     visperc          29.079    0.743   39.161    0.000   29.079    4.221
##     cubes            24.525    0.455   53.877    0.000   24.525    5.569
##     lozenges         15.140    0.920   16.459    0.000   15.140    1.872
##     paragrap         10.411    0.411   25.359    0.000   10.411    2.892
##     sentence         19.479    0.546   35.684    0.000   19.479    3.909
##     wordmean         18.328    0.932   19.657    0.000   18.328    2.200
## 
## Variances:
##     visperc          25.965    5.911                     25.965    0.547
##     cubes            12.722    2.524                     12.722    0.656
##     lozenges         25.002    8.305                     25.002    0.382
##     paragrap          2.878    0.865                      2.878    0.222
##     sentence          8.325    1.850                      8.325    0.335
##     wordmean         20.153    4.921                     20.153    0.290
##     spatial          21.501    6.972                      1.000    1.000
##     verbal           10.085    2.092                      1.000    1.000
## 
## 
## 
## Group 2 [male]:
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Latent variables:
##   spatial =~
##     visperc           1.000                               3.997    0.575
##     cubes             0.557    0.114    4.866    0.000    2.226    0.492
##     lozenges          1.371    0.255    5.370    0.000    5.481    0.649
##   verbal =~
##     paragrap          1.000                               2.669    0.866
##     sentence          1.279    0.114   11.266    0.000    3.414    0.810
##     wordmean          2.211    0.194   11.389    0.000    5.899    0.793
## 
## Covariances:
##   spatial ~~
##     verbal            7.079    2.119    3.341    0.001    0.664    0.664
## 
## Intercepts:
##     verbal    (b)    -0.956    0.524   -1.823    0.068   -0.358   -0.358
##     spatial   (d)     1.066    0.887    1.201    0.230    0.267    0.267
##     visperc          29.079    0.743   39.161    0.000   29.079    4.185
##     cubes            24.525    0.455   53.877    0.000   24.525    5.420
##     lozenges         15.140    0.920   16.459    0.000   15.140    1.793
##     paragrap         10.411    0.411   25.359    0.000   10.411    3.377
##     sentence         19.479    0.546   35.684    0.000   19.479    4.622
##     wordmean         18.328    0.932   19.657    0.000   18.328    2.462
## 
## Variances:
##     visperc          32.311    6.766                     32.311    0.669
##     cubes            15.521    2.972                     15.521    0.758
##     lozenges         41.293    9.967                     41.293    0.579
##     paragrap          2.382    0.702                      2.382    0.251
##     sentence          6.107    1.422                      6.107    0.344
##     wordmean         20.607    4.567                     20.607    0.372
##     spatial          15.976    5.838                      1.000    1.000
##     verbal            7.121    1.512                      1.000    1.000
## 
## 
## Constraints:                               Slack (>=0)
##     a - 0                                        0.000
##     c - 0                                        0.000
## 
## R-Square Group female:
## 
##     visperc           0.453
##     cubes             0.344
##     lozenges          0.618
##     paragrap          0.778
##     sentence          0.665
##     wordmean          0.710
## 
## R-Square Group male:
## 
##     visperc           0.331
##     cubes             0.242
##     lozenges          0.421
##     paragrap          0.749
##     sentence          0.656
##     wordmean          0.628
```

```r
residuals(h_factor_means, type = "cor")
```

```
## $female
## $female$cor
##          visprc cubes  lozngs pargrp sentnc wordmn
## visperc   0.000                                   
## cubes     0.088  0.000                            
## lozenges -0.037  0.031  0.000                     
## paragrap  0.049 -0.045 -0.017  0.000              
## sentence  0.095 -0.058  0.018  0.005  0.000       
## wordmean -0.051 -0.061  0.041  0.000  0.009  0.000
## 
## $female$mean
##  visperc    cubes lozenges paragrap sentence wordmean 
##    0.236    0.174   -0.304    0.178   -0.178   -0.315 
## 
## 
## $male
## $male$cor
##          visprc cubes  lozngs pargrp sentnc wordmn
## visperc   0.000                                   
## cubes    -0.122  0.000                            
## lozenges  0.035  0.028  0.000                     
## paragrap  0.043 -0.013  0.038  0.000              
## sentence -0.055 -0.121 -0.073  0.004  0.000       
## wordmean  0.124 -0.045  0.023 -0.012  0.024  0.000
## 
## $male$mean
##  visperc    cubes lozenges paragrap sentence wordmean 
##   -0.298   -0.215    0.510   -0.149    0.132    0.326
```

```r
residuals(h_factor_means, type = "standardized")
```

```
## $female
## $female$cov
##          visprc cubes  lozngs pargrp sentnc wordmn
## visperc   0.173                                   
## cubes     1.357  0.818                            
## lozenges     NA  0.661     NA                     
## paragrap  0.658 -0.504 -0.689 -1.686              
## sentence  1.183 -0.547  0.244  0.225  0.425       
## wordmean -0.696 -0.641  0.569 -0.843  0.374 -0.073
## 
## $female$mean
##  visperc    cubes lozenges paragrap sentence wordmean 
##    0.732    0.639   -2.876    2.449   -0.781   -1.122 
## 
## 
## $male
## $male$cov
##          visprc cubes  lozngs pargrp sentnc wordmn
## visperc   0.005                                   
## cubes    -1.807     NA                            
## lozenges  0.668  0.340  0.621                     
## paragrap  0.530 -0.295  0.621 -0.324              
## sentence -0.739 -1.605 -0.986 -0.176 -0.285       
## wordmean  1.405 -0.570  0.422 -0.185  0.510  0.348
## 
## $male$mean
##  visperc    cubes lozenges paragrap sentence wordmean 
##   -0.738   -0.793    1.136   -2.157    0.961    0.979
```


Is the model satisfactory...

The male subjects had a mean spatial factor 1.01 units higher than the female subjects, but this difference is not significant, z = 1.2, p = 0.23. The female subjects had a mean verbal factor 0.96 units higher than the male subjects, and this difference falls just short of achieving significance, z = 1.82, p = 0.068. 



### 19. What about the MIMIC model that is in the same R script (= "m7")? 

> Does this model come to the same conclusions as the model discussed in the previous point? Please remind me what assumption is being made in this model. Do you think this is a reasonable assumption? Why?


```r
m_mimic <- '
  spatial =~ visperc + cubes + lozenges 
  verbal =~ paragrap + sentence + wordmean
  spatial ~ sex
  verbal ~ sex
  sex ~~ sex
  # Note: Correlated disturbances
  spatial ~~ verbal'
h_mimic <- cfa(m_mimic, data = d, likelihood = "wishart")
```

```
## Warning: lavaan WARNING: model syntax contains variance/covariance/intercept formulas
##   involving (an) exogenous variable(s): [sex];
##   Please use fixed.x=FALSE or leave them alone
```

```r
summary(h_mimic, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after  76 iterations
## 
##   Number of observations                           145
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic                7.940
##   Degrees of freedom                                12
##   P-value (Chi-square)                           0.790
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic              333.945
##   Degrees of freedom                                21
##   P-value                                        0.000
## 
## User model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    1.000
##   Tucker-Lewis Index (TLI)                       1.023
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)              -2679.686
##   Loglikelihood unrestricted model (H1)      -2675.689
## 
##   Number of free parameters                         16
##   Akaike (AIC)                                5391.373
##   Bayesian (BIC)                              5438.890
##   Sample-size adjusted Bayesian (BIC)         5388.261
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.000
##   90 Percent Confidence Interval          0.000  0.057
##   P-value RMSEA <= 0.05                          0.931
## 
## Standardized Root Mean Square Residual:
## 
##   SRMR                                           0.031
## 
## Parameter estimates:
## 
##   Information                                 Expected
##   Standard Errors                             Standard
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Latent variables:
##   spatial =~
##     visperc           1.000                               4.280    0.619
##     cubes             0.544    0.117    4.634    0.000    2.328    0.524
##     lozenges          1.462    0.281    5.210    0.000    6.258    0.752
##   verbal =~
##     paragrap          1.000                               2.955    0.875
##     sentence          1.291    0.114   11.366    0.000    3.814    0.820
##     wordmean          2.216    0.194   11.420    0.000    6.548    0.824
## 
## Regressions:
##   spatial ~
##     sex               1.086    0.858    1.266    0.205    0.254    0.127
##   verbal ~
##     sex              -0.949    0.518   -1.831    0.067   -0.321   -0.161
## 
## Covariances:
##   spatial ~~
##     verbal            6.940    1.723    4.028    0.000    0.561    0.561
## 
## Variances:
##     sex               0.252    0.030                      0.252    1.000
##     visperc          29.480    4.692                     29.480    0.617
##     cubes            14.339    1.987                     14.339    0.726
##     lozenges         30.014    7.261                     30.014    0.434
##     paragrap          2.663    0.582                      2.663    0.234
##     sentence          7.070    1.178                      7.070    0.327
##     wordmean         20.284    3.423                     20.284    0.321
##     spatial          18.024    5.360                      0.984    0.984
##     verbal            8.504    1.362                      0.974    0.974
## 
## R-Square:
## 
##     visperc           0.383
##     cubes             0.274
##     lozenges          0.566
##     paragrap          0.766
##     sentence          0.673
##     wordmean          0.679
##     spatial           0.016
##     verbal            0.026
```


These estimates are approximate the estimated group differences in the previous model. This model of course assumes measurement invariance across the groups. This assumption is reasonable but only because we tested and confirmed measurement invariance across the groups already.

```
Regressions:       Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
  spatial ~
    sex               1.086    0.858    1.266    0.205    0.254    0.127
  verbal ~
    sex              -0.949    0.518   -1.831    0.067   -0.321   -0.161
```


### 20. Go through the R script "latent growth curve model - sales dataset" I sent you last Tuesday. 

> Redo all the analyses on your computer. In the first analysis (the one without region), interpret each of the two paths from "one" to the two latent variables? What do these parameter estimates tell us? Are they significant? 



```r
m_growth <- "
  IS =~ 1*sales1 + 1*sales2 + 1*sales3 + 1*sales4
  LC =~ 0*sales1 + 1*sales2 + 2*sales3 + 3*sales4
  LC + IS ~ 1
  sales1 + sales2 + sales3 + sales4 ~ 0*1"
h_growth <- cfa(m_growth, sample.cov = covmatrix, sample.mean = myDataMeans, 
                sample.nobs = 51, likelihood = "wishart")
summary(h_growth, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after  41 iterations
## 
##   Number of observations                            51
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic                1.061
##   Degrees of freedom                                 5
##   P-value (Chi-square)                           0.958
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic              136.878
##   Degrees of freedom                                 6
##   P-value                                        0.000
## 
## User model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    1.000
##   Tucker-Lewis Index (TLI)                       1.036
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)               -411.214
##   Loglikelihood unrestricted model (H1)       -410.673
## 
##   Number of free parameters                          9
##   Akaike (AIC)                                 840.429
##   Bayesian (BIC)                               857.637
##   Sample-size adjusted Bayesian (BIC)          829.387
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.000
##   90 Percent Confidence Interval          0.000  0.000
##   P-value RMSEA <= 0.05                          0.967
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
##   IS =~
##     sales1            1.000                               2.279    0.905
##     sales2            1.000                               2.279    0.918
##     sales3            1.000                               2.279    0.892
##     sales4            1.000                               2.279    0.856
##   LC =~
##     sales1            0.000                               0.000    0.000
##     sales2            1.000                               0.497    0.200
##     sales3            2.000                               0.994    0.389
##     sales4            3.000                               1.491    0.560
## 
## Covariances:
##   IS ~~
##     LC               -0.332    0.308   -1.076    0.282   -0.293   -0.293
## 
## Intercepts:
##     LC                1.082    0.103   10.532    0.000    2.176    2.176
##     IS                6.085    0.348   17.495    0.000    2.670    2.670
##     sales1            0.000                               0.000    0.000
##     sales2            0.000                               0.000    0.000
##     sales3            0.000                               0.000    0.000
##     sales4            0.000                               0.000    0.000
## 
## Variances:
##     sales1            1.143    0.563                      1.143    0.180
##     sales2            1.390    0.390                      1.390    0.225
##     sales3            1.665    0.446                      1.665    0.255
##     sales4            1.668    0.678                      1.668    0.235
##     IS                5.194    1.248                      1.000    1.000
##     LC                0.247    0.138                      1.000    1.000
## 
## R-Square:
## 
##     sales1            0.820
##     sales2            0.775
##     sales3            0.745
##     sales4            0.765
```



The path from the constant to the Initial Status factor estimates the intercept of sales, and the path to the Linear Change factor estimates the linear effect of time on sales. 

There is a significant linear effect of time on sales. On average, sales increase by 1.08 units annually, z = 10.53, p < 0.001.

> In the second analysis (the one with region), interpret the following five paths: the paths from "one" to "region" and to the two latent variables and the paths from "region" to the two latent variables? What do these parameter estimates tell us? Are they significant?



```r
m_growth_2 <- "
  IS =~ 1*sales1 + 1*sales2 + 1*sales3 + 1*sales4
  LC =~ 0*sales1 + 1*sales2 + 2*sales3 + 3*sales4
  LC ~ region
  IS ~ region
  LC ~~ IS
  LC + IS + region ~ 1
  sales1 + sales2 + sales3 + sales4 ~ 0*1"
h_growth_2 <- cfa(m_growth_2, sample.cov = covmatrix, sample.mean = myDataMeans, 
                  sample.nobs = 51, likelihood = "wishart")
```

```
## Warning: lavaan WARNING: model syntax contains variance/covariance/intercept formulas
##   involving (an) exogenous variable(s): [region];
##   Please use fixed.x=FALSE or leave them alone
```

```r
summary(h_growth_2, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after  52 iterations
## 
##   Number of observations                            51
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic                1.352
##   Degrees of freedom                                 7
##   P-value (Chi-square)                           0.987
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic              150.778
##   Degrees of freedom                                10
##   P-value                                        0.000
## 
## User model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    1.000
##   Tucker-Lewis Index (TLI)                       1.057
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)               -401.686
##   Loglikelihood unrestricted model (H1)       -400.997
## 
##   Number of free parameters                         13
##   Akaike (AIC)                                 829.372
##   Bayesian (BIC)                               854.228
##   Sample-size adjusted Bayesian (BIC)          813.423
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.000
##   90 Percent Confidence Interval          0.000  0.000
##   P-value RMSEA <= 0.05                          0.991
## 
## Standardized Root Mean Square Residual:
## 
##   SRMR                                           0.024
## 
## Parameter estimates:
## 
##   Information                                 Expected
##   Standard Errors                             Standard
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Latent variables:
##   IS =~
##     sales1            1.000                               2.281    0.906
##     sales2            1.000                               2.281    0.919
##     sales3            1.000                               2.281    0.890
##     sales4            1.000                               2.281    0.859
##   LC =~
##     sales1            0.000                               0.000    0.000
##     sales2            1.000                               0.503    0.203
##     sales3            2.000                               1.006    0.392
##     sales4            3.000                               1.509    0.568
## 
## Regressions:
##   LC ~
##     region            0.577    0.439    1.315    0.188    1.147    0.264
##   IS ~
##     region            3.679    1.420    2.591    0.010    1.613    0.371
## 
## Covariances:
##   IS ~~
##     LC               -0.450    0.297   -1.514    0.130   -0.438   -0.438
## 
## Intercepts:
##     LC                0.805    0.234    3.447    0.001    1.601    1.601
##     IS                4.319    0.756    5.715    0.000    1.893    1.893
##     region            0.480    0.033   14.757    0.000    0.480    2.087
##     sales1            0.000                               0.000    0.000
##     sales2            0.000                               0.000    0.000
##     sales3            0.000                               0.000    0.000
##     sales4            0.000                               0.000    0.000
## 
## Variances:
##     sales1            1.130    0.561                      1.130    0.178
##     sales2            1.386    0.388                      1.386    0.225
##     sales3            1.708    0.444                      1.708    0.260
##     sales4            1.601    0.644                      1.601    0.227
##     region            0.053    0.011                      0.053    1.000
##     IS                4.487    1.110                      0.862    0.862
##     LC                0.235    0.134                      0.930    0.930
## 
## R-Square:
## 
##     sales1            0.822
##     sales2            0.775
##     sales3            0.740
##     sales4            0.773
##     IS                0.138
##     LC                0.070
```


1. Region ~ 1: 
2. IS ~ 1: 
3. LC ~ 1: 
4. IS ~ Region: 
5. LC ~ Region: 


***


```r
sessionInfo()
```

```
## R version 3.0.2 (2013-09-25)
## Platform: x86_64-w64-mingw32/x64 (64-bit)
## 
## locale:
## [1] LC_COLLATE=English_United States.1252  LC_CTYPE=English_United States.1252   
## [3] LC_MONETARY=English_United States.1252 LC_NUMERIC=C                          
## [5] LC_TIME=English_United States.1252    
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
## [1] foreign_0.8-55 lavaan_0.5-15  knitr_1.5     
## 
## loaded via a namespace (and not attached):
## [1] evaluate_0.5.1 formatR_0.10   MASS_7.3-29    mnormt_1.4-5   pbivnorm_0.5-1 quadprog_1.5-5
## [7] stats4_3.0.2   stringr_0.6.2  tools_3.0.2
```

