#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  
  #source('parameters.R', local = FALSE)
  #source('prepare.R', local = FALSE)
  #source('simulationMBT.R',local=FALSE)
  
  #source('report.R', echo = T)
  
  
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'red', border = 'white',main="Example Title",ylab="Example",xlab="Example")
    
  })
  
  
  output$scatterPlot <- renderPlot({
    
    ggplot(temp, aes(day, cost)) +geom_point(color = 'darkgreen') +labs(y = 'Cost', x = 'Day of year') + ylim (0,1)
    
  })
  
  output$report <- renderText({paste("******************************REPORT******************************")}
  )
  
  output$avg_annual_income <- renderText({paste('Average annual cost: $', round(model_cost,2))}
  )
  
  output$avg_annual_savings_adaptive_led <- renderText({paste('Average annual saving of adaptive LEDs: ', round(savings,2))}
  )
  
  output$avg_annual_kw <- renderText({paste('Average annual kw: ', round(sum(es$kw)/years*LEDs,2))}
  )
  
  output$avg_hrs_daily_per_led <- renderText({paste('Average hours per day each LED on: ', round(sum(es$LEDon)/measures_hour/365/years,2))}
  )
  
  output$avg_annual_cost_per_led <- renderText({paste('Average annual cost per LED: ', round(sum(es$kwCost)/years,2))}
  )
  
  output$avg_led_wattage <- renderText({paste('Average LED wattage: ', round(mean(es$kw),2))}
  )
  
  
  output$roi <- renderText({paste('ROI: ',round(mean(effRate*100),2),'%')}
  )
  
  
  
  
  
  
})