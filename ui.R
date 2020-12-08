

library(shiny)
library(shinydashboard) 
library(shinythemes)
library(shinyWidgets)

ui <- navbarPage("Scottish Health", theme = shinytheme("flatly"), 
                 tabPanel("General Health",
                          sidebarLayout(
                            sidebarPanel(
                              br(), 
                              br(), 
                              br(), 
                              br(), 
                              selectInput("indicator", label = "Select Indicator", 
                                          choices = c("Life Satisfaction", 
                                                      "Mental Wellbeing", 
                                                      "Life Expectancy"), selected = 
                                            "Life Satisfaction"),
                              conditionalPanel(condition = "input.indicator != 'Life Expectancy'",
                                               checkboxInput("sex", label = "Break Down by Sex"))
                            ),
                            
                            mainPanel(
                              h2("General Health Questionnare, Mental Wellbeing 
                                 and Life Satisfaction"),
                              
                              conditionalPanel(condition = "input.indicator == 'Life Satisfaction'",
                                               plotOutput(outputId = "life_satisfaction")),
                              conditionalPanel(condition = "input.indicator == 'Mental Wellbeing'",
                                               plotOutput(outputId = "mental_wellbeing")),
                              conditionalPanel(condition = "input.indicator == 'Life Expectancy'",
                                               plotOutput(outputId = "life_expectancy"))
                              
                            )
                          )
                 ), # <--- closes general health tab panel
                 
                 # smoking trend tab:
                 
                 tabPanel("Scottish Smoking and E-cigarette Trend", 
                          sidebarLayout(
                            sidebarPanel(
                              
                              h2("Changes in smoking and E-cigarette Usage over time"),
                              
                              br(),
                              br(),
                              
                              pickerInput("smoking_indicator", 
                                          (h4("Select Indictaor")),
                                          choices = c("Current Smoker", "Used to Smoke", "Never Smoked", 
                                                      "E-cigarette: Current User", "E-cigarette: Previous User",
                                                      "E-cigarette: Never Used"),
                              options = list(`actions-box` = TRUE),
                              multiple = T,
                              width = NULL,
                              ),
                              
                              br(),
                              
                              actionButton("update", (h4("Update"))),
                              
                            
                            ), # <--- closes sidebar panel
                            
                            
                          
                            mainPanel(
                              
                              plotOutput(outputId = "smoking")
                              
                            ) # <--- closes main panel
                            
                          ), # <--- closes sidebar layout 
                          
                 ), # <--- closes smoking trend tab panel
                 
                 
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
                 ), # <--- closes smoking map tab panel
                 
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
                 ) # <--- closes help and info tab panel
                 
) # <--- closes navbar page







