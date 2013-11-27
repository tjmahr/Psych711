Questions about Rex Kline's book (for Tues., Oct. 22)
===============================================================================

> Read pages 154-175, 182 (summary), and 222-228 in Kline's book. Be prepared to answer the questions below WITHOUT LOOKING AT YOUR NOTES. 


```r
source("../power.r")
library(lavaan)
d <- read.csv("../data/roth_data.csv", row.names = 1)
d <- as.matrix(d)
```


Chapter 7
-------------------------------------------------------------------------------

### 1. Explain what (full information) maximum likelihood estimation is. Pretend you are explaining it to a SEM novice.

You want to find some equations that describe how the data fit together. To do this, you need to estimate the relationships between the variables. Maximum likelihood generates estimates that maximize the likelihood that these relationships were sampled from the full population. Full-information means that the computer tries to solve the all the equations simultaneously instead of one-by-one. In order to maximize the likelihood, the computer minimizes a corresponding fit function which describes the deviance between the model's predictions and the data. 

ML estimation are generally iterative, meaning that the computer starts with an initial solution and tries to refine its estimates. ML also assumes multivariate normality for the endogenous variables, whatever that means.

ML is both scale free and scale invariant which means that we can linearly transform estimates to different scales and that scale of measurement does not affect the fitting function.


### 2. Kline suggests to us to pay particular attention to the start values. Why is that? 

Accurate start values may help the estimation converge more quickly, and conversely, horribly inaccurate start values may prevent the estimation from converging or converging on an optimal solution. In this case, you should be ready to provide some initial estimates to help the model out.


### 3. What are Heywood cases? 

Parameter estimates with nonsensical values, like a negative variance estimate or estimated correlations with an absolute value greater than 1. Causes include:

* Errors in specification
* Model non-identification
* Outliers that wreck the solution
* Small N plus having just two indicators per factor
* Bad initial estimates
* Extreme population correlations (yielding empirical underidentification)


### 4a. In Figure 7.1(a), the path from "school support" to "teacher-pupil interaction" has a value of .097. Interpret this path.

An additional point of school support is predicted to yield a 0.097 unit increase in positive teacher-pupil interaction, when holding constant the direct effects of coercive control and teacher burnout on interaction. (Although the support variable needs to be un-transformed in order to be properly interpreted).


### 4b. Is it not surprising that this path coefficient becomes bigger, rather than smaller, in the standardized solution (.203)?

No. `SD-Support / SD-Teacher-Pupil = 10.5212 / 5 = 2.1042`. The ratio scales the path coefficient into a larger value: `2.1042 * 0.097 = 0.2041`, which approximates the standardized solution.


### 5. Explain what direct effects, indirect effects, total indirect effects, and total effects are. Pretend you are explaining it to a SEM novice.

Consider a triangle with paths x~y, x~m, m~y. There are two ways to get from x to y. One is the direct path from x to y. This is the direct effect: It describes how a change in x corresponds to a change in y, controlling for the m~y effect. The indirect path from x to y involves the intermediate paths x to m and m to y. The indirect effect describes how a change in x yields a change in m yields a change in y. It's the effect of x on y via m, equal to the product of the two direct effects that make up the path x~m * m~y. The sum of all paths from x to y is the total effect. The total indirect effects is the sum of all the indirect paths.


### 6. Zero correlation residulas

> According to Kline, it is not all surprising that all the correlation residuals involving coercive control, teacher burnout, school support, and teacher-pupil interaction are zero (see Table 7.5). In other words, we could have known that they are zero by simply looking at the path analytic model in Figure 7.1. Why is that?

Because that subset of the model is just-identified. There is a path between every pair of variables. Such models tend to perfectly fit the data.

 
Chapter 8
-------------------------------------------------------------------------------

### 7. If one wants to test a model with 2 df and one wants to have a model power-level of at least .80, how many participants does one need to include in the study?


```r
compute_sample_size(df = 2, rmseaa = 0.01)
```

```
## List of 7
##  $ df        : num 2
##  $ n         : num 2381
##  $ rmsea0    : num 0.05
##  $ rmseaa    : num 0.01
##  $ alpha     : num 0.05
##  $ hypothesis: chr "Not-close-fit hypothesis"
##  $ power     : num 0.8
##  - attr(*, "class")= chr "PowerSummary"
```

```r
compute_sample_size(df = 2, rmseaa = 0.08)
```

```
## List of 7
##  $ df        : num 2
##  $ n         : num 3500
##  $ rmsea0    : num 0.05
##  $ rmseaa    : num 0.08
##  $ alpha     : num 0.05
##  $ hypothesis: chr "Close-fit hypothesis"
##  $ power     : num 0.801
##  - attr(*, "class")= chr "PowerSummary"
```


