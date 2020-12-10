
# source in cleaned data: ----

source("cleaning_scripts/smoking_cleaning.R")


# make a plot for smoking and e-cigarette use: ----


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
  theme_light() +
  theme(axis.text.x = element_text(angle = 90))





# make a plot for smoking only: ----

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
  theme_light() +
  theme(axis.text.x = element_text(angle = 90))




# make a plot for e-cigarette use only: ----


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
  theme_light() +
  theme(axis.text.x = element_text(angle = 90))



# end ----






