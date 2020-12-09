

source("ggplots/wellbeing_plot_updated.R")
source("ggplots/life_expectancy_plot.R") 
source("ggplots/life_satisfaction.R") 
source("cleaning_scripts/smoking_cleaning.R")


server <- function(input,output){
  
  output$life_satisfaction <- renderPlot({
    life_satisfaction_plot 
    
    if(input$sex) {
      ls <- life_satisfaction_plot + facet_wrap(~ sex) 
      ls }
    else{life_satisfaction_plot}
  })
  
  output$mental_wellbeing <- renderPlot({
    wellbeing_plot
    
    if(input$sex) {
      mw <- wellbeing_plot + facet_wrap(~ sex) 
      mw }
    else{wellbeing_plot}
  })
  
  output$life_expectancy <- renderPlot({
    life_expectancy_plot
  }) 
  
  output$smoking <- renderPlot({
    smoking_data %>% 
      filter(sex == "All",
             categories %in% input$smoking_indicator) %>% 
      ggplot(aes(x = year, y = percent, colour = categories)) +
      geom_point() +
      geom_line() +
      scale_x_continuous(breaks = c(2008, 2009, 2010, 2011, 2012, 2013,
                                    2014, 2015, 2016, 2017, 2018, 2019), limits = c(2010, 2019)) +
      scale_y_continuous(breaks = c(0, 10, 20, 30, 40, 50, 60, 70, 80, 90), 
                         limits = c(0, 90)) +
      labs(x = "Year", y = "Percent", title = "Smoking and E-cigarette Use", colour = " ") +
      theme_light()
    })
  
    

  
} # <--- closes server


