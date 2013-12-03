Questions about Rex Kline's book (for Tues., Dec. 3)
===============================================================================

> Read chapter 12 of Kline's book and be prepared to answer the questions below. Please also do the data analysis exercise described in steps 14, 15, and 16. 


```r
library(lavaan)
# Make a shortcut version of our usual summary function
summary2 <- function(...) {
    summary(..., standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
}
options(width = 100, digits = 3)
```


Reading
-------------------------------------------------------------------------------

### 1. Kline talks about "conditional regression lines"? What are they? How do we know whether the slope of a given "conditional regression line" is statistically significant?

### 2. According to Whisman and McClelland (2005), is better to focus on standardized or unstandardized regression coefficients in moderated multiple regression? Why?

### 3. When we include product terms in a multiple regression analysis, we often face the problem that the product term is very highly correlated with at least one of the two variables that constitute it. What can be done about this problem of collinearity?

### 4. According to Kenny, interactive effects can easily be confounded with curvilinear effects. Why is that?

### 5. Explain to a novice what "mediated moderation" is (without looking at your notes).  

### 6. Briefly describe the "indicant product approach" of SEM (the Kenny-Judd method) using the example of an interaction between two exogenous latent factors (A and B) that each has two indicators.

### 7. What are two major problems of the "indicant product approach" (the Kenny-Judd method)?

### 8. Andreas Klein and his colleagues recently suggested new approaches to estimate interaction effects in SEM. What are these approaches called and what is their advantage over the "indicant product approach" (the Kenny-Judd method)?

### 9. Explain to a novice what a "design effect" is (without looking at your notes).

### 10. What does Kline mean when he talks about "cross-level interactions"?

### 11. What is a "slopes-and-intercepts-as-outcomes model"?

### 12. Which hypothesis exactly is being tested in the slopes-and intercepts-as-outcomes model" shown in Figure 12.8?

### 13. Kline talks about three basic steps in analyzing a multilevel structural equation model. Describe these three steps.

Israel Data Analysis
-------------------------------------------------------------------------------

### 14. Run analyses on the Israel dataset. 

> First, run a one-factor confirmatory factor analysis with the variables v7, v8, v9, v11, v12, v13, v16, v17, v18, v19, v20, and v21. Determine whether this model has a satisfactory fit.


```r
# Load data and fit model
d <- as.matrix(read.csv("../data/data_israel.csv", row.names = 1))
m1 <- "F =~ V7 + V8 + V9 + V11 + V12 + V13 + V16 + V17 + V18 + V19 + V20 + V21"
fit1 <- cfa(m1, likelihood = "wishart", sample.cov = d, sample.nobs = 450)
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

```r
residuals(fit1, type = "cor")$cor
```

```
##     V7     V8     V9     V11    V12    V13    V16    V17    V18    V19    V20    V21   
## V7   0.000                                                                             
## V8   0.168  0.000                                                                      
## V9   0.133  0.315  0.000                                                               
## V11 -0.096 -0.114 -0.082  0.000                                                        
## V12 -0.090 -0.086 -0.063  0.302  0.000                                                 
## V13 -0.068 -0.109 -0.100  0.200  0.258  0.000                                          
## V16 -0.073 -0.085 -0.069 -0.049 -0.057 -0.053  0.000                                   
## V17  0.083  0.115  0.075  0.048  0.014  0.040 -0.349  0.000                            
## V18 -0.107 -0.146 -0.098  0.000  0.006  0.050  0.319 -0.282  0.000                     
## V19 -0.055  0.010  0.049  0.050  0.085  0.041  0.097 -0.105  0.121  0.000              
## V20 -0.059  0.034  0.106  0.046  0.103  0.068  0.078 -0.079  0.090  0.575  0.000       
## V21 -0.017  0.056  0.109  0.035  0.096  0.027  0.075 -0.065  0.095  0.551  0.644  0.000
```

```r
residuals(fit1, type = "standardized")$cov
```

```
##     V7     V8     V9     V11    V12    V13    V16    V17    V18    V19    V20    V21   
## V7      NA                                                                             
## V8   5.656     NA                                                                      
## V9   4.819  8.813     NA                                                               
## V11 -4.069 -5.529 -4.072     NA                                                        
## V12 -4.398 -4.765 -3.512  8.143     NA                                                 
## V13 -2.812 -5.326 -5.141  5.775  7.304     NA                                          
## V16 -3.122 -4.133 -3.445 -1.837 -2.435 -2.022     NA                                   
## V17  3.399  5.550  3.624  1.734  0.558  1.433 -8.754     NA                            
## V18 -4.425 -7.185 -4.789  0.007  0.214  1.640  8.215 -7.431     NA                     
## V19 -1.737  0.366  1.924  1.554  3.018  1.276  3.182 -3.339  3.793     NA              
## V20 -1.846  1.200  4.134  1.402  3.524  2.093  2.434 -2.386  2.713 11.261     NA       
## V21 -0.547  1.994  4.125  1.047  3.207  0.810  2.316 -1.933  2.807 10.926 11.990     NA
```


The model has a very unsatisfactory fit.

The RMSEA equals 0.25 (CI: 0.242, 0.263)


### 15. Run a confirmatory factor analysis with four factors

> "Friends" (v7, v8, v9), "Attitude" (v11, v12, v13), "Relaxed" (v16, v17, v18), and "Religion" (v19, v20, v21). Determine whether this model has a satisfactory fit.


```r
m2 <- "
  Friends =~ V7 + V8 + V9 
  Attitude =~ V11 + V12 + V13
  Relaxed =~ V16 + V17 + V18 
  Religion =~ V19 + V20 + V21"
