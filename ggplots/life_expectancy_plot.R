source("life_expectancy_cleaning.R")

life_expectancy_cleaned %>% 
  ggplot() +
  aes(x = date_code, y = count_years) +
  geom_line(aes(group = sex, colour = sex)) +
  theme(axis.text.x = element_text(angle = 90))
