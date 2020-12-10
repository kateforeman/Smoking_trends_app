
# load in library: ----

library(tidyverse)
library(janitor)

# source in cleaning script: ----

source("cleaning_scripts/part2_data_cleaning.R")

# indicators for filtering

bindicators <- c("Smoking status: Never smoked/Used to smoke occasionally", 
                   "Smoking status: Used to smoke regularly",
                   "Smoking status: Current smoker",
                   "E-cigarette use: Ever previously used",
                   "E-cigarette use: Never used",
                   "E-cigarette use: Currently using")

# assign as object and remove cv/asthma: ----

smoking_data_updated <- overall_scotland_part2_cleaned %>% 
  filter(scottish_health_survey_indicator %in% bindicators)

# recode: ----

smoking_data_updated <- smoking_data_updated %>%
  mutate(scottish_health_survey_indicator = recode(
    scottish_health_survey_indicator,
    "Smoking status: Never smoked/Used to smoke occasionally" = "Never Smoked",
    "Smoking status: Used to smoke regularly" = "Used to Smoke",
    "E-cigarette use: Currently using" = "E-cigarette: Current User",
    "E-cigarette use: Ever previously used" = "E-cigarette: Previous User",
    "E-cigarette use: Never used" = "E-cigarette: Never Used",
    "Smoking status: Current smoker" = "Current Smoker")) %>% 
  mutate(smoke_ecig_flag = recode(
    scottish_health_survey_indicator,
    "Never Smoked" = "Cigarette",
    "Used to Smoke" = "Cigarette",
    "E-cigarette: Current User" = "E-cigarette",
    "E-cigarette: Previous User" = "Cigarette",
    "E-cigarette: Never Used" = "E-cigarette",
    "Current Smoker" = "E-cigarette"))





















