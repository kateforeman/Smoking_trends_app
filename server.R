

source("ggplots/wellbeing_plot_updated.R")
source("ggplots/life_expectancy_plot.R") 
source("ggplots/life_satisfaction.R") 

server <- function(input,output){
  output$life_satisfaction <- renderPlot({
    life_satisfaction_plot
  })
  
  output$mental_wellbeing <- renderPlot({
    wellbeing_plot
  })
  
  output$life_expectancy <- renderPlot({
    life_expectancy_plot
  })
}



