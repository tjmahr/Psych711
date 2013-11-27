Questions about Rex Kline's book (for Tues., Sept. 10)
===============================================================================

Chapter 1
-------------------------------------------------------------------------------

### What are the five most widely used model-fitting programs for structural equation modeling (SEM)?

* EQS
* LISREL
* Mplus
* Amos
* CALIS/TCALIS
* Mx
* RAMONA
* SEPATH

These tools should yield identical results, maybe with some differences once you get a few decimal places out.

### Is SEM primarily a confirmatory or primarily an exploratory data analysis technique? Why?

Primarily a confirmatory model. In order to do structural equation modelling, we have to know something about the domain of interest, namely "which variables are assumed to affect other variables and the directionalities of these effects" (p. 8). Our hypotheses constitute a priori model specifications. The text therefore describes three ways of using SEM, depending on how much our model specifications restrict us. Under **strictly confirmatory** modeling, a _single_ model is accepted or rejected based on how well it accounts for the data. Under **alternative models** testing, the researcher specifies multiple models beforehand and selects the model that best corresponds to the data. Under **model generation**, we start with an initial model and iteratively test and modify models until we find the best one. This model of course should be justified by theory, parsimony, and the data. These three contexts of doing SEM fall along a continuum between confirmation and exploration.

### What is the difference between "observed" and "latent" variables? Can both types of variables be categorical and continuous in SEM? What is an "indicator"?

We measure observed variables as we collect data. Such data may be categorical, ordinal, or continuous. We hypothesize latent variables; these hypothetical constructs, or factors, are meant to be explanatory in nature. Latent variables are continuous, by definition, as they are "presumed reflect a continuum that is not directly observable" (p. 9). Observed variables may serve as indicators, i.e., as indirect measurements of an explanatory factor.

Observed variables are drawn in rectangles. Latent variables are drawn in round shapes.

### What is the difference between covariance and correlation? If one changes the unit of measurement, does this affect the correlation and/or the covariance? What is the relationship between correlation and covariance when both variables have been standardized?

Equations for covariance and correlation are given below. 

$$
  \begin{align}
    cov_{XY} &= r_{XY} \: SD_{X} \: SD_{Y} \\
    \\
    r_{XY} &= \frac{cov_{XY}}{SD_{X} \; SD_{Y}} 
  \end{align}
$$

Correlation is the standardized covariance; the standard deviations of the variables are divided out of the covariance. Changing the unit of measurement will not affect the correlation. When variables come already standardized, the standard deviations equal 1 and the covariance equals the correlation.

The covariance of a variable with itself is the variance.

### Imagine I want to test a structural equation model with 22 parameters. How many participants do I need to include in my study?

An _ideal_ **_N_ : _q_ ratio** (_N_ = number of cases, _q_ = number of parameters) is 20:1, so you would want 440 subjects. 

### Are multiple regression and SEM fundamentally different data analysis techniques? If yes, what is the fundamental difference? If no, how are the two techniques related to each other?

The general linear model, which includes multiple regression, is a subset of structural equation modeling. Ordinary regression is concerned with modeling the mean structure of the data, whereas SEM models a covariance structure to the data. It also supports modeling mean structures, but covariance structures seem to be the bread and butter of SEM. One fundamental difference between regression and SEM is that the former can only generate inferences about the means of observed variables whereas the latter make inferences about the means of latent variables.

### Are the results of SEM analyses generally reported correctly in scientific articles?

Results sections for SEM analyses are prone to reporting errors, including omitting parameter estimates, not fully describing the model specification or not reporting on alternative models.

### Some people call SEM a "disconfirmatory" data analysis technique. Why?

The true model, which relates data to reality, is unknown and unknowable. At best, SEM can tell us that our model fits the data, or that we should reject our model if it is inconsistent with the data. SEM can never prove or confirm a model. The same caveats applied to mediation analysis in our previous stats class.




Chapter 2 (pp. 19-28 only)
-------------------------------------------------------------------------------

### Which estimation technique is generally used to estimate parameters in multiple regression? Which one is generally used to estimate parameters in SEM?

Multiple regression uses ordinary least squares estimation. Structural equation modeling typically uses maximum likelihood estimation.

### What is the difference between "standardized" and "unstandardized" estimates in multiple regression analysis? What are beta weights?

$$
  \hat{Y} = B_{1}X_{1} + B_{2}X_{2} + A \\
$$

Unstandardized variables have not been mean-centered nor have they been scaled with standard deviation. The lack of centering mmeans that there is an intercept (_A_). With centering, the intercept is 0. The lack of scaling means that the regression coefficient tells us the predicted change in _Y_ for a unit change in a given variable, controlling for the other variables. The lack of scaling preserves the original units of measure, which is informative but also means that we cannot directly compare the regression coefficients.

$$
  \hat{z} = b_{1}z_{1} + b_{2}z_{2}
$$

Beta weights have been standardized, so we can compare these regression coefficients. We can say one variable have twice or half the relative predictive power of another in standard deviation units. Beta weights take into account intercorrelation of predictors. The following equation shows that the bivariate correlation involving the other predictor are subtracted out of the bivariate correlation between the predictor and the criterion. Then the shared variance is divided from the difference to yield the "corrected" correlation value.

$$
  b_{1} = \frac{r_{Y:1} - r_{Y:2}r_{1:2}}{1 - r_{1:2}^2}
$$

### Consider "standardized" and "unstandardized" regression coefficients. Which type of coefficients can be directly compared across predictors (same sample)? Which type of coefficients can be directly compared across samples (same predictor)?

Standardized predictors can be compared to each other, but not between different samples.

### What is the conceptual meaning of R2? What are two different ways to calculate it, one in the framework of correlation analysis and one in the framework of multiple regression analysis?

R^2 is the proportion of the variance explained by the predictors. It can be computed by squaring the correlation between the y's and the y-hats. It can also computed by timesing the beta-weights and the 

### What is a "specification error"? Under what conditions are specification errors particularly problematic? How can specification errors be avoided?

Specification errors are mistakes of L.O.V.E. (_left-out variable error_). Multiple regression assumes that the predictors that you omitted do not correlate with the predictors you included. These omitted variables may explain for a unique amount of the total variance, and the relationship between the included variables and the predictor variable may be biased (i.e., over- or under-estimated) because of the omission of relevant variables. To some extent, specification errors are impossible to avoid because we may not be able to specify all the relevant variables beforehand. 

### What is "suppression"?

Suppression occurs when: 

* a predictor's beta weight (its absolute value) is greater than its correlation with the dependent variable: |_b_| > _r_
* a predictor's beta weight has a different sign than the correlation: _r_ < 0 < _b_ or _b_ < 0 < _r_

### What does Rex Kline think about tools that automatically modify structural models so that they have a better fit?

"Death to stepwise regression, think for yourself" (p. 27). Stepwise regression capitalizes on chance and does so to an extreme.
