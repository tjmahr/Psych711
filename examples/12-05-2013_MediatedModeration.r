# Random seed for replicability
set.seed(14214)

# Create the data
id <- 1:200
condition <- rep(c(-.5, .5), 100)
outgroup <- c(rep(-.5, 100), rep(.5, 100))
empathy <- 4 + .4 * condition + .4 * outgroup + 
  .8 * condition * outgroup + rnorm(200, sd = 1)
helping <- 4 + 0 * condition + .4 * empathy + 0 * outgroup + 
  0 * condition * outgroup + 0 * empathy * outgroup + rnorm(200, sd = 1)
d <- data.frame(id, condition, outgroup, empathy, helping)
psych::describe(d)

# Random seed for replicability
set.seed(334324342)

# Create the data
id <- 1:200
condition <- rep(c(-.5, .5), 100)
outgroup <- c(rep(-.5, 100), rep(.5, 100))
empathy <- 4 + .6 * condition + 0 * outgroup + 
  0 * condition * outgroup + rnorm(200, sd = 1)
helping <- 4 + 0 * condition + .4 * empathy + -2.5 * outgroup + 
  0 * condition * outgroup + .7 * empathy * outgroup + rnorm(200, sd = 1)
d <- data.frame(id, condition, outgroup, empathy, helping)
psych::describe(d)