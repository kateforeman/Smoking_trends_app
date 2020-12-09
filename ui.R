

library(shiny)
library(shinydashboard) 
library(shinythemes)
library(shinyWidgets)

indicator_choices <- c("Never Smoked", "Used to Smoke", "Current Smoker", 
                       "E-cigarette: Current User", "E-cigarette: Previous User", 
                       "E-cigarette: Never Used", "Asthmatic",
                       "Non-asthmatic", "Cardiovascular Condition: Yes",
                       "Cardiovascular Condition: No")


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
                              
                              h2("Changes in smoking and e-cigarette usage over time"),
                              
                              br(),
                              br(),
                              
                              pickerInput(inputId = "smoking_indicator", 
                                          (h4("Select Indictaor")),
                                          choices = indicator_choices,
                              options = list(`actions-box` = TRUE),
                              multiple = T,
                              width = NULL,
                              ),
                              
                              br(),
                              
                              #actionButton("update", (h4("Update"))),
                              
                            
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
                          
                          mainPanel(
                              
                              h3("User Guide"), # <--- user guide
                              br(),
                              h4("In order to use the app, the user navigates between
                                 the tabs located in the bar at the top of the app."),
                              br(),
                              h4("General Health Tab"),
                              h4("This tab allows the user to view the general
                                 health trend across Scotland, by selecting an indicator
                                 from the drop down menu."),
                              h5("Please note that 'Life Satisfaction' and 'Mental
                                 Wellbeing' indicators can be broken down by sex
                                 by selecting the tick box."),
                              br(),
                              h4("Scottish Smoking and E-cigarette Trend Tab"),
                              h4("This tab allows the user to view smoking and e-cigarette
                                 trends. The user can select one or multiple indicators,
                                 which will plot the results accordingly. Included within
                                 the indicator selections are 'Asthma' and 'Cardiovascular'
                                 trends."),
                              br(),
                              h4("Scottish Smoking and E-cigarette Usage by Location Tab"),
                              h4("This tab allows the user to view smoking and e-cigarette
                                 trends across Scotland on a map. The user can select either
                                 'Smoking' or 'E-cigarette Use' and can also be filtered
                                 by sex. The results are then displayed on the map."),
                              hr(),
                              
                              h3("App Bio"), # <--- app bio
                              br(),
                              h4("This app has two main objectives; the first is to provide 
                              an overview of Scottish public health and the second is to 
                              provide an overview of the smoking and e-cigarette trend in Scotland."),
                              
                              br(),
                              
                              h4("General Health has incorporated three factors: 'Life Statisfaction',
                                 'Mental Wellbeing' and 'Life Expectancy'."),
                                 
                              
                              hr(),
                              
                              h3("Resources"), # <--- user guide
                              br(),
                              
                              a(href = "https://statistics.gov.scot/home",
                                "Open Data from the Scottish Government"),
                              
                              br(),
                              
                              a(href = "https://www.gov.scot/publications/scotlands-public-health-priorities/", 
                                "Official Report of Scotland’s Public Health Priorities"),
                              
                              br(),
                              hr(),
                              
                            )
                          )  # <--- closes help and info tab panel
                 
                 
) # <--- closes navbar page









