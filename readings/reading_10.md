Questions about Rex Kline's book (for Tues., Nov. 19)
===============================================================================

> Read chapter 10 of Kline's book and be prepared to answer the questions below. Please also do the data analysis exercise described below (and send me your R script by Tuesday 9 am). 
 
#### 1. Kline suggests that we should analyze a structural regression model in a two-step process. Describe this process.

1. Specify the SR first as a measurement model to determine the indicators adequately measure the factors.
2. Compare the fits of the SR models to the CFA model from step 1. An SR model with a just-identified structural part will have the same estimates as the CFA model.

If the factor loadings change substantially when different SR paths are modeled, the measurement model lacks invariance, leading to "interpretational confoundings".



#### 2. How do we compute the percentage of explained variance in endogenous factors? According to Kline, the model shown in Figure 10.3 explains 24.5% of the variance of the job satisfaction factor. How did he get this number?

```
R^2 = 1 - (disturbance variance / model-implied variance)
```


```r
1 - (0.467/0.618)
```

```
## [1] 0.2443
```




#### 3. Kline suggests to retain the just-identified structural regression model shown in Figure 10.3 and not the over-identified structural regression model hypothesized by Houghton and Jinkerson (2007, see Figure 5.9, p. 120). Explain his reasoning.

When the two paths were removed from the just-identified model, Kline observed some "localized fit problems" in the correlation residuals (e.g., between Work2 and Imagery, Beliefs and Mood1/Mood2).



#### 4. It turns out that the power for the model shown in Figure 10.3 is quite satisfactory. And yet, the dataset contains only 263 observations. How come that this model has satisfactory power despite the relatively small number of observations?

The relatively high number of dfs makes up for the small sample size.



#### 5. Be prepared to draw on the blackboard an equivalent model of the model shown in Figure 5.9 (p. 120). Make sure that your new equivalent looks rather different than the original model. Justify why your model is equivalent.



#### 6. If it is possible to take into account measurement error by specifying a latent variable with a single indicator (and then fixing the variance of the measurement error associated with this indicator at some a priori value > 0), why don't we adopt this approach routinely in path analysis?

Because we need to have a good estimate for the measurement error.



#### 7. Describe the differences between "reflective measurement" and "formative measurement".

* In formative measurement, the indicators cause the factors. For example, components in a composite measurement form the _latent composite_. (Income and education cause SES in some respect.) These indicators are not interchangable, because it would fundamentally alter the make-up of the factor to change its constituent parts. These indicators need not be positively correlated. Cause indicators are exogenous variables that are free to covary; they do not have measurement error. "Measurement error is represented at the construct level, not at the indicator level as in reflective measurement" (p. 281). The measurement errors are captured in the disturbance.
* In reflective measurement, the indicators are caused by the factors. You can interchange and swap around equally reliable reflective indicators without changing the definition of the factor. These indicators should also have positive correlations. 



#### 8. Describe the "2+ emitted paths rule"

A latent composite variable needs at least two outgoing paths (direct effects on endogenous variables) in order to have an identified disturbance variance.



#### 9. The test of configural invariance across groups can be considered a test of moderation in that we examine whether the direct effects in the model 'depend' on group membership." True or false?

False. The test of equal direct effects may be considered a test of moderation.



#### 10. Carefully read Thompson's (2000) "ten commandments" of structural equation modeling (see footnote of Table 10.7 on page 289) and be prepared to name at least three of them WITHOUT LOOKING AT YOUR NOTES.

1. No small samples.
2. Analyze covariance, not correlation matrices.
3. Simpler models are better.
4. Verify distributional assumptions.
5. Consider theoretical and practical significance, not just statistical significance.
6. Report multiple fit statistics.
7. Use two-step modeling for structural regression models.
8. Consider theoretically plausible alternative models.
9. Respecify rationally.
10. Acknowledge equivalent models.



#### 11. Name three things we can do to avoid our tendency to focus on information that confirms our expectations with regard to a hypothesized structural model.

1. Deal with equivalent models. Generative plausible alternatives and then argue for your preferred model.
2. Deal with alternative, non-equivalent models. Argue for your model.
3. Do not make claims about causality if your design is not experimental (i.e., lacks control groups, manipulated variables).

