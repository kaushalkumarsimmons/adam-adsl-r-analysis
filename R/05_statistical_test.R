library(tidyverse)
library(janitor)
library(skimr)

# Load dataset

adsl <- read_csv(
  "data/adam_adsl.csv",
  show_col_types = FALSE
)


# Statistical Testing
anova_model <- aov(
  AGE ~ TRT01P,
  data = adsl
)

summary(anova_model)

kruskal.test(
  AGE ~ TRT01P,
  data = adsl
)

chisq.test(
  table(adsl$TRT01P, adsl$SEX)
)

fisher.test(
  table(adsl$TRT01P, adsl$SEX)
)

# Correlation
cor(
  adsl$AGE,
  adsl$TRTDURD,
  use = "complete.obs"
)

p_aget <-ggplot(
  adsl,
  aes(x = AGE, y = TRTDURD)
) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(
    title = "Age and Treatment Duration",
    x = "Age",
    y = "Treatment Duration (days)"
  ) +
  theme_minimal()

ggsave(
  "output/figures/age_treatment_duration.png",
  p_aget,
  width = 8,
  height = 5,
  dpi = 300
)

aov_duration <- aov(TRTDURD ~ TRT01P, data = adsl)

summary(aov_duration)

kruskal_duration <- kruskal.test(
  TRTDURD ~ TRT01P,
  data = adsl
)

kruskal_duration
