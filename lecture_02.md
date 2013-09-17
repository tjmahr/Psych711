Lecture 02/03/04 -- Sept 05/10/12 2013
===============================================================================

Model the data


```r
library(lmSupport)
library(ggplot2)
library(lavaan)
d <- lm.readDat("data/data_apgar.dat")
describe(d)
```

```
##         var  n  mean    sd median trimmed   mad min max range  skew
## apgar     1 60  6.68  2.10    7.0    6.77  2.22   1  10     9 -0.39
## gestat    2 60 37.12  5.39   38.0   38.33  2.97  20  42    22 -2.10
## smokes    3 60  0.27  0.45    0.0    0.21  0.00   0   1     1  1.03
## prenat    4 60  1.97  0.99    2.0    2.08  1.48   0   3     3 -0.55
## anninc    5 60 55.78 40.58   41.5   49.79 30.39  10 180   170  1.26
## wgtgain   6 60 27.08 12.59   25.0   25.38  9.64   8  75    67  1.51
## gender    7 60  0.50  0.50    0.5    0.50  0.74   0   1     1  0.00
##         kurtosis   se
## apgar      -0.37 0.27
## gestat      3.81 0.70
## smokes     -0.96 0.06
## prenat     -0.83 0.13
## anninc      0.97 5.24
## wgtgain     2.87 1.63
## gender     -2.03 0.07
```

```r
# Predict APGAR from weight gain
m1 <- lm(apgar ~ wgtgain, d)
summary(m1)
```

```
## 
## Call:
## lm(formula = apgar ~ wgtgain, data = d)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -6.440 -1.121  0.069  1.379  3.446 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)   7.8834     0.6307    12.5   <2e-16 ***
## wgtgain      -0.0443     0.0211    -2.1    0.041 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 2.05 on 58 degrees of freedom
## Multiple R-squared:  0.0704,	Adjusted R-squared:  0.0543 
## F-statistic: 4.39 on 1 and 58 DF,  p-value: 0.0405
```

```r
qplot(data = d, x = wgtgain, y = apgar)
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1.png) 


Standardize the weight gain and APGAR scores, so they are both expressed in standard deviation units. Observe that standardization did not change the _p_-values.


```r
d <- transform(d, zwgtgain = scale(wgtgain), zapgar = scale(apgar), zsmokes = scale(smokes))
describe(d)
```

```
##          var  n  mean    sd median trimmed   mad   min    max  range  skew
## apgar      1 60  6.68  2.10   7.00    6.77  2.22  1.00  10.00   9.00 -0.39
## gestat     2 60 37.12  5.39  38.00   38.33  2.97 20.00  42.00  22.00 -2.10
## smokes     3 60  0.27  0.45   0.00    0.21  0.00  0.00   1.00   1.00  1.03
## prenat     4 60  1.97  0.99   2.00    2.08  1.48  0.00   3.00   3.00 -0.55
## anninc     5 60 55.78 40.58  41.50   49.79 30.39 10.00 180.00 170.00  1.26
## wgtgain    6 60 27.08 12.59  25.00   25.38  9.64  8.00  75.00  67.00  1.51
## gender     7 60  0.50  0.50   0.50    0.50  0.74  0.00   1.00   1.00  0.00
## zwgtgain   8 60  0.00  1.00  -0.17   -0.14  0.77 -1.52   3.81   5.32  1.51
## zapgar     9 60  0.00  1.00   0.15    0.04  1.06 -2.70   1.58   4.28 -0.39
## zsmokes   10 60  0.00  1.00  -0.60   -0.13  0.00 -0.60   1.64   2.24  1.03
##          kurtosis   se
## apgar       -0.37 0.27
## gestat       3.81 0.70
## smokes      -0.96 0.06
## prenat      -0.83 0.13
## anninc       0.97 5.24
## wgtgain      2.87 1.63
## gender      -2.03 0.07
## zwgtgain     2.87 0.13
## zapgar      -0.37 0.13
## zsmokes     -0.96 0.13
```

```r
m2 <- lm(zapgar ~ zwgtgain, d)
summary(m2)
```

```
## 
## Call:
## lm(formula = zapgar ~ zwgtgain, data = d)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -3.0621 -0.5328  0.0329  0.6559  1.6384 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)  
## (Intercept) -2.07e-16   1.26e-01     0.0    1.000  
## zwgtgain    -2.65e-01   1.27e-01    -2.1    0.041 *
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.972 on 58 degrees of freedom
## Multiple R-squared:  0.0704,	Adjusted R-squared:  0.0543 
## F-statistic: 4.39 on 1 and 58 DF,  p-value: 0.0405
```



Regress APGAR on smoking. Standardized categorical variables are hard to interpret.


```r
m3 <- lm(apgar ~ smokes, d)
summary(m3)
```

```
## 
## Call:
## lm(formula = apgar ~ smokes, data = d)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -5.182 -1.182 -0.182  1.687  3.687 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)    7.182      0.294   24.46   <2e-16 ***
## smokes        -1.869      0.569   -3.29   0.0017 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.95 on 58 degrees of freedom
## Multiple R-squared:  0.157,	Adjusted R-squared:  0.143 
## F-statistic: 10.8 on 1 and 58 DF,  p-value: 0.00172
```

```r
qplot(data = d, x = smokes, y = apgar) + geom_smooth(method = "lm")
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-31.png) 

