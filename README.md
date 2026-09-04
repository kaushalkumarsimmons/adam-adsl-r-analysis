adam-adsl-r-analysis/
│
├── README.md
│
├── data/
│   └── adam_adsl.csv
│
├── R/
│   ├── 01_import_qc.R
│   ├── 02_metadata.R
│   ├── 03_demographics.R
│   ├── 04_visualization.R
│   ├── 05_statistical_tests.R
│   ├── 06_regression.R
│   └── 07_bayesian_model.R
│
├── output/
│   ├── tables/
│   │   └── linear_regression_results.csv
│   │
│   └── figures/
│       ├── age_by_treatment.png
│       ├── sex_by_treatment.png
│       ├── bmi_by_treatment.png
│       └── treatment_duration.png
│
└── report/
    └── ADSL_analysis.qmd
