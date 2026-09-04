library(tidyverse)

adsl <- read_csv(
  "data/adam_adsl.csv",
  show_col_types = FALSE
)

# Demographics
age_summary <- adsl %>%
  group_by(TRT01P) %>%
  summarise(
    N = n(),
    Mean = mean(AGE, na.rm = TRUE),
    SD = sd(AGE, na.rm = TRUE),
    Median = median(AGE, na.rm = TRUE),
    Q1 = quantile(AGE, 0.25, na.rm = TRUE),
    Q3 = quantile(AGE, 0.75, na.rm = TRUE),
    Min = min(AGE, na.rm = TRUE),
    Max = max(AGE, na.rm = TRUE),
    .groups = "drop"
  )

#Gender
sex_summary <- adsl %>%
  count(TRT01P, SEX) %>%
  group_by(TRT01P) %>%
  mutate(
    Percent = 100 * n / sum(n)
  ) %>%
  ungroup()

# Race
race_summary <- adsl %>%
  count(TRT01P, RACE) %>%
  group_by(TRT01P) %>%
  mutate(
    Percent = 100 * n / sum(n)
  ) %>%
  ungroup()

