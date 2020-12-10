

source("ggplots/wellbeing_plot_updated.R")
source("ggplots/life_expectancy_plot.R") 
source("ggplots/life_satisfaction.R") 
source("cleaning_scripts/smoking_cleaning.R")
source("cleaning_scripts/map_data_prep.R")
source("ggplots/correlation_plot.R")

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
  
  output$smoking <- renderPlot({
    smoking_data_updated %>% 
      filter(sex == "All",
             scottish_health_survey_indicator %in% input$smoking_indicator) %>% 
      ggplot(aes(x = date_code, y = percent, colour = scottish_health_survey_indicator)) +
      geom_point(aes(shape = smoke_ecig_flag)) +
      geom_line() +
      scale_x_continuous(breaks = c(2008, 2009, 2010, 2011, 2012, 2013,
                                    2014, 2015, 2016, 2017, 2018, 2019), limits = c(2010, 2019)) +
      scale_y_continuous(breaks = c(0, 10, 20, 30, 40, 50, 60, 70, 80, 90), 
                         limits = c(0, 90)) +
      labs(x = "Year", 
           y = "Percentage of Adults", 
           title = "Smoking and E-cigarette Use", 
           colour = " ", 
           shape = " ") +
      theme_light() +
      theme(axis.text.x = element_text(angle = 90))
    }) 
  
  output$correlation <- renderPlot({
    correlation_plot
  })


  # Reactive Data for Map
    map_data <- eventReactive(input$map_update, {
      local_data_for_map %>% 
        filter(scottish_health_survey_indicator == input$mapindicator,
               sex == input$mapsex) %>%
        left_join(y = hb_borders, by = "feature_code") %>% 
        st_as_sf()
    })
  
    # Code for Map
    output$map <- renderPlot({
         
        ggplot(data = map_data(), aes(fill = percent)) +
        geom_sf() +
        scale_fill_steps(
          n.breaks = 6,
          high = "#132B43",
          low = "#56B1F7",
          space = "Lab",
          na.value = "grey50",
          guide = "coloursteps",
          aesthetics = "fill",
          labels = waiver(),
          show.limits = T) +
        labs(fill = paste("Percentage of", input$mapsex, "Adults"),
             x = NULL,
             y = NULL) +
        theme(axis.text = element_blank(),
              axis.ticks = element_blank(),
              panel.background = element_blank(),
              plot.margin = unit(c(-70,0,0,0),"mm"))
    },
    height = 800,
    width = 560)
    


  
} # <--- closes server


