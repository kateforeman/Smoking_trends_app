library(tidyverse) 

library(ggpubr) 

library(janitor) 

local <- read_csv("data/scottish_survey_local.csv") %>% 
  clean_names()



local_filtered <- local %>% 
  select(-units, feature_code) %>%
  filter(scottish_health_survey_indicator %in% 
           c("Any cardiovascular condition: Has a cardiovascular condition", 
              "Smoking status: Current smoker")) %>% 
  filter(measurement == "Percent") 



local_filtered_pivot <- local_filtered %>% 
  pivot_wider(names_from = scottish_health_survey_indicator, 
              values_from = value) %>% 
  drop_na() %>% 
  clean_names() 

library(ggpubr) 

correlation_plot <- ggscatter(local_filtered_pivot,
          x = "smoking_status_current_smoker", 
          y = "any_cardiovascular_condition_has_a_cardiovascular_condition", 
          add = "reg.line", 
          conf.int = TRUE, 
          cor.coef = TRUE, 
          cor.method = "pearson", 
          xlab = "Percentage of smokers", 
          ylab = "Percentage of those with a cardiovascular condition")  
class(correlation_plot) 
