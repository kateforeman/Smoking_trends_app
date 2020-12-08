library(tidyverse)
library(sf)
library(rgdal)
library(rmapshaper)

chunks <- readOGR(dsn = "data/SG_NHS_HealthBoards_2019", layer = "SG_NHS_HealthBoards_2019")

good_chunks <- st_as_sf(chunks)


class(good_chunks)

gooder_chunks <- ms_simplify(good_chunks)

class(gooder_chunks)

plot(gooder_chunks)


gooder_chunks %>% 
  select(HBCode, HBName, geometry) %>% 
  plot()



