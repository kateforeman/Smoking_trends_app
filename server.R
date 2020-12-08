

source("ggplots/wellbeing_plot_updated.R")

server <- function(input,output){
  output$plot <- renderPlot({
    wellbeing_plot
  })
}



