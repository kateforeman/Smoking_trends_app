library(shiny)
library(shinydashboard) 
library(shinythemes)

ui <- navbarPage("Scottish Health", theme = shinytheme("flatly"), 
                 tabPanel("Welcome Page",
                          sidebarLayout(
                            sidebarPanel(
                              h3("Scottish Health App")
                            ),
                            mainPanel(
                              h2("Welcome to the Scottish Health App - 
                                 Link resources below")
                            )
                          )
                 ), 
                 tabPanel("General Health",
                          sidebarLayout(
                            sidebarPanel(
                              h3("A brief introduction to the data e.g. 
                                 the mental wellbeing scale")
                            ),
                            mainPanel(
                              h2("General Health Questionnare, Mental Wellbeing 
                                 and Life Satisfaction")
                            )
                          )
                 ), 
                 tabPanel("Scottish Smoking and E-cigarette Trend", 
                          sidebarLayout(
                            sidebarPanel(
                              h3("Brief introduction to the data")
                            ), 
                            mainPanel(
                              h2("Changes in smoking and E-cigarette Usage over time")
                            )
                          )
                 ), 
                 tabPanel("Smoking and E-cigarette Usage by Location",
                          sidebarLayout(
                            sidebarPanel(
                              h3("Brief introduction to the data e.g. SIMD overview")
                            ),
                            mainPanel(
                              h2("A breakdown of smoking and e-cigarette usage 
                                 by region and SIMD in Scotland")
                            )
                          )
                 ) 
) 