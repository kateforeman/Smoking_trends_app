
# load in library: ----

library(tidyverse)
library(janitor)

# source in cleaning script: ----

source("cleaning_scripts/part2_data_cleaning.R")

# assign as object: ----

smoking_data_updated <- overall_scotland_part2_cleaned 

# recode: ----

smoking_data_updated <- overall_scotland_part2_cleaned  %>%
  mutate(smoking_data_updated, scottish_health_survey_indicator = recode(
    scottish_health_survey_indicator,
    "Doctor-diagnosed asthma: No" = "Non-asthmatic",
    "Smoking status: Never smoked/Used to smoke occasionally" = "Never Smoked",
    "Any cardiovascular condition: No cardiovascular condition" = "Cardiovascular Condition: No",
    "Any cardiovascular condition: Has a cardiovascular condition" = "Cardiovascular Condition: Yes",
    "Smoking status: Used to smoke regularly" = "Used to Smoke",
    "E-cigarette use: Currently using" = "E-cigarette: Current User",
    "E-cigarette use: Ever previously used" = "E-cigarette: Previous User",
    "E-cigarette use: Never used" = "E-cigarette: Never Used",
    "Smoking status: Current smoker" = "Current Smoker",
    "Doctor-diagnosed asthma: Yes" = "Asthmatic"
    )
    )

















