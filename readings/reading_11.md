


Questions about Rex Kline's book (for Tues., Nov. 26)
===============================================================================

> Read chapter 11 of Kline's book be prepared to answer the questions below. Please also do the data analysis exercise described at the end.

#### 1. Assuming you include a mean structure, how do you determine the model-implied (predicted) mean for a given variable?

The model-implied mean of X is the total effect of the constant variable ("1") on X. For an endogenous variable, this is the direct effect ("the intercept") plus the indirect effects (e.g., the mean of the exogenous variable Y ~ 1 times the path coefficient X ~ Y.)



#### 2. What is the mean of a variable assumed to be if it is excluded from the mean structure?

Zero.



#### 3. "A heavily over-identified covariance structure can compensate for a mildly under-identified mean structure, and vice versa." True or false?

False. "The identification status of a mean structure must be considered separately from that of the covariance structure" (p. 303).



#### 4. What are the implications of adding a just-identified mean structure for model fit? 

> In other words: If you add a just-identified mean structure, does this usually lead to A) better, B) worse, or C) equal model fit compared to the same model without mean structure?

The just-identified mean structure will precisely estimate the means of the observed variables. The covariance structure will not be affected by the added mean structure, so the model will have C) equal model fit compared to the same model without the mean structure. 



#### 5. Compare the advantages and disadvantages of HLM and SEM for the estimation of latent growth models.

+ SEM growth models require **time-structured data**. This means that the subjects are measured with uniform inter-measurement intervals. HLM does not require time-structured data.
+ HLM handles missing data and unbalanced data more flexibly than SEM.
+ SEM provides indices for evaluating whole-model fit.
+ SEM can handle multiple growth curves (multiple outcomes) simultaneously in a single model.
+ SEM can model factors as outcome variables.



#### 6. When we specify a latent growth model in SEM, do we usually allow the "Initial Status" factor and the "Linear Change" factor to covary? If not, why not? If yes, what is the meaning of this covariance?  

Yes. The covariance describes how much the Initial Status predicts later rates of Linear Change. It makes sense that the baseline level would be correlated with later changes away from that baseline level.



#### 7. Compare latent growth analysis in SEM with more traditional data analysis techniques, such as "repeated measures analysis of variance" (within-subject ANOVA), "multivariate analysis of variance" (MANOVA). What assumptions do these different techniques make for the measurement errors? How do they treat individual differences in growth trajectories?

SEM provides a mechanism for modeling measurement error, and we can allow measurement errors to covary with each other. ANOVA assumes that error variance is constant and independent (tough assumptions for repeated measures within subjects). MANOVA requires less strict assumptions. "Both ANOVA and MANOVA treat individual differences in growth trajectories as error variance" (p. 307) whereas latent growth models can model such differences.



#### 8. What would we do, if we wanted to estimate a curvilinear trend in addition to the linear trend specified in Figure 11.2? What would be the df of the model that includes also a curvilinear trend?

With 4 observations, P = (4 * 7) / 2 = 14.

Figure 11.2 has:

```
2 factor variances
4 measurement error variances
1 factor covariance
3 error covariances
2 factor means
Q = 12 
df = 14 - 12 = 2
```

Adding the quadratic change factor would also add:

```
1 factor mean
1 factor variance
2 factor covariances
Q = 12 + 4 = 16
df = 14 - 16 = -2
```

#### 9. Consider the "intell" data we analyzed several weeks ago. Be prepared to draw on the blackboard a multi-group measurement model that allows us to test for configural invariance.

> As a reminder, we tested a CFA model with two factors and three indicators per factor. The factor "spatial" was assumed to influence the indicators "visperc", cubes", and "lozenges", and the factor "verbal" was assumed to influence the indicators "paragraph", "sentence", and "wordmean". There were two samples, women ("Grnt_fem.sav") and men ("Grnt_mal.sav"). We already did that. Just redraw the model we drew several weeks ago. What are the # of observations, # of estimated parameters, and df of this model? Is this model at least just-identified?


