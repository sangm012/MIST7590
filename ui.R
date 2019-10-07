#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

source('simulationMBT.R',local=FALSE)
source('parameters.R', local = FALSE)
source('prepare.R', local = FALSE)
source('simulationMBT.R',local=FALSE)

source('report.R', echo = T)


# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("LAMP - Solar Data Calculator"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            numericInput("LEDcost",
                        "LED Cost:",
                        value = LEDCost),
    
        numericInput("LEDlife",
                       "LED Life:",
                       value = LEDLife),
        
       sliderInput("bins",label = "Choose a number", value = 25, min = 1, max = 300),
       sliderInput("bins",label = "More Example", value = 25, min = 1, max = 300)
       
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("scatterPlot"),
            verbatimTextOutput("report"),
            verbatimTextOutput("avg_annual_income"),
            verbatimTextOutput("avg_annual_savings_adaptive_led"),
            verbatimTextOutput("avg_annual_kw"),
            verbatimTextOutput("avg_hrs_daily_per_led"),
            verbatimTextOutput("avg_annual_cost_per_led"),
            verbatimTextOutput("avg_led_wattage"),
            verbatimTextOutput("roi")
            
        )
    )
))
