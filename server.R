source("ggplots/wellbeing_plot_updated.R")
source("ggplots/life_expectancy_plot.R") 
source("ggplots/life_satisfaction.R") 

server <- function(input,output){
  output$plot <- renderPlot({
    wellbeing_plot
  })
}



