

source("ggplots/wellbeing_plot_updated.R")
source("ggplots/life_expectancy_plot.R") 
source("ggplots/life_satisfaction.R") 

server <- function(input,output){
  output$life_satisfaction <- renderPlot({
    life_satisfaction_plot_all 
    
    if(input$sex) {
      ls <- life_satisfaction_plot + facet_wrap(~ sex) 
    ls }
    else{life_satisfaction_plot_all}
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
  
}



