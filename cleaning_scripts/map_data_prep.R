library(tidyverse)
library(sf)
library(rgdal)
library(rmapshaper)

chunks <- readOGR(dsn = "data/SG_NHS_HealthBoards_2019", layer = "SG_NHS_HealthBoards_2019")

good_chunks <- st_as_sf(chunks)

gooder_chunks <- ms_simplify(good_chunks) %>% 
  select(HBCode, HBName, geometry) %>% 
  rename("feature_code" = "HBCode")

source("cleaning_scripts/part2_data_cleaning.R")

hbcodes <- unique(gooder_chunks$HBCode)

names(gooder_chunks)
unique(local_scotland_part2_cleaned$scottish_health_survey_indicator)

working_map_smoking <- local_scotland_part2_cleaned %>% 
  select(-upper_confidence_limit_95_percent, -lower_confidence_limit_95_percent, -units) %>% 
  filter(feature_code %in% hbcodes,
         date_code == "2016-2019",
         scottish_health_survey_indicator == "Smoking status: Current smoker",
         sex == "All") %>% 
  left_join(y = gooder_chunks, by = "feature_code") %>% 
  st_as_sf()


ggplot(data = working_map_smoking, aes(fill = percent)) +
  geom_sf()








