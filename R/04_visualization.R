library(tidyverse)

adsl <- read_csv(
  "data/adam_adsl.csv",
  show_col_types = FALSE
)

# Visualization portfolio
p_age <- ggplot(adsl, aes(x = TRT01P, y = AGE)) +
  geom_boxplot() +
  labs(
    title = "Age Distribution by Treatment Arm",
    x = "Treatment",
    y = "Age (years)"
  ) +
  theme_minimal()

ggsave(
  "output/figures/age_by_treatment.png",
  p_age,
  width = 8,
  height = 5,
  dpi = 300
)

p_sex <-ggplot(adsl, aes(x = TRT01P, fill = SEX)) +
  geom_bar(position = "dodge") +
  labs(
    title = "Sex Distribution by Treatment Arm",
    x = "Treatment",
    y = "Number of Subjects"
  ) +
  theme_minimal()

ggsave(
  "output/figures/sex_by_treatment.png",
  p_sex,
  width = 8,
  height = 5,
  dpi = 300
)

p_bmi <-ggplot(adsl, aes(x = TRT01P, y = BMIBL)) +
  geom_boxplot() +
  labs(
    title = "Baseline BMI by Treatment Arm",
    x = "Treatment",
    y = "BMI"
  ) +
  theme_minimal()

ggsave(
  "output/figures/bmi_by_treatment.png",
  p_bmi,
  width = 8,
  height = 5,
  dpi = 300
)

p_tdur <-ggplot(adsl, aes(x = TRT01P, y = TRTDURD)) +
  geom_boxplot() +
  labs(
    title = "Treatment Duration by Treatment Arm",
    x = "Treatment",
    y = "Treatment Duration (days)"
  ) +
  theme_minimal()

ggsave(
  "output/figures/duration_by_treatment.png",
  p_tdur,
  width = 8,
  height = 5,
  dpi = 300
)

