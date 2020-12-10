library(tidyverse)
library(sf)
library(rgdal)
library(rmapshaper)

chunks <- readOGR(dsn = "data/SG_NHS_HealthBoards_2019", layer = "SG_NHS_HealthBoards_2019")

good_chunks <- st_as_sf(chunks)

hb_borders <- ms_simplify(good_chunks) %>% 
  select(HBCode, HBName, geometry) %>% 
  rename("feature_code" = "HBCode")

hbcodes <- unique(hb_borders$feature_code)

source("cleaning_scripts/part2_data_cleaning.R")

local_data_for_map <- local_scotland_part2_cleaned %>% 
  select(-upper_confidence_limit_95_percent, -lower_confidence_limit_95_percent, -units) %>% 
  mutate(scottish_health_survey_indicator = recode(
    scottish_health_survey_indicator,
    "Smoking status: Current smoker" = "Currently Smoking",
    "E-cigarette use: Currently using" = "Currently using E-cigarette")) %>% 
  filter(scottish_health_survey_indicator %in% c("Currently Smoking", "Currently using E-cigarette"),
         feature_code %in% hbcodes,
         date_code == "2016-2019")




 rm(chunks, good_chunks, local_scotland_part2_cleaned)











