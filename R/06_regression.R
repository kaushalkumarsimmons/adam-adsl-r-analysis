library(tidyverse)
library(broom)

adsl <- read_csv(
  "data/adam_adsl.csv",
  show_col_types = FALSE
)

lm_model <- lm(
  TRTDURD ~ AGE + SEX + BMIBL + TRT01P,
  data = adsl
)

summary(lm_model)

tidy(lm_model)

glance(lm_model)

par(mfrow = c(2, 2))
plot(lm_model)

write_csv(
  tidy(lm_model),
  "output/tables/linear_regression_results.csv"
)
