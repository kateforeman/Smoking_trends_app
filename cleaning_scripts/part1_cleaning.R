library(tidyverse)
library(janitor)

scotland_survey <- read_csv("data/scotland_overall_survey.csv") %>% 
  clean_names()

indicators <- c("Life satisfaction: Above the mode (9 to 10-Extremely satisfied)", 
                "Life satisfaction: Below the mode (0-Extremely dissatisfied to 7)", 
                "Life satisfaction: Mode (8)", 
                "Mental wellbeing", 
                "General health questionnaire (GHQ-12): Score 0", 
                "General health questionnaire (GHQ-12): Score 1-3",
                "General health questionnaire (GHQ-12): Score 4+")

scotland_survey_cleaning <- scotland_survey %>% 
  filter(scottish_health_survey_indicator %in% indicators)

scotland_survey_cleaning <- scotland_survey_cleaning %>% 
  pivot_wider(names_from = measurement, values_from = value) %>% 
  clean_names()

scotland_survey_cleaned <- scotland_survey_cleaning %>% 
  rename(upper_confidence_limit_95_percent = x95_percent_upper_confidence_limit,
         lower_confidence_limit_95_percent = x95_percent_lower_confidence_limit)

rm(scotland_survey, scotland_survey_cleaning) 

life_satisfaction <- scotland_survey_cleaned %>% 
  select(date_code, scottish_health_survey_indicator, sex, percent) %>% 
  filter(scottish_health_survey_indicator == "Life satisfaction: Above the mode (9 to 10-Extremely satisfied" 
         | scottish_health_survey_indicator == "Life satisfaction: Below the mode (0-Extremely dissatisfied to 7)" 
         | scottish_health_survey_indicator == "Life satisfaction: Mode (8)")  

