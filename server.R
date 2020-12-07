

server <- function(input,output){
  output$plot <- renderPlot({
    wellbeing %>% 
      ggplot(aes(x = date_code, y = mean, colour = sex)) +
      geom_point() +
      scale_x_continuous(breaks = c(2008, 2009, 2010, 2011, 2012, 2013,
                                    2014, 2015, 2016, 2017, 2018, 2019), limits = c(2010, 2019)) +
      scale_y_continuous(limits = c(49.0,51)) +
      geom_line() +
      labs(x = "Year", y = "WEMWBS Score", title = "Mental Wellbeing") +
      theme_light() 
  })
}