* 3500 for the close-fit test. 
* 2381.25 for the not-close-fit test.


### 8. Use [Kris Preacher's web page](http://www.quantpsy.org/rmsea/rmsea.htm) and generate the power values that are reported for the Roth et al. model in Table 8.7 of Kline's book (.317 and .229).  

> In other words, what does it mean to have a power of .317 for the close-fit test and a power of .229 for the not-close-fit test?

> The web page will ask you, among other things, for two pieces of information: the "Null RMSEA", which should always be .05, and the "Alt. RMSEA", which should be either .01 (for the not-close fit test) or .08 (for the close-fit test). Interpret the values you get (without looking at your notes).

**Not-close-fit hypothesis:** There is a 23% change of detecting a model with a good fit from N = 373 observations. 


```r
compute_power(df = 5, n = 373, rmseaa = 0.01)
```

```
## List of 7
##  $ df        : num 5
##  $ n         : num 373
##  $ rmsea0    : num 0.05
##  $ rmseaa    : num 0.01
##  $ alpha     : num 0.05
##  $ hypothesis: chr "Not-close-fit hypothesis"
##  $ power     : num 0.229
##  - attr(*, "class")= chr "PowerSummary"
```


**Close-fit hypothesis:** There is a 32% chance of correctly rejecting a bad model from N = 373 observations.


```r
compute_power(df = 5, n = 373, rmseaa = 0.08)
```

```
## List of 7
##  $ df        : num 5
##  $ n         : num 373
##  $ rmsea0    : num 0.05
##  $ rmseaa    : num 0.08
##  $ alpha     : num 0.05
##  $ hypothesis: chr "Close-fit hypothesis"
##  $ power     : num 0.317
##  - attr(*, "class")= chr "PowerSummary"
```


### 9. Using Kris Preacher's web page to determine the power values for a model with 5 df and 60 observations (like our model apgar4)? Interpret these values.


```r
compute_power(df = 5, n = 60, rmseaa = 0.01)
```

```
## List of 7
##  $ df        : num 5
##  $ n         : num 60
##  $ rmsea0    : num 0.05
##  $ rmseaa    : num 0.01
##  $ alpha     : num 0.05
##  $ hypothesis: chr "Not-close-fit hypothesis"
##  $ power     : num 0.0668
##  - attr(*, "class")= chr "PowerSummary"
```

```r
compute_power(df = 5, n = 60, rmseaa = 0.08)
```

```
## List of 7
##  $ df        : num 5
##  $ n         : num 60
##  $ rmsea0    : num 0.05
##  $ rmseaa    : num 0.08
##  $ alpha     : num 0.05
##  $ hypothesis: chr "Close-fit hypothesis"
##  $ power     : num 0.0969
##  - attr(*, "class")= chr "PowerSummary"
```


### 10. Given that it is unrealistic to expect from a researcher to consider all equivalent and near-equivalent models, what does Kline suggest we should do?

Consider the theoretically substantive alternative models.

### 11. Fit Indices

> Using the Roth et al. dataset (see last homework), get as many fit indices as possible for the two models described in the second paragraph on page 228 of Kline's book. Interpret the results and explain why these two models are considered "near-equivalent".


```r
m0 <- '
  illness ~ fitness + stress
  stress ~ hardiness
  fitness ~ exercise'
m1 <- '
  illness ~ fitness + stress
  stress ~ hardiness + fitness
  fitness ~ exercise'
m2 <- '
  illness ~ fitness + stress
  stress ~ hardiness
  fitness ~ exercise + stress'
m0_fit <- sem(m0, sample.cov = d, sample.nobs = 373, likelihood = "wishart")
m1_fit <- sem(m1, sample.cov = d, sample.nobs = 373, likelihood = "wishart")
m2_fit <- sem(m2, sample.cov = d, sample.nobs = 373, likelihood = "wishart")
# Model 0
summary(m0_fit, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after  22 iterations
## 
##   Number of observations                           373
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic               11.078
##   Degrees of freedom                                 5
##   P-value (Chi-square)                           0.050
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic              165.164
##   Degrees of freedom                                 9
##   P-value                                        0.000
## 
## User model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    0.961
##   Tucker-Lewis Index (TLI)                       0.930
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)              -9946.777
##   Loglikelihood unrestricted model (H1)      -9941.223
## 
##   Number of free parameters                          7
##   Akaike (AIC)                               19907.554
##   Bayesian (BIC)                             19934.986
##   Sample-size adjusted Bayesian (BIC)        19912.777
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.057
##   90 Percent Confidence Interval          0.001  0.103
##   P-value RMSEA <= 0.05                          0.337
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
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Regressions:
##   illness ~
##     fitness          -0.424    0.080   -5.316    0.000   -0.424   -0.253
##     stress            0.287    0.044    6.538    0.000    0.287    0.311
##   stress ~
##     hardiness        -0.406    0.089   -4.558    0.000   -0.406   -0.230
##   fitness ~
##     exercise          0.216    0.026    8.169    0.000    0.216    0.390
## 
## Variances:
##     illness        3212.567  235.557                   3212.567    0.840
##     stress         4251.532  311.737                   4251.532    0.947
##     fitness        1148.260   84.195                   1148.260    0.848
## 
## R-Square:
## 
##     illness           0.160
##     stress            0.053
##     fitness           0.152
```

