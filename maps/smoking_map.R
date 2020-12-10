
filterData <- function(input, data){
  reactive(
    data %>% 
      
  )
}







createMap <- function(input, data) {
  renderPlot({
    
    data() %>% 
    ggplot(data = working_map_smoking, aes(fill = percent)) +
    geom_sf() +
    scale_fill_steps(
      n.breaks = 6,
      high = "#132B43",
      low = "#56B1F7",
      space = "Lab",
      na.value = "grey50",
      guide = "coloursteps",
      aesthetics = "fill",
      labels = waiver()
    )
  })    
}