```r
d_intell_fem <- read.spss("../data/Grnt_fem.sav", to.data.frame = TRUE)
d_intell_mal <- read.spss("../data/Grnt_mal.sav", to.data.frame = TRUE)
d_intell_fem$gender <- "female"
d_intell_mal$gender <- "male"
d <- rbind(d_intell_fem, d_intell_mal)
# Configural invariance model
m_form <- '
  spatial =~ visperc + cubes + lozenges 
  verbal =~ paragrap + sentence + wordmean'
h_form <- cfa(m_form, data = d, likelihood = "wishart", group = "gender", 
              meanstructure = FALSE)
summary(h_form, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after 122 iterations
## 
##   Number of observations per group         
##   female                                            73
##   male                                              72
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic               16.480
##   Degrees of freedom                                16
##   P-value (Chi-square)                           0.420
## 
## Chi-square for each group:
## 
##   female                                         7.853
##   male                                           8.627
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic              337.557
##   Degrees of freedom                                30
##   P-value                                        0.000
## 
## User model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    0.998
##   Tucker-Lewis Index (TLI)                       0.997
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)              -2570.027
##   Loglikelihood unrestricted model (H1)      -2561.672
## 
##   Number of free parameters                         26
##   Akaike (AIC)                                5192.053
##   Bayesian (BIC)                              5269.087
##   Sample-size adjusted Bayesian (BIC)         5186.819
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.020
##   90 Percent Confidence Interval          0.000  0.112
##   P-value RMSEA <= 0.05                          0.603
## 
## Standardized Root Mean Square Residual:
## 
##   SRMR                                           0.045
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
##     visperc           1.000                               4.861    0.703
##     cubes             0.610    0.143    4.249    0.000    2.964    0.654
##     lozenges          1.198    0.272    4.405    0.000    5.824    0.736
##   verbal =~
##     paragrap          1.000                               3.133    0.880
##     sentence          1.334    0.160    8.321    0.000    4.180    0.827
##     wordmean          2.234    0.263    8.482    0.000    7.000    0.841
## 
## Covariances:
##   spatial ~~
##     verbal            7.417    2.607    2.845    0.004    0.487    0.487
## 
## Variances:
##     visperc          24.204    6.070                     24.204    0.506
##     cubes            11.763    2.620                     11.763    0.572
##     lozenges         28.668    8.002                     28.668    0.458
##     paragrap          2.873    0.881                      2.873    0.226
##     sentence          8.077    1.895                      8.077    0.316
##     wordmean         20.202    5.020                     20.202    0.292
##     spatial          23.626    8.237                      1.000    1.000
##     verbal            9.817    2.189                      1.000    1.000
## 
## 
## 
## Group 2 [male]:
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Latent variables:
##   spatial =~
##     visperc           1.000                               4.035    0.581
##     cubes             0.450    0.176    2.556    0.011    1.817    0.415
##     lozenges          1.510    0.461    3.273    0.001    6.095    0.708
##   verbal =~
##     paragrap          1.000                               2.646    0.863
##     sentence          1.275    0.171    7.463    0.000    3.375    0.806
##     wordmean          2.294    0.308    7.451    0.000    6.070    0.805
## 
## Covariances:
##   spatial ~~
##     verbal            6.937    2.404    2.886    0.004    0.650    0.650
## 
## Variances:
##     visperc          32.016    7.080                     32.016    0.663
##     cubes            15.914    2.945                     15.914    0.828
##     lozenges         37.041   11.694                     37.041    0.499
##     paragrap          2.397    0.737                      2.397    0.255
##     sentence          6.120    1.453                      6.120    0.350
##     wordmean         19.974    4.724                     19.974    0.352
##     spatial          16.284    7.622                      1.000    1.000
##     verbal            7.001    1.645                      1.000    1.000
## 
## R-Square Group female:
## 
##     visperc           0.494
##     cubes             0.428
##     lozenges          0.542
##     paragrap          0.774
##     sentence          0.684
##     wordmean          0.708
## 
## R-Square Group male:
## 
##     visperc           0.337
##     cubes             0.172
##     lozenges          0.501
##     paragrap          0.745
##     sentence          0.650
##     wordmean          0.648
```

```r
# semPaths(h_form, layout = "tree", whatLabels = "est")
```


```
P = (6 * 7) / 2 * 2 samples = 42
2 factor variances
1 factor covariance
4 factor loadings
6 measurement errors
Q = 13 * 2 samples = 26
df = 42 - 26 - 16
```

The model is over-identified.



#### 10. Modify this model to test for "construct-level metric invariance". 

> If you don't remember what this is, reread chapter 9 of Kline's book. You will have to constrain certain parameters to be the same across groups. Do so by assigning to them the same lower-case letter in both samples. What are the # of observations, # of estimated parameters, and df of this model? Is this model at least just-identified?