```r
# Standardized variables
m4 <- lm(zapgar ~ zsmokes, d)
summary(m4)
```

```
## 
## Call:
## lm(formula = zapgar ~ zsmokes, data = d)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -2.4638 -0.5619 -0.0864  0.8023  1.7533 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)   
## (Intercept) -1.84e-16   1.20e-01    0.00   1.0000   
## zsmokes     -3.96e-01   1.21e-01   -3.29   0.0017 **
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.926 on 58 degrees of freedom
## Multiple R-squared:  0.157,	Adjusted R-squared:  0.143 
## F-statistic: 10.8 on 1 and 58 DF,  p-value: 0.00172
```

```r
qplot(data = d, x = zsmokes, y = zapgar) + geom_smooth(method = "lm")
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-32.png) 


Regress APGAR on weight-gain and smoking. The coefficient of weight-gain is predicted change in APGAR for a unit change in weight-gain, when statistically controlling for smoking. The coefficient for smoking is expected change in APGAR if the mother smokes, over and above the effect of weight-gain. Note that the individual predictors for smoking and weight-gain become more significant. By controlling for one variable, the other variable can explain a larger proportion of the variance in the dependent variable. The standardized effects allow us to coarsely compare the effects to each other.

We allow exogenous variables to be correlated, in an unanalyzed relationship. Exogenous variables do not have a cause specified in the modelling. Weight gain and smoking would be exogenous variables in these variables. Double arrow is an unanalyzed relationship. Two single arrows form a mutual influence relationship.


```r
m5 <- lm(apgar ~ wgtgain + smokes, d)
summary(m5)
```

```
## 
## Call:
## lm(formula = apgar ~ wgtgain + smokes, data = d)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -5.069 -1.005 -0.047  1.179  3.548 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)   9.4728     0.6262   15.13  < 2e-16 ***
## wgtgain      -0.0771     0.0191   -4.03  0.00017 ***
## smokes       -2.6334     0.5405   -4.87  9.2e-06 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.73 on 57 degrees of freedom
## Multiple R-squared:  0.344,	Adjusted R-squared:  0.321 
## F-statistic: 14.9 on 2 and 57 DF,  p-value: 6.13e-06
```

```r
# Standardized variables
m6 <- lm(zapgar ~ zwgtgain + zsmokes, d)
summary(m6)
```

```
## 
## Call:
## lm(formula = zapgar ~ zwgtgain + zsmokes, data = d)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -2.4100 -0.4780 -0.0224  0.5608  1.6869 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -1.26e-16   1.06e-01    0.00  1.00000    
## zwgtgain    -4.61e-01   1.15e-01   -4.03  0.00017 ***
## zsmokes     -5.58e-01   1.15e-01   -4.87  9.2e-06 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.824 on 57 degrees of freedom
## Multiple R-squared:  0.344,	Adjusted R-squared:  0.321 
## F-statistic: 14.9 on 2 and 57 DF,  p-value: 6.13e-06
```


Covariance is the correlation of the variable times the standard deviation of each variable. Covariance takes into account the unit of measurement of the variables. 
cov = r * SD1 * SD2


Covariance matrix has 10 pieces of information. Correlation matrix has 6 pieces of information.

```r
# Observed correlation matrix
d <- subset(d, select = c(apgar, gestat, smokes, wgtgain))
round(cor(subset(d, select = c(apgar, gestat, smokes, wgtgain))), 2)
```

```
##         apgar gestat smokes wgtgain
## apgar    1.00   0.53  -0.40   -0.27
## gestat   0.53   1.00  -0.53    0.35
## smokes  -0.40  -0.53   1.00   -0.35
## wgtgain -0.27   0.35  -0.35    1.00
```




// We randomly assign path coefficients. Then we compute correlations.

Why would variables be correlated?

1. A causes B
2. Mediation: A causes B causes C
3. Unanalyzed effects: C causes A,B; C correlates with D, C causes A, D causes B causes E

Assumed causal paths:

S <--a--> W
S  --b--> G
S  --c--> A
W  --d--> G
W  --e--> A
G  --f--> A

Correlation values based on the causal paths:

cor_sw = a
cor_sg = b + a*d
cor_wa = e + d*f + a*c + a*b*f
cor_sa = c + b*f + a*e + a*d*f
cor_wg = d + a*b
cor_ga = f + a*b*f + a*c*d + b*c + d*e

Maximum-likelihood tries to find the best values for a:f to generate the model-implied correlation matrix




```r

