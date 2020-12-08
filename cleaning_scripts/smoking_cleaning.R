
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

 
# make a plot for smoking and e-cigarette use

smoking_ecigarette_use_data_plot <- smoking_data %>% 
  filter(sex == "All") %>% 
  ggplot(aes(x = year, y = percent, colour = categories)) +
  geom_point() +
  geom_line() +
  scale_x_continuous(breaks = c(2008, 2009, 2010, 2011, 2012, 2013,
                                2014, 2015, 2016, 2017, 2018, 2019), limits = c(2010, 2019)) +
  scale_y_continuous(breaks = c(0, 10, 20, 30, 40, 50, 60, 70, 80, 90), 
                     limits = c(0, 90)) +
  labs(x = "Year", y = "Percent", title = "Smoking and E-cigarette Use", colour = " ") +
  theme_light() 

smoking_ecigarette_use_data_plot


# make a plot for smoking only

smoking_data_plot <- smoking_data %>% 
  filter(sex == "All") %>% 
  filter(indicator == "Smoking status") %>% 
  ggplot(aes(x = year, y = percent, colour = categories)) +
  geom_point() +
  geom_line() +
  scale_x_continuous(breaks = c(2008, 2009, 2010, 2011, 2012, 2013,
                                2014, 2015, 2016, 2017, 2018, 2019), limits = c(2010, 2019)) +
  scale_y_continuous(breaks = c(0, 10, 20, 30, 40, 50, 60, 70, 80, 90), 
                     limits = c(0, 90)) +
  labs(x = "Year", y = "Percent", title = "Smoking Status", colour = " ") +
  theme_light() 

smoking_data_plot

# make a plot for e-cigarette use only

e_cigarette_use_data_plot <- smoking_data %>% 
  filter(sex == "All") %>% 
  filter(indicator == "E-cigarette use") %>% 
  ggplot(aes(x = year, y = percent, colour = categories)) +
  geom_point() +
  geom_line() +
  scale_x_continuous(breaks = c(2008, 2009, 2010, 2011, 2012, 2013,
                                2014, 2015, 2016, 2017, 2018, 2019), limits = c(2010, 2019)) +
  scale_y_continuous(breaks = c(0, 10, 20, 30, 40, 50, 60, 70, 80, 90), 
                     limits = c(0, 90)) +
  labs(x = "Year", y = "Percent", title = "E-cigarette Use", colour = " ") +
  theme_light() 

e_cigarette_use_data_plot
















