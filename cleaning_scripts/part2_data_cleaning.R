library(tidyverse)
library(janitor)

overall_scotland_part2 <- read_csv("data/scotland_overall_survey.csv") %>% 
  clean_names()

indicators_part2 <- c("Smoking status: Never smoked/Used to smoke occasionally", 
                      "Smoking status: Used to smoke regularly",
                      "Smoking status: Current smoker",
                      "E-cigarette use: Ever previously used",
                      "E-cigarette use: Never used",
                      "E-cigarette use: Currently using",
                      "Doctor-diagnosed asthma: No",
                      "Doctor-diagnosed asthma: Yes",
                      "Any cardiovascular condition: Has a cardiovascular condition",
                      "Any cardiovascular condition: No cardiovascular condition")

overall_scotland_part2_cleaning <- overall_scotland_part2 %>% 
  filter(scottish_health_survey_indicator %in% indicators_part2)

overall_scotland_part2_cleaning <- overall_scotland_part2_cleaning %>% 
  pivot_wider(names_from = measurement, values_from = value) %>% 
  clean_names()

overall_scotland_part2_cleaned <- overall_scotland_part2_cleaning %>% 
  rename(upper_confidence_limit_95_percent = x95_percent_upper_confidence_limit,
         lower_confidence_limit_95_percent = x95_percent_lower_confidence_limit)

rm(overall_scotland_part2, overall_scotland_part2_cleaning)


local_scotland_part2 <- read_csv("data/scottish_survey_local.csv") %>% 
  clean_names()

local_scotland_part2_cleaning <- local_scotland_part2 %>% 
  filter(scottish_health_survey_indicator %in% indicators_part2)

local_scotland_part2_cleaning <- local_scotland_part2_cleaning %>% 
  pivot_wider(names_from = measurement, values_from = value) %>% 
  clean_names()

local_scotland_part2_cleaned <- local_scotland_part2_cleaning %>% 
  rename(upper_confidence_limit_95_percent = x95_percent_upper_confidence_limit,
         lower_confidence_limit_95_percent = x95_percent_lower_confidence_limit)

rm(local_scotland_part2, local_scotland_part2_cleaning)