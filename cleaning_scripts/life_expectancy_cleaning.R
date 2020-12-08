library(tidyverse)
library(janitor)

life_expectancy <- read_csv("data/life_expectancy.csv") %>% 
  clean_names()

life_expectancy_cleaning <- life_expectancy %>% 
  mutate(date_code = str_remove_all(date_code, "[0-9]+-")) %>% 
  filter(age == "0 years",
         simd_quintiles == "All",
         urban_rural_classification == "All",
         feature_code == "S92000003") %>% 
  select(-units, -age, -simd_quintiles, -urban_rural_classification, -feature_code) %>% 
  pivot_wider(names_from = measurement, values_from = value) %>% 
  rename("count_years" = "Count",
         "upper_confidence_limit_95_percent" = "95% Upper Confidence Limit",
         "lower_confidence_limit_95_percent" = "95% Lower Confidence Limit")

life_expectancy_cleaned <- life_expectancy_cleaning

rm(life_expectancy, life_expectancy_cleaning)



