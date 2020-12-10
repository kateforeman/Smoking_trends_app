
library(tidyverse) 
library(janitor) 
library(ggplot2)
source("cleaning_scripts/part1_cleaning.R")



life_satisfaction <- scotland_survey_cleaned %>% 
  select(date_code, scottish_health_survey_indicator, sex, percent, lower_confidence_limit_95_percent, upper_confidence_limit_95_percent) %>% 
  filter(scottish_health_survey_indicator %in% c("Life satisfaction: Above the mode (9 to 10-Extremely satisfied)", "Life satisfaction: Below the mode (0-Extremely dissatisfied to 7)","Life satisfaction: Mode (8)")) 

life_satisfaction_rename <- life_satisfaction %>% 
  mutate(life_satisfaction, scottish_health_survey_indicator = recode(scottish_health_survey_indicator,
                                                                      "Life satisfaction: Above the mode (9 to 10-Extremely satisfied)" = "Above the mode (≥9)","Life satisfaction: Below the mode (0-Extremely dissatisfied to 7)" = "Below the mode (≤7)","Life satisfaction: Mode (8)" = "The mode (8)"
                                                                      
                                                                      ))


life_satisfaction_plot_all <- life_satisfaction_rename %>% 
  filter(sex == "Female") %>% 
  ggplot(aes(date_code, percent, colour = scottish_health_survey_indicator, group = scottish_health_survey_indicator)) + 
  geom_line() + 
  geom_point()+
  scale_x_continuous(breaks = c(2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019))+
  labs(x = "Year", y = "Percentage of Adults", title = "Life Satisfaction", colour = "Life satisfaction Indicator") +
  theme_light()+ 
  scale_colour_manual(
    values = c(
      "Above the mode (≥9)" = "Green",
      "Below the mode (≤7)" = "Red",
      "The mode (8)" = "Blue"
    )) +
  theme(axis.text.x = element_text(angle = 90))


life_satisfaction_plot <- life_satisfaction_rename %>% 
  ggplot(aes(date_code, percent, colour = scottish_health_survey_indicator, group = scottish_health_survey_indicator)) + 
  geom_line() + 
  geom_point()+
  scale_x_continuous(breaks = c(2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019))+
  labs(x = "Year", y = "Percentage of Adults", title = "Life Satisfaction", colour = "Life satisfaction Indicator") +
  theme_light()+
  scale_colour_manual(
    values = c(
      "Above the mode (≥9)" = "Green",
      "Below the mode (≤7)" = "Red",
      "The mode (8)" = "Blue"
    )) +
  theme(axis.text.x = element_text(angle = 90))




