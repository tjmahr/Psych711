# Demo of power functions

# Load the functions
source("https://raw.github.com/tjmahr/Psych711/master/power.r")

# Default values will be used if rmsea0 or alpha are missing. By default rmsea 
# is 0.05 and alpha is 0.05.
compute_power(df = 5, n = 60, rmseaa = 0.01, rmsea0 = 0.05, alpha = 0.05)
compute_power(df = 5, n = 60, rmseaa = 0.01)
compute_power(df = 5, n = 60, rmseaa = 0.08)

# Default values will be used if rmsea0, desired (power) or alpha are missing.
# By default, rmsea is 0.05, desired is 0.8 and alpha is 0.05.
compute_sample_size(df = 2, rmseaa = 0.01, rmsea0 = 0.05, desired = 0.8, alpha = 0.05)
compute_sample_size(df = 2, rmseaa = 0.01)
compute_sample_size(df = 2, rmseaa = 0.08)