```r
residuals(m0_fit, type = "cor")      
```

```
## $cor
##           illnss stress fitnss hrdnss exercs
## illness    0.000                            
## stress     0.030  0.000                     
## fitness   -0.038 -0.133  0.000              
## hardiness -0.091  0.000  0.082  0.000       
## exercise   0.016 -0.057  0.000  0.000  0.000
## 
## $mean
##   illness    stress   fitness hardiness  exercise 
##         0         0         0         0         0
```

```r
residuals(m0_fit, type = "standardized")          
```

```
## $cov
##           illnss stress fitnss hrdnss exercs
## illness    1.252                            
## stress     2.015     NA                     
## fitness   -2.156 -2.552     NA              
## hardiness -1.906     NA  1.710  0.000       
## exercise   0.331 -1.128     NA  0.000  0.000
## 
## $mean
##   illness    stress   fitness hardiness  exercise 
##         0         0         0         0         0
```

```r
# Model 1
summary(m1_fit, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after  22 iterations
## 
##   Number of observations                           373
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic                5.921
##   Degrees of freedom                                 4
##   P-value (Chi-square)                           0.205
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic              165.164
##   Degrees of freedom                                 9
##   P-value                                        0.000
## 
## User model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    0.988
##   Tucker-Lewis Index (TLI)                       0.972
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)              -9944.192
##   Loglikelihood unrestricted model (H1)      -9941.223
## 
##   Number of free parameters                          8
##   Akaike (AIC)                               19904.384
##   Bayesian (BIC)                             19935.735
##   Sample-size adjusted Bayesian (BIC)        19910.353
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.036
##   90 Percent Confidence Interval          0.000  0.092
##   P-value RMSEA <= 0.05                          0.582
## 
## Standardized Root Mean Square Residual:
## 
##   SRMR                                           0.034
## 
## Parameter estimates:
## 
##   Information                                 Expected
##   Standard Errors                             Standard
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Regressions:
##   illness ~
##     fitness          -0.424    0.080   -5.282    0.000   -0.424   -0.250
##     stress            0.287    0.044    6.483    0.000    0.287    0.307
##   stress ~
##     hardiness        -0.391    0.088   -4.430    0.000   -0.391   -0.222
##     fitness          -0.208    0.091   -2.284    0.022   -0.208   -0.115
##   fitness ~
##     exercise          0.216    0.026    8.169    0.000    0.216    0.390
## 
## Variances:
##     illness        3212.567  235.557                   3212.567    0.826
##     stress         4193.009  307.446                   4193.009    0.938
##     fitness        1148.260   84.195                   1148.260    0.848
## 
## R-Square:
## 
##     illness           0.174
##     stress            0.062
##     fitness           0.152
```

```r
residuals(m1_fit, type = "cor")      
```

```
## $cor
##           illnss stress fitnss hrdnss exercs
## illness    0.000                            
## stress     0.005  0.000                     
## fitness   -0.005 -0.018  0.000              
## hardiness -0.095 -0.009  0.082  0.000       
## exercise   0.029 -0.012  0.000  0.000  0.000
## 
## $mean
##   illness    stress   fitness hardiness  exercise 
##         0         0         0         0         0
```

```r
residuals(m1_fit, type = "standardized")          
```

```
## $cov
##           illnss stress fitnss hrdnss exercs
## illness    0.661                            
## stress     1.001  0.692                     
## fitness   -1.248 -1.604     NA              
## hardiness -1.963 -1.398  1.710  0.000       
## exercise   0.643 -0.260     NA  0.000  0.000
## 
## $mean
##   illness    stress   fitness hardiness  exercise 
##         0         0         0         0         0
```

