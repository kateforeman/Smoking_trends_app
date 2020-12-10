source("cleaning_scripts/life_expectancy_cleaning.R")

life_expectancy_plot <- life_expectancy_cleaned %>% 
  ggplot(aes(x = date_code, y = count_years, colour = sex, group = sex)) +
  geom_point(aes(x = date_code, y = count_years, colour = sex))+
  geom_line()+
  labs(x = "Year", y = "Count Years", title = "Life Expectancy") +
  theme_light()+
  scale_colour_manual(
    values = c(
      "Male" = "Blue",
      "Female" = "Green"
    )
  )

  





