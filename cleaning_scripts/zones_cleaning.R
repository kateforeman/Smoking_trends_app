library(tidyverse)
library(janitor)
library(readxl)

zones <- read_xlsx("data/zones.xlsx", sheet = 3)

zones_cleaning <- zones %>% 
  select(DZ, DZname, SIMD16_Rank, SIMD16_Quintile)

zones2 <- read_xlsx("data/simd ranks.xlsx")
zones3 <- read_xlsx("data/simd ranks.xlsx", sheet = 2)
