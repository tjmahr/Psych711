First Model
===============================================================================

## Look at the data


```r
library(lavaan)
library(lmSupport)
d <- lm.readDat("../data/data_apgar.dat")

# Just the modeled variables
data_subset <- d[, c("apgar", "gestat", "smokes", "wgtgain")]
round(psych::describe(data_subset), 2)
```

```
##         var  n  mean    sd median trimmed  mad min max range  skew
## apgar     1 60  6.68  2.10      7    6.77 2.22   1  10     9 -0.39
## gestat    2 60 37.12  5.39     38   38.33 2.97  20  42    22 -2.10
## smokes    3 60  0.27  0.45      0    0.21 0.00   0   1     1  1.03
## wgtgain   4 60 27.08 12.59     25   25.38 9.64   8  75    67  1.51
##         kurtosis   se
## apgar      -0.37 0.27
## gestat      3.81 0.70
## smokes     -0.96 0.06
## wgtgain     2.87 1.63
```

```r
# Get correlation matrix
cor(data_subset)
```

```
##           apgar  gestat  smokes wgtgain
## apgar    1.0000  0.5254 -0.3964 -0.2653
## gestat   0.5254  1.0000 -0.5282  0.3522
## smokes  -0.3964 -0.5282  1.0000 -0.3512
## wgtgain -0.2653  0.3522 -0.3512  1.0000
```

```r
# Get the covariance matrix
cov(data_subset)
```

```
##           apgar gestat  smokes wgtgain
## apgar    4.4234  5.953 -0.3718  -7.024
## gestat   5.9528 29.020 -1.2689  23.888
## smokes  -0.3718 -1.269  0.1989  -1.972
## wgtgain -7.0240 23.888 -1.9718 158.518
```


## Start with lavaan


```r
# Model apgar1
m1 <- '
  # regressions
    gestat ~ smokes + wgtgain
    apgar ~ smokes + wgtgain + gestat
  # residual correlations
    smokes ~~ wgtgain'
fit <- sem(m1, data = d, likelihood = "wishart")
```

```
## Warning: lavaan WARNING: model syntax contains variance/covariance/intercept formulas
##   involving (an) exogenous variable(s): [smokes wgtgain];
##   Please use fixed.x=FALSE or leave them alone
```

```r
summary(fit, standardized = TRUE)
```

```
## lavaan (0.5-15) converged normally after  38 iterations
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


### Covariance matrices


```r
# observed covariance matrix
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
# model covariance matrix
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
# residual covariance matrix
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
## [1] lmSupport_1.07.1 car_2.0-19       lavaan_0.5-15    knitr_1.5       
## 
## loaded via a namespace (and not attached):
##  [1] bitops_1.0-6       caTools_1.16       evaluate_0.5.1    
##  [4] formatR_0.10       gdata_2.13.2       gplots_2.12.1     
##  [7] gtools_3.1.1       gvlma_1.0.0.1      KernSmooth_2.23-10
## [10] MASS_7.3-29        mnormt_1.4-7       nnet_7.3-7        
## [13] pbivnorm_0.5-1     psych_1.3.10.12    quadprog_1.5-5    
## [16] stats4_3.0.2       stringr_0.6.2      tools_3.0.2
```