Construct-level metric invariance specifies equal factor loadings across both groups. We have to estimate four fewer parameters because the same factor loadings will be used for each sample. Therefore, P = 42, Q = 26 - 4 = 22, df = 16 + 4 = 20. The model is overidentified.


```r
m_lambda <- '
  spatial =~ visperc + c(a, a)*cubes + c(b, b)*lozenges 
  verbal =~ paragrap + c(c, c)*sentence + c(d, d)*wordmean'
h_lambda <- cfa(m_lambda, data = d, likelihood = "wishart", group = "gender", 
              meanstructure = FALSE)
summary(h_lambda, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after 113 iterations
## 
##   Number of observations per group         
##   female                                            73
##   male                                              72
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic               18.291
##   Degrees of freedom                                20
##   P-value (Chi-square)                           0.568
## 
## Chi-square for each group:
## 
##   female                                         8.554
##   male                                           9.737
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
##   Tucker-Lewis Index (TLI)                       1.008
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)              -2570.945
##   Loglikelihood unrestricted model (H1)      -2561.672
## 
##   Number of free parameters                         22
##   Akaike (AIC)                                5185.891
##   Bayesian (BIC)                              5251.073
##   Sample-size adjusted Bayesian (BIC)         5181.462
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.000
##   90 Percent Confidence Interval          0.000  0.092
##   P-value RMSEA <= 0.05                          0.749
## 
## Standardized Root Mean Square Residual:
## 
##   SRMR                                           0.053
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
##     visperc           1.000                               4.723    0.684
##     cubes     (a)     0.557    0.114    4.890    0.000    2.631    0.596
##     lozenges  (b)     1.327    0.248    5.349    0.000    6.266    0.778
##   verbal =~
##     paragrap          1.000                               3.140    0.880
##     sentence  (c)     1.305    0.117   11.157    0.000    4.098    0.819
##     wordmean  (d)     2.260    0.200   11.296    0.000    7.097    0.847
## 
## Covariances:
##   spatial ~~
##     verbal            7.325    2.492    2.939    0.003    0.494    0.494
## 
## Variances:
##     visperc          25.430    5.913                     25.430    0.533
##     cubes            12.554    2.516                     12.554    0.645
##     lozenges         25.595    8.152                     25.595    0.395
##     paragrap          2.874    0.845                      2.874    0.226
##     sentence          8.228    1.841                      8.228    0.329
##     wordmean         19.821    4.905                     19.821    0.282
##     spatial          22.307    7.176                      1.000    1.000
##     verbal            9.859    2.053                      1.000    1.000
## 
## 
## 
## Group 2 [male]:
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Latent variables:
##   spatial =~
##     visperc           1.000                               4.051    0.582
##     cubes     (a)     0.557    0.114    4.890    0.000    2.257    0.498
##     lozenges  (b)     1.327    0.248    5.349    0.000    5.375    0.640
##   verbal =~
##     paragrap          1.000                               2.639    0.863
##     sentence  (c)     1.305    0.117   11.157    0.000    3.444    0.814
##     wordmean  (d)     2.260    0.200   11.296    0.000    5.965    0.799
## 
## Covariances:
##   spatial ~~
##     verbal            7.095    2.119    3.348    0.001    0.664    0.664
## 
## Variances:
##     visperc          32.007    6.775                     32.007    0.661
##     cubes            15.460    2.975                     15.460    0.752
##     lozenges         41.551    9.825                     41.551    0.590
##     paragrap          2.396    0.690                      2.396    0.256
##     sentence          6.038    1.418                      6.038    0.337
##     wordmean         20.218    4.533                     20.218    0.362
##     spatial          16.411    5.968                      1.000    1.000
##     verbal            6.966    1.486                      1.000    1.000
## 
## R-Square Group female:
## 
##     visperc           0.467
##     cubes             0.355
##     lozenges          0.605
##     paragrap          0.774
##     sentence          0.671
##     wordmean          0.718
## 
## R-Square Group male:
## 
##     visperc           0.339
##     cubes             0.248
##     lozenges          0.410
##     paragrap          0.744
##     sentence          0.663
##     wordmean          0.638
```


The chi-square difference test indicates that the fit is not significantly worse, so H-lambda is retained.


```r
anova(h_form, h_lambda)
```

```
## Chi Square Difference Test
## 
##          Df  AIC  BIC Chisq Chisq diff Df diff Pr(>Chisq)
## h_form   16 5192 5269  16.5                              
## h_lambda 20 5186 5251  18.3       1.81       4       0.77
```



