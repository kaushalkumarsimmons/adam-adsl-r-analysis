library(tidyverse)

adsl <- read_csv(
  "data/adam_adsl.csv",
  show_col_types = FALSE
)

# ADSL Structure
adsl_metadata <- tibble(
  variable = names(adsl),
  class = map_chr(adsl, ~ class(.x)[1])
)
adsl_metadata

#variable classification
adsl_metadata <- adsl_metadata %>%
  mutate(
    category = case_when(
      variable %in% c(
        "STUDYID", "USUBJID", "SUBJID", "SITEID"
      ) ~ "Identifiers",
      
      variable %in% c(
        "AGE", "AGEU", "SEX", "RACE", "ETHNIC"
      ) ~ "Demographics",
      
      variable %in% c(
        "ARMCD", "ARM",
        "ACTARMCD", "ACTARM",
        "TRT01P", "TRT01PN",
        "TRT01A", "TRT01AN"
      ) ~ "Treatment",
      
      variable %in% c(
        "SAFFL", "ITTFL", "PPROTFL"
      ) ~ "Analysis Populations",
      
      variable %in% c(
        "TRTSDT", "TRTEDT", "TRTDURD",
        "AVGDD", "CUMDOSE"
      ) ~ "Exposure",
      
      variable %in% c(
        "HEIGHTBL", "WEIGHTBL", "BMIBL"
      ) ~ "Baseline",
      
      variable %in% c(
        "DTHFL", "DTHDT"
      ) ~ "Death",
      
      TRUE ~ "Other"
    )
  )

adsl_metadata
