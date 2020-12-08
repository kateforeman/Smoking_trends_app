
# load in library: ----

library(tidyverse)
library(janitor)

# load in data: ----

smoking_data <- read_csv("data/smoking_by_sex.csv") %>% 
  clean_names()

# arrange by year: ----

smoking_data <- smoking_data %>% 
  arrange(year)

# recode: ----


smoking_data <- smoking_data %>%
  mutate(smoking_data, categories = recode(
    categories, "Never smoked/Used to smoke occasionally" = "Never Smoked",
    "Used to smoke regularly" = "Used to Smoke",
    "Current smoker" = "Current Smoker",
    "Currently using" = "E-cigarette: Current User",
    "Ever previously used" = "E-cigarette: Previous User",
    "Never used" = "E-cigarette: Never Used")
    )
