```r
# Model 2
summary(m2_fit, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after  23 iterations
## 
##   Number of observations                           373
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic                5.668
##   Degrees of freedom                                 4
##   P-value (Chi-square)                           0.225
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic              165.164
##   Degrees of freedom                                 9
##   P-value                                        0.000
## 
## User model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    0.989
##   Tucker-Lewis Index (TLI)                       0.976
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)              -9944.065
##   Loglikelihood unrestricted model (H1)      -9941.223
## 
##   Number of free parameters                          8
##   Akaike (AIC)                               19904.130
##   Bayesian (BIC)                             19935.481
##   Sample-size adjusted Bayesian (BIC)        19910.099
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.033
##   90 Percent Confidence Interval          0.000  0.091
##   P-value RMSEA <= 0.05                          0.606
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
## Regressions:
##   illness ~
##     fitness          -0.424    0.081   -5.272    0.000   -0.424   -0.250
##     stress            0.287    0.044    6.499    0.000    0.287    0.308
##   stress ~
##     hardiness        -0.406    0.089   -4.558    0.000   -0.406   -0.230
##   fitness ~
##     exercise          0.213    0.026    8.111    0.000    0.213    0.385
##     stress           -0.061    0.026   -2.337    0.019   -0.061   -0.111
## 
## Variances:
##     illness        3212.567  235.557                   3212.567    0.826
##     stress         4251.532  311.737                   4251.532    0.947
##     fitness        1131.683   82.979                   1131.683    0.840
## 
## R-Square:
## 
##     illness           0.174
##     stress            0.053
##     fitness           0.160
```

```r
residuals(m2_fit, type = "cor")      
```

```
## $cor
##           illnss stress fitnss hrdnss exercs
## illness    0.000                            
## stress     0.005  0.000                     
## fitness   -0.007 -0.022  0.000              
## hardiness -0.086  0.000  0.056  0.000       
## exercise   0.014 -0.057  0.005  0.000  0.000
## 
## $mean
##   illness    stress   fitness hardiness  exercise 
##         0         0         0         0         0
```

```r
residuals(m2_fit, type = "standardized")   
```

```
## $cov
##           illnss stress fitnss hrdnss exercs
## illness    0.615                            
## stress     0.921     NA                     
## fitness   -0.906 -1.100  0.647              
## hardiness -1.795     NA  1.211  0.000       
## exercise   0.297 -1.128  0.900  0.000  0.000
## 
## $mean
##   illness    stress   fitness hardiness  exercise 
##         0         0         0         0         0
```

```r
# Put all the fit indices together
measures <- lapply(list(m0_fit, m1_fit, m2_fit), 
                   function(x) data.frame(as.list(fitMeasures(x))))
fits <- Reduce(rbind, measures)
row.names(fits) <- c("m0", "m1", "m2")
round(t(fits), 2)
```

```
##                         m0       m1       m2
## fmin                  0.01     0.01     0.01
## chisq                11.08     5.92     5.67
## df                    5.00     4.00     4.00
## pvalue                0.05     0.21     0.23
## baseline.chisq      165.16   165.16   165.16
## baseline.df           9.00     9.00     9.00
## baseline.pvalue       0.00     0.00     0.00
## cfi                   0.96     0.99     0.99
## tli                   0.93     0.97     0.98
## nnfi                  0.93     0.97     0.98
## rfi                   0.88     0.92     0.92
## nfi                   0.93     0.96     0.97
## pnfi                  0.52     0.43     0.43
## ifi                   0.96     0.99     0.99
## rni                   0.96     0.99     0.99
## logl              -9946.78 -9944.19 -9944.06
## unrestricted.logl -9941.22 -9941.22 -9941.22
## npar                  7.00     8.00     8.00
## aic               19907.55 19904.38 19904.13
## bic               19934.99 19935.73 19935.48
## ntotal              373.00   373.00   373.00
## bic2              19912.78 19910.35 19910.10
## rmsea                 0.06     0.04     0.03
## rmsea.ci.lower        0.00     0.00     0.00
## rmsea.ci.upper        0.10     0.09     0.09
## rmsea.pvalue          0.34     0.58     0.61
## rmr                 134.36    75.46    89.24
## rmr_nomean          134.36    75.46    89.24
## srmr                  0.05     0.03     0.03
## srmr_nomean           0.05     0.03     0.03
## cn_05               372.76   597.04   623.68
## cn_01               507.61   835.08   872.36
## gfi                   0.99     0.99     0.99
## agfi                  0.96     0.98     0.98
## pgfi                  0.33     0.26     0.27
## mfi                   0.99     1.00     1.00
## ecvi                  0.07     0.06     0.06
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
## [1] evaluate_0.5.1 formatR_0.10   mnormt_1.4-5   pbivnorm_0.5-1
## [5] quadprog_1.5-5 stats4_3.0.1   stringr_0.6.2  tools_3.0.1
```