#### 11. Add a mean structure to the previous model. In each sample, specify a path from the constant to each of the six indicators and to each of the two factors. 


```r
# Write out the model syntax long-hand
m_lambda_1s <- '
  spatial =~ visperc + c(a, a)*cubes + c(b, b)*lozenges 
  verbal =~ paragrap + c(c, c)*sentence + c(d, d)*wordmean
  paragrap + sentence + wordmean + visperc + cubes + lozenges ~ 1
  spatial + verbal ~ 1'
# I think the under-indentified mean structure upsets lavaan
h_lambda_1s <- cfa(m_lambda_1s, data = d, likelihood = "wishart", group = "gender")
```

```
## Warning: lavaan WARNING: could not compute standard errors!
```

```r
summary(h_lambda_1s, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-15) converged normally after 113 iterations
## 
##   Number of observations per group         
##   female                                            73
##   male                                              72
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic               18.291
##   Degrees of freedom                                16
##   P-value (Chi-square)                           0.307
## 
## Chi-square for each group:
## 
##   female                                         8.554
##   male                                           9.737
## 
## Model test baseline model:
## 
##   Minimum Function Test Statistic              337.557
##   Degrees of freedom                                30
##   P-value                                        0.000
## 
## User model versus baseline model:
## 
##   Comparative Fit Index (CFI)                    0.993
##   Tucker-Lewis Index (TLI)                       0.986
## 
## Loglikelihood and Information Criteria:
## 
##   Loglikelihood user model (H0)              -2570.945
##   Loglikelihood unrestricted model (H1)      -2561.672
## 
##   Number of free parameters                         38
##   Akaike (AIC)                                5217.891
##   Bayesian (BIC)                              5330.479
##   Sample-size adjusted Bayesian (BIC)         5210.240
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.045
##   90 Percent Confidence Interval          0.000  0.122
##   P-value RMSEA <= 0.05                          0.489
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
## Group 1 [female]:
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Latent variables:
##   spatial =~
##     visperc           1.000                               4.723    0.684
##     cubes     (a)     0.557                               2.631    0.596
##     lozenges  (b)     1.327                               6.266    0.778
##   verbal =~
##     paragrap          1.000                               3.140    0.880
##     sentence  (c)     1.305                               4.098    0.819
##     wordmean  (d)     2.260                               7.097    0.847
## 
## Covariances:
##   spatial ~~
##     verbal            7.325                               0.494    0.494
## 
## Intercepts:
##     paragrap         10.589                              10.589    2.968
##     sentence         19.301                              19.301    3.859
##     wordmean         18.014                              18.014    2.150
##     visperc          29.315                              29.315    4.243
##     cubes            24.699                              24.699    5.597
##     lozenges         14.836                              14.836    1.842
##     spatial           0.000                               0.000    0.000
##     verbal            0.000                               0.000    0.000
## 
## Variances:
##     visperc          25.430                              25.430    0.533
##     cubes            12.554                              12.554    0.645
##     lozenges         25.595                              25.595    0.395
##     paragrap          2.874                               2.874    0.226
##     sentence          8.228                               8.228    0.329
##     wordmean         19.821                              19.821    0.282
##     spatial          22.307                               1.000    1.000
##     verbal            9.859                               1.000    1.000
## 
## 
## 
## Group 2 [male]:
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Latent variables:
##   spatial =~
##     visperc           1.000                               4.051    0.582
##     cubes     (a)     0.557                               2.257    0.498
##     lozenges  (b)     1.327                               5.375    0.640
##   verbal =~
##     paragrap          1.000                               2.639    0.863
##     sentence  (c)     1.305                               3.444    0.814
##     wordmean  (d)     2.260                               5.965    0.799
## 
## Covariances:
##   spatial ~~
##     verbal            7.095                               0.664    0.664
## 
## Intercepts:
##     paragrap          9.306                               9.306    3.041
##     sentence         18.389                              18.389    4.346
##     wordmean         16.542                              16.542    2.214
##     visperc          29.847                              29.847    4.289
##     cubes            24.903                              24.903    5.493
##     lozenges         17.111                              17.111    2.039
##     spatial           0.000                               0.000    0.000
##     verbal            0.000                               0.000    0.000
## 
## Variances:
##     visperc          32.007                              32.007    0.661
##     cubes            15.460                              15.460    0.752
##     lozenges         41.551                              41.551    0.590
##     paragrap          2.396                               2.396    0.256
##     sentence          6.038                               6.038    0.337
##     wordmean         20.218                              20.218    0.362
##     spatial          16.411                               1.000    1.000
##     verbal            6.966                               1.000    1.000
## 
## R-Square Group female:
## 
##     visperc           0.467
##     cubes             0.355
##     lozenges          0.605
##     paragrap          0.774
##     sentence          0.671
##     wordmean          0.718
## 
## R-Square Group male:
## 
##     visperc           0.339
##     cubes             0.248
##     lozenges          0.410
##     paragrap          0.744
##     sentence          0.663
##     wordmean          0.638
```


