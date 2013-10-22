# Demo of power functions

```r
# Load the functions from an R script I put online. You need to be online
# and the github has to be working for these functions to load
source("https://raw.github.com/tjmahr/Psych711/master/power.r")
```

## Power

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
##  $ hyptothesis: chr "Not-close-fit hypothesis"
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
##  $ hyptothesis: chr "Not-close-fit hypothesis"
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
##  $ hyptothesis: chr "Close-fit hypothesis"
##  $ power      : num 0.0969
##  - attr(*, "class")= chr "PowerSummary"
```

## Sample size for power

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
##  $ hyptothesis: chr "Not-close-fit hypothesis"
##  $ power      : num 0.8
##  - attr(*, "class")= chr "PowerSummary"
```

```r
compute_sample_size(df = 2, rmseaa = 0.01)
```

```
## List of 7
##  $ df         : num 2
##  $ n          : num 2381
##  $ rmsea0     : num 0.05
##  $ rmseaa     : num 0.01
##  $ alpha      : num 0.05
##  $ hyptothesis: chr "Not-close-fit hypothesis"
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
##  $ hyptothesis: chr "Close-fit hypothesis"
##  $ power      : num 0.801
##  - attr(*, "class")= chr "PowerSummary"
```