m1 <- "\n      # regressions\n      gestat ~ smokes + wgtgain\n      apgar ~ smokes + wgtgain + gestat\n      # residual correlations\n      smokes ~~ wgtgain\n      "

fit <- sem(m1, data = d, likelihood = "wishart")
```

```
## Warning: lavaan WARNING: model syntax contains
## variance/covariance/intercept formulas involving (an) exogenous
## variable(s): [smokes wgtgain]; Please use fixed.x=FALSE or leave them
## alone
```

```r
summary(fit, standardized = T)
```

```
## lavaan (0.5-14) converged normally after  38 iterations
## 
##   Number of observations                            60
## 
##   Estimator                                         ML
##   Minimum Function Test Statistic                0.000
##   Degrees of freedom                                 0
##   P-value (Chi-square)                           0.000
## 
## Parameter estimates:
## 
##   Information                                 Expected
##   Standard Errors                             Standard
## 
##                    Estimate  Std.err  Z-value  P(>|z|)   Std.lv  Std.all
## Regressions:
##   gestat ~
##     smokes           -5.574    1.395   -3.997    0.000   -5.574   -0.461
##     wgtgain           0.081    0.049    1.647    0.099    0.081    0.190
##   apgar ~
##     smokes           -1.393    0.486   -2.866    0.004   -1.393   -0.295
##     wgtgain          -0.095    0.016   -6.094    0.000   -0.095   -0.570
##     gestat            0.223    0.040    5.529    0.000    0.223    0.570
## 
## Covariances:
##   smokes ~~
##     wgtgain          -1.972    0.775   -2.545    0.011   -1.972   -0.351
## 
## Variances:
##     gestat           20.003    3.683                     20.003    0.689
##     apgar             1.912    0.352                      1.912    0.432
##     smokes            0.199    0.037                      0.199    1.000
##     wgtgain         158.518   29.186                    158.518    1.000
```

```r
inspect(fit, "sampstat")
```

```
## $cov
##         gestat  apgar   smokes  wgtgan 
## gestat   29.020                        
## apgar     5.953   4.423                
## smokes   -1.269  -0.372   0.199        
## wgtgain  23.888  -7.024  -1.972 158.518
## 
## $mean
##  gestat   apgar  smokes wgtgain 
##  37.117   6.683   0.267  27.083
```

```r
fitted(fit)
```

```
## $cov
##         gestat  apgar   smokes  wgtgan 
## gestat   29.020                        
## apgar     5.953   4.423                
## smokes   -1.269  -0.372   0.199        
## wgtgain  23.888  -7.024  -1.972 158.518
## 
## $mean
##  gestat   apgar  smokes wgtgain 
##       0       0       0       0
```

```r
# difference between the two covariance matrices
resid(fit)
```

```
## $cov
##         gestat apgar smokes wgtgan
## gestat  0                         
## apgar   0      0                  
## smokes  0      0     0            
## wgtgain 0      0     0      0     
## 
## $mean
##  gestat   apgar  smokes wgtgain 
##       0       0       0       0
```

The model perfectly replicated the observed covariance matrix.

Minimum function test statistic is a chi-squared test statistic.

If the p-value is significant, we reject the model.
If the p-value is not significant, we can accept the model.

"Disturbances" are residuals of the model. They are latent variables. They contain all the other causes that were not specified in the model. Usually only have distrubances for the endogenous variables.

