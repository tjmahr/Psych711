Questions about Rex Kline's book (for Tue., Sept. 17)**
===============================================================================

Read pages 28-51 (until "Data screening") and pp. 52-53 (Topic Box 3.1) in Rex Kline's book and prepare the answers to the following questions.
 
Chapter 2
-------------------------------------------------------------------------------

**When my goal is to describe (in standardized terms) the relative explanatory power of each predictor controlling for the rest, should I report beta weights or partial correlations?**
 
**Spearman's rank-order correlation describes the relationship between two dichotomous variables. True or false?**
 
**Can SEM handle dichotomous outcome variables?**
 
**What is the "critical ratio"? Above which value are critical ratios generally statistically significant?**
 
**Name some factors that affect the statistical power of a test.**
 
**For which types of solutions are standard errors generally calculated in maximum likelihood estimation: for the standardized or for the unstandardized solution? Once my SEM has generated the estimates for one type of solution, can I apply the statistical significance of the estimates to the other type of solution (i.e., does the statistical significance of the standardized regression weights apply to the unstandardized regression weights and/or vice versa)?**
 
**We are going to evaluate our structural models by computing a Chi square statistic. Does chi square indicate the degree of perfect fit or the degree of approximate fit.**
 
**What is the difference between parametric and nonparametric bootstrapping?**
 
 
Chapter 3
-------------------------------------------------------------------------------
 
**Assuming means are not analyzed, what are the three types of data input formats that all standard SEM programs can analyze?**

1. Raw data
2. Covariance matrix
3. Correlation matrix + standard deviations

Use 4-decimal accuracy for matrix summaries.
 
**Kline talks about matrices in "lower diagonal form". What does he refer to?**
 
**Is it acceptable to submit for analyses just a correlation matrix without standard deviations? Justify your answer.**
 
**A data matrix is positive definite only if it possesses certain characteristics. Name at least three of these characteristics:**
 
**Name three of the most common causes of nonpositive definite matrices.**
 
 
 
**Exercise 1 (p. 73): Compute a correlation matrix from a lower diagonal covariance matrix:**


```r
# Make the matrix
d <- matrix(data = c(42.25, 31.72, 63.05, 31.72, 148.84, 82.84, 63.05, 82.84, 
    376.36), nrow = 3, dimnames = list(c("X", "Y", "Z"), c("x", "y", "z")))
print(d)
```

```
##       x      y      z
## X 42.25  31.72  63.05
## Y 31.72 148.84  82.84
## Z 63.05  82.84 376.36
```

```r
# Get the SDs from the variances in the diagonal
variances <- diag(d)
SDs <- sqrt(variances)
print(SDs)
```

```
## [1]  6.5 12.2 19.4
```

```r
# Divide each row/column by the SD in the variances along the diagonal
d2 <- d
for (i in 1:3) {
    d2[i, ] <- d2[i, ]/SDs[i]
    d2[, i] <- d2[, i]/SDs[i]
}
print(d2, digits = 2)
```

```
##     x    y    z
## X 1.0 0.40 0.50
## Y 0.4 1.00 0.35
## Z 0.5 0.35 1.00
```

```r
# Alternatively:
cov2cor(d)
```

```
##     x    y    z
## X 1.0 0.40 0.50
## Y 0.4 1.00 0.35
## Z 0.5 0.35 1.00
```


**Exercise 2 (p. 73). Don't worry if you don't know how to do mean substitution.**

```r
# Load in the data file, look at the correlations using different missing
# data strategies
d <- read.csv("data/chap02_ex02.csv")
str(d)
```

```
## 'data.frame':	10 obs. of  3 variables:
##  $ X: int  NA 12 13 NA 15 13 17 18 19 17
##  $ Y: int  15 23 25 18 20 15 NA 24 21 NA
##  $ W: int  NA 48 38 38 39 35 36 47 42 NA
```

```r
# Listwise deletion
cor(d, use = "complete.obs")
```

```
##        X      Y      W
## X 1.0000 0.1336 0.2537
## Y 0.1336 1.0000 0.6103
## W 0.2537 0.6103 1.0000
```

```r
# Pairwise deletion
cor(d, use = "pairwise.complete.obs")
```

```
##        X      Y      W
## X 1.0000 0.1336 0.1125
## Y 0.1336 1.0000 0.6453
## W 0.1125 0.6453 1.0000
```

```r
# Mean substition
SubstituteMean <- function(x) ifelse(is.na(x), mean(x, na.rm = T), x)
d2 <- apply(d, 2, SubstituteMean)
cor(d2)
```

```
##         X       Y      W
## X 1.00000 0.04757 0.1016
## Y 0.04757 1.00000 0.5323
## W 0.10156 0.53227 1.0000
```


**Exercise 3 (p. 73)**


```r
# Transform the covariance matrix into a correlation matrix.
cov_matrix <- matrix(data = c(12, 13, 13, 10), nrow = 2)
# The correlation is greater than 1.0, so it's out of bounds.
cov2cor(cov_matrix)
```

```
##       [,1]  [,2]
## [1,] 1.000 1.187
## [2,] 1.187 1.000
```



**Exercise 4 (p. 73). Hint: There two ways to show that a matrix is nonpositive definite. Either you submit the covariance matrix to an online matrix calculator (e.g., www.bluebit.gr/matrix-calculator). Or you show that the correlation matrix contains an out-of-bounds value.**


```r
d <- read.csv("data/chap02_ex04.csv")
str(d)
```

```
## 'data.frame':	7 obs. of  4 variables:
##  $ Case: Factor w/ 7 levels "A","B","C","D",..: 1 2 3 4 5 6 7
##  $ X   : int  42 34 22 NA 24 16 30
##  $ Y   : int  8 10 12 14 16 NA NA
##  $ W   : int  13 12 NA 8 7 10 10
```

```r
cov_matrix <- cov(x = d[, 2:4], use = "pairwise.complete.obs")
# Does the correlation matrix have an OOB value? Yes.
cov2cor(cov_matrix)
```

```
##         X       Y       W
## X  1.0000 -0.8959  0.7501
## Y -0.8959  1.0000 -1.4792
## W  0.7501 -1.4792  1.0000
```


_Is the covariance matrix nonpositive definitive?_


```r
# No the determinant is negative
det(cov_matrix)
```

```
## [1] -2539
```

```r
# No there's a negative eigenvalue
eigen(cov_matrix)
```

```
## $values
## [1] 98.229  7.042 -3.671
## 
## $vectors
##         [,1]    [,2]    [,3]
## [1,]  0.9333 -0.3494 0.08289
## [2,] -0.3020 -0.6391 0.70736
## [3,]  0.1941  0.6852 0.70197
```



