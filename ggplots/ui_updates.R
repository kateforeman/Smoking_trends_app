

library(shiny)
library(shinydashboard) 
library(shinythemes)

ui <- navbarPage("Scottish Health", theme = shinytheme("flatly"), 
                 tabPanel("General Health",
                          sidebarLayout(
                            sidebarPanel(
                              br(), 
                              br(),
                              selectInput(
                                          "indicator", label = "Select Indicator data", 
                                          choices = c("Life Satisfaction", 
                                                      "Mental Wellbeing", 
                                                      "Life Expectancy"), selected = 
                                            "Life Satisfaction")
                            ),
                            mainPanel(
                              h2("Life Satisfaction, Mental Wellbeing 
                                 and Life Expectancy"),
                              conditionalPanel(condition = "input.indicator == 'Life Satisfaction'",
                                               plotOutput(outputId = "life_satisfaction")),
                              conditionalPanel(condition = "input.indicator == 'Mental Wellbeing'",
                                               plotOutput(outputId = "mental_wellbeing")),
                              conditionalPanel(condition = "input.indicator == 'Life Expectancy'",
                                               plotOutput(outputId = "life_expectancy"))
                              
                              
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
                 ), 
                 tabPanel("Help and Information",
                          sidebarLayout(
                            sidebarPanel(
                              h3("Scottish Health App")
                            ),
                            mainPanel(
                              h2("Welcome to the Scottish Health App - 
                                 Link resources below")
                            )
                          )
                 )
) 







