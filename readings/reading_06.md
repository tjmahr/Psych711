Questions about Rex Kline's book (for Tue., Oct. 15)
===============================================================================
 
 Mina: Communication, how new media mediate interpersonal relationships.
 Kara: Accounting
 
> Read pages 189-222 in Kline's book (until "...other predictive fit indices"), and pages pp. 715-720 in Tabachnik and Fidell's book (chapter 14.5.3). Be prepared to answer the questions below. Please also to the data analysis exercise described the end. 
 
#### 1. According to Rex Kline, it is not very impressive to come up with a model that fits the data. Why?

It is trivial to make a fitting model. Just add more parameters. We can also prune paths with non-significant paths.


#### 2. Is Rex Kline suggesting to adopt more strict standards or more lax standards than have been applied in the past? Explain his position.

Stricter than ever before. It's too easily to rely on the many fit indices. We should provide more information about the model to the readers. We should be our model's toughest critics.


#### 3. "A model with a good fit generally has good predictive power (explains a lot of variances in the endogenous variables)." True or false?

False.


#### 4. What can we conclude when our chi square is non-significant? When it is significant?

We can keep the model if it is non-significant; (maybe) reject exact-fit hypothesis if it is significant. 


#### 5. Be prepared to say what factors affect the value of chi square (tend to make it more or less significant). Say whether the factor artificially increases or decreases chi-square.

1. Multivariate non-normality. Increase or decrease.
2. Correlation sizes. Large correlations inflate discrepancies.
3. Unique variance: Decrease.
4. Sample size: Increase.


#### 6. Given that we adopt a "accept-support logic" when examining the model chi square, do we have greater or smaller chances to find support for our model when we have low statistical power?

We have a greater chance of accepting our model.


#### 7. Give two or three reasons why Kline suggests that we should interpret approximate fit indices with utmost caution.

They don't measure sampling error. The threshold rules-of-thumb come from computer simulations that made specific assumptions about the models. A model may have good overall fit but poorly explain some relationships in the model. There is poor correlation between these different fit indices.


#### 8. What is the baseline model considered as the standard of reference in most comparative fit indices?

The independence model (the null-model) with no covariances between the parameters.


#### 9. Name the main reasons why Kline considers Roth et al.'s model to have an inadequate fit.

* Chi-square(5) = 11.078, p = < 0.49. Exact fit hypothesis is rejected.
* Poor fit hypothesis cannot be rejected; the RMSEA confidence interval is too large.
* Points on the residuals-quantile plot do not fall neatly along the diagonal.
* One of the residual correlations has an absolute value > 0.1. The model underpredicts an association between two variables (fitness and stres).
* Some of the standardized residual correlations are significant.


#### 10. What is a "Lagrange Multiplier" and why will you be struck by lightning if you mention the term in your instructor's presence?

A Lagrange Multiplier, in the context of SEM, estimates how much the overall chi-square statistic would change if a particular path were estimated. Relying on LMs to respecify a model capitalizes on chance. Our model respecifications should be theoretically driven first, not empirically driven.


#### 11. Two formulas to compute the AIC are being used in the SEM literature. Report these two formulas and say which is used by lavaan?

Chi-square + 2q

Chi-square - 2dfM


AIC <- -2 * logl.H0 + 2 * npar


#### 12. Why does Kline conclude that the "conventional medical model" (Figure 8.3.b) fits the data better than the "psychosomatic model" (Figure 8.3.a)?

It has the lowest AIC value and passes the chi-square test.


#### 13. Compare Tabachnik and Fidell's formula of the CFI (p. 717) with that of Kline (p. 208). Are these formulas identical? 

Yes.


#### 14. Compare Tabachnik and Fidell's formula of the RMSEA (p. 717) with that of Kline (p. 205). Are these formulas identical? 

No.


#### 15. Attached you will find a covariance matrix ("roth_data.csv") summarizing the Roth data that are based 373 observations (see Figure 8.1). Run this model with lavaan verify if you find the values reported in Tables 8.1. and 8.2.


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
d <- read.csv("../data/roth_data.csv")
# Change first column to row names
row.names(d) <- d$X
d <- as.matrix(d[-1])

m <- "\n  # regressions\n  illness ~  fitness + stress\n  stress ~ hardiness\n  fitness ~ exercise\n"
m_fit <- sem(m, sample.cov = d, sample.nobs = 373, likelihood = "wishart")

summary(m_fit, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```

```
## lavaan (0.5-14) converged normally after  22 iterations
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
## Full model versus baseline model:
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
##   Bayesian (BIC)                             19935.005
##   Sample-size adjusted Bayesian (BIC)        19912.796
## 
## Root Mean Square Error of Approximation:
## 
##   RMSEA                                          0.057
##   90 Percent Confidence Interval          0.001  0.103
##   P-value RMSEA <= 0.05                          0.338
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
residuals(m_fit, type = "cor")
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
residuals(m_fit, type = "standardized")
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
fitMeasures(m_fit, "gfi")
```

```
##   gfi 
## 0.988
```


