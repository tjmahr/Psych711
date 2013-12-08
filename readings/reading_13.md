Questions about Rex Kline's book (for Tues., Dec. 10)
===============================================================================

> Read chapter 13 of Kline's book and pp. 750-772 of Tabachnick and Fidell's book. Be prepared to answer the questions below. Please also do the data analysis exercise described at the end. 


```r
library(lavaan)
```

```
## Warning: package 'lavaan' was built under R version 3.0.2
```

```
## This is lavaan 0.5-15
## lavaan is BETA software! Please report any bugs.
```


Kline Reading
-------------------------------------------------------------------------------

> For each section, be prepared to name at least two or three of these points without looking at your notes. Identify the error (or the two errors) that you are most likely to commit. Discuss with your other group members "your error" and why you think you are particularly likely to commit this error. Then, formulate a goal and say what you are going to do in the future in order to avoid this error.


### 1. Specification

1. Specify the model after the data are collected rather than before.
1. d

### 2. Do the same thing with points 15 to 20 in the section "Improper care and feeding: Data" (pp. 359-361).

### 3. Do the same thing with points 21 to 37 in the section "Checking critical judgement at the door: Analysis and respecification " (pp. 361-363).

### 4. Do the same thing with points 38 to 52 in the section "The garden path: Interpretation" (pp. 363-366).


Tabachnick and Fidell reading
-------------------------------------------------------------------------------

### 5. Tabachnick and Fidell claim that it is not possible to examine all pairwise scatterplots to check for linearity between all nine manifest variables. What do they do instead?

### 6.It turns out that most of the variables in their example are skewed. What do T & F do to address this skew? If they apply a transformation, which transformation do they use? If not, what do they do?

### 7.Look at the fit indices reported in Table 14.19. Look especially at the RMSEA and its associated confidence interval. Is the close-fit hypothesis rejected? Is the non-close fit hypothesis rejected?

### 8. T & F do a number of model modifications after the estimation of the initial model. In general, do they handle these post-hoc modifications in a satisfactory manner?

### 9. T & F say that when we add covariances between error terms, "we don't exactly know what we are correlating but only what we are not correlating". Why is that?

### 10. T & F say that under ideal circumstances one would re-estimate the final model (the one presented in Figure 14.13) and drop all the nonsignificant paths. What do you think about this suggestion?

### 11. Is T & F's results section complete? Would you have added (or changed) anything?

### 12.In the final model, the direct path from "age" to "health care utilization" is non significant. This is surprising. After all, we would expect older people to see doctors more often and to take more drugs, wouldn't we? Explain what is going on here.


Data Analysis
-------------------------------------------------------------------------------

### 13. Run additional analyses on the Israel dataset. First, run a one-factor confirmatory factor analysis with the variables v7, v8, v9, v11, v12, v13, v16, v17, v18, and v24. Determine whether this model has a satisfactory fit.

### 14. Regardless of what you found in the previous step, run a confirmatory factor analysis with four factors defined as follows: "Friends" (v7, v8, v9), "Attitude" (v11, v12, v13), "Relaxed" (v16, v17, v18), and "Variability" (v24). You want to fix the variance of the measurement error of v24 to zero. Determine whether this model has a satisfactory fit.

### 15. Regardless of what you found in the previous step, run the structural regression model depicted below (see Figure 1). Determine whether this model has a satisfactory fit (chi square, fit indices, correlation residuals ). What conclusions would you draw from the analyses you have run in steps 13, 14, and 15?

### 16. Conduct a power analysis of this model.

### 17. Test whether the direct path from the "Relaxed" factor to the "Attitude" factor is really necessary. Does model fit decrease significantly if we take out this path (i.e., do a chi square difference test)?

### 18. Run the structural model depicted below (see Figure 2) and compare your output to the one obtained in step 15. Explain the differences and similarities. 





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

