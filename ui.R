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
                              selectInput(
                                          "indicator", label = "Select Indicator data", 
                                          choices = c("Life Satisfaction", 
                                                      "Mental Wellbeing", 
                                                      "Life Expectancy"), selected = 

                                            "Life Satisfaction"), 
                              conditionalPanel(condition = "input.indicator !== 'Life Expectancy'",
                                               checkboxInput("sex", label = "Break Down by Sex")) 
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
                 ),  # <--- closes general health tab panel
                 
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
                            
                              h3(strong("App Bio")), # <--- app bio
                              br(),
                              h4("This app has two main objectives; the first is to provide an 
                                 overview of Scottish public health and the second is to 
                                 provide an overview of the smoking and e-cigarette trend in Scotland."),
                              
                              br(),
                              hr(),
                              
                              h3(strong("User Guide")), # <--- user guide
                              br(),
                              h4("In order to use the app, the user navigates between
                                 the tabs located in the bar at the top of the app."),
                              br(),
                              h4(strong("General Health Tab")),
                              h4("This tab allows the user to view the general
                                 health trend across Scotland by selecting an indicator
                                 from the drop down menu. General Health has been
                                 operationalised using 'Life Satisfaction',
                                 'Mental Wellbeing' and 'Life Expectancy' as its
                                 indicators."),
                              h5(em("(Please note that 'Life Satisfaction' and 'Mental
                                 Wellbeing' indicators can be broken down by sex
                                 by selecting the tick box).")),
                              br(),
                              h4(strong("Scottish Smoking and E-cigarette Trend Tab")),
                              h4("This tab allows the user to view smoking and e-cigarette
                                 trends. The user can select one or multiple indicators,
                                 which will plot the results accordingly. Included within
                                 the indicator selections are 'Asthma' and 'Cardiovascular'
                                 trends."),
                              br(),
                              h4(strong("Scottish Smoking and E-cigarette Usage by Location Tab")),
                              h4("This tab allows the user to view smoking and e-cigarette
                                 trends across Scotland on a map. The user can select either
                                 'Smoking' or 'E-cigarette Use' and can also be filtered
                                 by sex. The results are then displayed on the map."),
                              
                              br(),
                              hr(),
                              
                              h3(strong("Indicators")), # <--- indicators
                              
                              br(),
                              h4(strong("Life Satisfaction")),
                              h4("Life satisfaction is measured by asking participants 
                                 to rate, on a scale of 0 to 10, how satisfied they are with their life in 
                                 general. On the scale, 0 represented 'extremely dissatisfied' and 10 
                                 'extremely satisfied' (the intervening scale points were numbered but not 
                                 labelled). There are no pre-defined cut-off points within the scale to 
                                 distinguish between different levels of satisfaction. However, a summary 
                                 measure was used which identified three groups of interest based on the 
                                 overall distribution of scores in the whole population: people with the 
                                 highest levels of satisfaction (scores of 9 or 10), people with an average 
                                 satisfaction level (score 8), and those with below average scores (0-7)."),
                              
                              br(),
                              
                              h4(strong("Mental Wellbeing")),
                              h4("Mental wellbeing is measured using the Warwick-Edinburgh Mental Wellbeing 
                              Scale (WEMWBS). The questionnaire consists of 14 positively worded items designed 
                              to assess: positive affect (optimism, cheerfulness, relaxation) and satisfying 
                              interpersonal relationships and positive functioning (energy, clear thinking, 
                              self-acceptance, personal development, mastery and autonomy). It is scored by 
                              summing the response to each item answered on a 1 to 5 Likert scale ('none of the 
                              time', 'rarely', 'some of the time', often', 'all of the time'). The total score 
                              ranges from 14 to 70 with higher scores indicating greater wellbeing."),
                              
                              br(),
                              
                              h4(strong("Smoking")),
                              h4("The 'Current smoker' category excludes those who reported only smoking cigars 
                                 or pipes."),
                              
                              br(),
                              
                              h4(strong("E-cigarette Use")),
                              h4("Information on the use of e-cigarettes was first collected in 2014. The wording 
                                 was amended slightly in 2016 to include 'vaping devices'."),
                              
                              br(),
                              
                              h4(strong("Cardiovascular Condition")),
                              h4("Cardiovascular conditions include ischaemic heart disease (heart attack or angina), 
                                 stroke, heart murmur, abnormal heart rhythm or 'other heart trouble'. Diabetes and 
                                 high blood pressure are excluded."),
                              
                              br(),
                              
                              h4("For additional information about the indicators, please refer to the 'SHeS Main 
                              Reports' in the 'Resources' section below"),
                              
                              br(),
                              hr(),
                              
                              h3(strong("Resources")), # <--- resources
                              br(),
                              
                              a(href = "https://statistics.gov.scot/home",
                                "Open Data from the Scottish Government"),
                              
                              br(),
                              
                              a(href = "https://www.gov.scot/publications/scotlands-public-health-priorities/", 
                                "Official Report of Scotland’s Public Health Priorities"),
                              
                              br(),
                              
                              a(href = "https://www.gov.scot/collections/scottish-health-survey/",
                                "SHeS Main Reports"),
                              
                              br(),
                              br(),
                              
                              
                            )
                          )  # <--- closes help and info tab panel
                 
                 
) # <--- closes navbar page









