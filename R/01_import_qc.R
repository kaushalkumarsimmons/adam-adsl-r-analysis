library(tidyverse)
library(janitor)
library(skimr)

# Load dataset

adsl <- read_csv(
  "data/adam_adsl.csv",
  show_col_types = FALSE
)

# Basic structure --

dim(adsl)
names(adsl)
glimpse(adsl)

# Subject-level uniqueness --

n_subjects <- n_distinct(adsl$USUBJID)
n_records <- nrow(adsl)

cat("Records:", n_records, "\n")
cat("Unique subjects:", n_subjects, "\n")

# Duplicate subject check ---

duplicates <- adsl %>%
  count(USUBJID) %>%
  filter(n > 1)

duplicates

# Missingness ---
missing_summary <- adsl %>%
  summarise(
    across(everything(), ~ sum(is.na(.)))
  ) %>%
  pivot_longer(
    everything(),
    names_to = "variable",
    values_to = "missing_n"
  ) %>%
  mutate(
    missing_percent = 100 * missing_n / nrow(adsl)
  )

missing_summary

# QC check
stopifnot(nrow(adsl) == 100)

stopifnot(
  n_distinct(adsl$USUBJID) == nrow(adsl)
)

stopifnot(
  all(adsl$SAFFL %in% c("Y", "N"))
)

stopifnot(
  all(adsl$ITTFL %in% c("Y", "N"))
)

# Treatment consistency
treatment_qc <- adsl %>%
  filter(ARMCD != ACTARMCD) %>%
  select(
    USUBJID,
    ARMCD,
    ACTARMCD,
    TRT01P,
    TRT01A
  )

treatment_qc