> What are the # of observations, # of estimated parameters, and df of the covariance structure? Is the covariance structure at least just-identified? 

The covariance structure is unaffected. P = 42, Q = 22, df = 20. It is over-identified.

> What are the # of observations, # of estimated parameters, and df of the mean structure? Is the mean structure at least just-identified? 

```
P = 6 means * 2 samples = 12
Q = (6 indicators means + 2 factor means) * 2 samples = 16
df = -4
```

The mean structure is under-identified.

> What are the # of observations, # of estimated parameters, and df of the total model? Is the total model at least just-identified?

```
P = 54
Q = 22 covariance parameters + 16 mean parameters = 38
df = 16
```

The total model is over-indentified.



#### 12. Modify the model so that we can test whether there are gender differences on the two factors. You'll find detailed instructions on the bottom half of page 317 and on the bottom half of page 318 in Kline's book. Make sure both the covariance structure and the mean structure are at least just-identified. Once you are done, determine the df for the entire model.  












#### 13. Respecify the model as a MIMIC model in which the two factors are regressed on a dichotomous cause indicator "gender".  What are the # of observations, # of estimated parameters, and df of this model? Is this model at least just-identified?



#### 14. A MIMIC model to test for factor differences across groups makes a certain assumption, and yet does not allow us to test for this assumption. What is this assumption?



#### 15. The manager of Abercrombie & Fitch would like to test whether sales increased over a 4-year period. She looks at the yearly sales in 51 stores in two regions (West and East). The covariance matrix and the means are below. Be prepared to draw the model and to show your computations for the df. Using lavaan, run a latent growth model according to the example in Figure 11.2 (but without correlations between the measurement errors). What conclusions can the manager draw: Is there a linear increase in sales?



```r
covmatrix <- matrix(c(6.5025, 4.79349, 4.652985, 4.37376, 0.19941, 4.79349, 
    5.8081, 4.521401, 4.391984, 0.22172, 4.652985, 4.521401, 6.6049, 5.1657, 
    0.242351, 4.37376, 4.391984, 5.1657, 7.1824, 0.295872, 0.19941, 0.22172, 
    0.242351, 0.295872, 0.0529), nrow = 5, dimnames = list(c("sales1", "sales2", 
    "sales3", "sales4", "region"), c("sales1", "sales2", "sales3", "sales4", 
    "region")))

myDataMeans <- c(6.08, 7.22, 8.14, 9.38, 0.48)
names(myDataMeans) <- c("sales1", "sales2", "sales3", "sales4", "region")
```



 



#### 16. The manager also wants to know if there are differences between the two regions. Were sales higher in one region than in the other at year 1? And did the sales in one region increase faster than in the other region? Using lavaan, run a latent growth model according to the example in Figure 11.3 (replace "gender" by "region" and drop "family status" from the model). Be prepared to draw the model and to show your computations for the df. What conclusions can the manager draw?



















***

Questions 15 and 16 are tricky.

I think that for question 15, you have to specify a covariance matrix that contains only the four variables used in this analysis. You can do this as follows:


```r
subset <- c("sales1", "sales2", "sales3", "sales4")
covmatrix_s <- covmatrix[subset, subset]
```





Further, you have to tell lavaan what the means are. I used the following script:

```r
fit1 <- sem(m1, likelihood = "wishart", sample.cov = covmatrix_s, sample.nobs = 51, 
    sample.mean = c(6.08, 7.22, 8.14, 9.38))
```

```
## Error: object 'm1' not found
```



... but I am sure there are more elegant ways to do this.

Finally, don't forget to specify that the path from the "one" to the observed variables should be zero. One way to do this is to include the following lines in the model statement:
    sales1 ~ 0
    sales2 ~ 0
    sales3 ~ 0
    sales4 ~ 0


In question 16, you then have to use the full (5 x 5) covariance matrix and to read in five (rather than four) means.

Enjoy!
 
