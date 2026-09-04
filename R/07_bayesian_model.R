library(tidyverse)
library(brms)

adsl <- read_csv(
  "data/adam_adsl.csv",
  show_col_types = FALSE
)

bayes_model <- brm(
  TRTDURD ~ AGE + BMIBL + TRT01P,
  data = adsl,
  family = gaussian()
)

summary(bayes_model)

posterior_summary(bayes_model)

plot(bayes_model)
