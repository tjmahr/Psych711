# Demo of power functions


```r
# Load the functions from an R script I put online. You need to be online
# and the github has to be working for these functions to load
source("https://raw.github.com/tjmahr/Psych711/master/power.r")
```


## Power from df and n

Default values will be used if `rmsea0` or `alpha` are missing. By default `rmsea` is 0.05 and `alpha` is 0.05.


```r
compute_power(df = 5, n = 60, rmseaa = 0.01, rmsea0 = 0.05, alpha = 0.05)
```

```
## List of 7
##  $ df         : num 5
##  $ n          : num 60
##  $ rmsea0     : num 0.05
##  $ rmseaa     : num 0.01
##  $ alpha      : num 0.05
##  $ hypothesis: chr "Not-close-fit hypothesis"
##  $ power      : num 0.0668
##  - attr(*, "class")= chr "PowerSummary"
```

```r
compute_power(df = 5, n = 60, rmseaa = 0.01)
```

```
## List of 7
##  $ df         : num 5
##  $ n          : num 60
##  $ rmsea0     : num 0.05
##  $ rmseaa     : num 0.01
##  $ alpha      : num 0.05
##  $ hypothesis: chr "Not-close-fit hypothesis"
##  $ power      : num 0.0668
##  - attr(*, "class")= chr "PowerSummary"
```

```r
compute_power(df = 5, n = 60, rmseaa = 0.08)
```

```
## List of 7
##  $ df         : num 5
##  $ n          : num 60
##  $ rmsea0     : num 0.05
##  $ rmseaa     : num 0.08
##  $ alpha      : num 0.05
##  $ hypothesis: chr "Close-fit hypothesis"
##  $ power      : num 0.0969
##  - attr(*, "class")= chr "PowerSummary"
```


### Specific hypotheses

`not_close_fit` computes the power but it will make sure that you are evaluating a not-close-fit hypothesis. It also lets you omit the `rmseaa`, in which case the default value 0.01 is used. It will also yell at you if RMSEA-Alt is bigger than the null-value


```r
# Set a specific RMSEA
not_close_fit(df = 5, n = 373, rmseaa = 0.02)
```

```
## List of 7
##  $ df         : num 5
##  $ n          : num 373
##  $ rmsea0     : num 0.05
##  $ rmseaa     : num 0.02
##  $ alpha      : num 0.05
##  $ hypothesis: chr "Not-close-fit hypothesis"
##  $ power      : num 0.19
##  - attr(*, "class")= chr "PowerSummary"
```

```r
# Take advantage of default value
not_close_fit(df = 5, n = 373)
```

```
## List of 7
##  $ df         : num 5
##  $ n          : num 373
##  $ rmsea0     : num 0.05
##  $ rmseaa     : num 0.01
##  $ alpha      : num 0.05
##  $ hypothesis: chr "Not-close-fit hypothesis"
##  $ power      : num 0.229
##  - attr(*, "class")= chr "PowerSummary"
```

```r
# Error checking
not_close_fit(df = 5, n = 373, rmseaa = 0.08)
```

```
## Error: RMSEA-Alt should be less than RMSEA-0
```


`close_fit` works similarly, by making sure you are evaluating a close-fit hypothesis and allowing you to use the default 0.08 if `rmseaa` is omitted.


```r
# Set a specific RMSEA
close_fit(df = 5, n = 373, rmseaa = 0.1)
```

```
## List of 7
##  $ df         : num 5
##  $ n          : num 373
##  $ rmsea0     : num 0.05
##  $ rmseaa     : num 0.1
##  $ alpha      : num 0.05
##  $ hypothesis: chr "Close-fit hypothesis"
##  $ power      : num 0.631
##  - attr(*, "class")= chr "PowerSummary"
```

```r
# Take advantage of default value
close_fit(df = 5, n = 373)
```

```
## List of 7
##  $ df         : num 5
##  $ n          : num 373
##  $ rmsea0     : num 0.05
##  $ rmseaa     : num 0.08
##  $ alpha      : num 0.05
##  $ hypothesis: chr "Close-fit hypothesis"
##  $ power      : num 0.317
##  - attr(*, "class")= chr "PowerSummary"
```

```r
# Error checking
close_fit(df = 5, n = 373, rmseaa = 0.01)
```

```
## Error: RMSEA-Alt should be greater than RMSEA-0
```


## Sample size from power and df

Default values will be used if `rmsea0`, `desired` (power) or `alpha` are missing. By default, `rmsea` is 0.05, `desired` is 0.8 and `alpha` is 0.05.


```r
compute_sample_size(df = 2, rmseaa = 0.01, rmsea0 = 0.05, desired = 0.8, alpha = 0.05)
```

```
## List of 7
##  $ df         : num 2
##  $ n          : num 2381
##  $ rmsea0     : num 0.05
##  $ rmseaa     : num 0.01
##  $ alpha      : num 0.05
##  $ hypothesis: chr "Not-close-fit hypothesis"
##  $ power      : num 0.8
##  - attr(*, "class")= chr "PowerSummary"
```

```r
# Take advantage of defaults
compute_sample_size(df = 2, rmseaa = 0.01)
```

```
## List of 7
##  $ df         : num 2
##  $ n          : num 2381
##  $ rmsea0     : num 0.05
##  $ rmseaa     : num 0.01
##  $ alpha      : num 0.05
##  $ hypothesis: chr "Not-close-fit hypothesis"
##  $ power      : num 0.8
##  - attr(*, "class")= chr "PowerSummary"
```

```r
compute_sample_size(df = 2, rmseaa = 0.08)
```

```
## List of 7
##  $ df         : num 2
##  $ n          : num 3500
##  $ rmsea0     : num 0.05
##  $ rmseaa     : num 0.08
##  $ alpha      : num 0.05
##  $ hypothesis: chr "Close-fit hypothesis"
##  $ power      : num 0.801
##  - attr(*, "class")= chr "PowerSummary"
```