fit2 <- cfa(m2, likelihood = "wishart", sample.cov = d, sample.nobs = 450)
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
residuals(fit2, type = "cor")$cor
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



The RMSEA equals 0.04 (CI: 0.025, 0.054).

The SRMR is 0.04.

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
residuals(fit3, type = "cor")$cor
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


The RMSEA equals 0.04 (CI: 0.025, 0.054)

The SRMR is 0.08.


### 17. Transform the covariance matrix into a correlation matrix and examine the correlations. 

> Are the variables supposed to measure the same latent construct highly (and positively) correlated with each other? Are there out-of-bounds correlations? If you think there is a problem with these correlations, say what the problem is? If not, what did you look at before concluding that these correlations are OK?


```r
d_cor <- cov2cor(d)
v_friends <- c("V7", "V8", "V9")
v_attitude <- c("V11", "V12", "V13")
v_relaxed <- c("V16", "V17", "V18")
v_religion <- c("V19", "V20", "V21")
v_all <- c(v_friends, v_attitude, v_relaxed, v_religion)

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

```r

```



Multigroup CFA
-------------------------------------------------------------------------------

### 18. Go through the R script "multigroup CFA and test of difference of factor means" I sent you last Tuesday. Redo all the analyses on your computer. In addition, obtain a large number of fit indices (and the correlation residuals) for the final model (the one with the over-identified mean structure = "m6"). Is this model satisfactory? Which parameters tell us whether there is a gender difference on each of the two factors? Are these parameters statistically significant? What conclusions can you draw from all the analyses performed on this dataset?

### 19. What about the MIMIC model that is in the same R script (= "m7")? Does this model come to the same conclusions as the model discussed in the previous point? Please remind me what assumption is being made in this model. Do you think this is a reasonable assumption? Why?

### 20. Go through the R script "latent growth curve model - sales dataset" I sent you last Tuesday. Redo all the analyses on your computer. In the first analysis (the one without region), interpret each of the two paths from "one" to the two latent variables? What do these parameter estimates tell us? Are they significant? In the second analysis (the one with region), interpret the following five paths: the paths from "one" to "region" and to the two latent variables and the paths from "region" to the two latent variables? What do these parameter estimates tell us? Are they significant?




***


```r
sessionInfo()
```

```
## R version 3.0.1 (2013-05-16)
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
## [1] lavaan_0.5-15 knitr_1.5    
## 
## loaded via a namespace (and not attached):
## [1] evaluate_0.5.1 formatR_0.10   MASS_7.3-26    mnormt_1.4-5   pbivnorm_0.5-1 quadprog_1.5-5
## [7] stats4_3.0.1   stringr_0.6.2  tools_3.0.1
```

