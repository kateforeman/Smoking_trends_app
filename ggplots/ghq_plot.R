library(lubridate)
library(tidyverse)

ghq_indicators <- c("General health questionnaire (GHQ-12): Score 1-3", 
                    "General health questionnaire (GHQ-12): Score 4+",
                    "General health questionnaire (GHQ-12): Score 0")



scotland_survey_cleaned %>%
  filter(scottish_health_survey_indicator == ghq_indicators,
         sex == "All") %>% 
  mutate(scottish_health_survey_indicator = recode(scottish_health_survey_indicator,
                                                   "General health questionnaire (GHQ-12): Score 0" = "0",
                                                   "General health questionnaire (GHQ-12): Score 1-3" = "1-3",
                                                   "General health questionnaire (GHQ-12): Score 4+" = "4+")) %>%
  mutate(date_code = paste(date_code,"01", "01", sep = "-")) %>% 
  mutate(date_code = ymd(date_code)) %>% 
  ggplot() +
  aes(x = date_code, y = percent, colour = scottish_health_survey_indicator) +
  geom_line() +
  geom_ribbon(aes(ymin=lower_confidence_limit_95_percent,
                  ymax=upper_confidence_limit_95_percent), linetype=2, alpha=0.1) +
  labs(colour = "GHQ Score",
       x = "Year",
       y = "Percentage of Adults")
  