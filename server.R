#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shinythemes)
library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  
  #source('parameters.R', local = FALSE)
  #source('prepare.R', local = FALSE)
  #source('simulationMBT.R',local=FALSE)
  
  #source('report.R', echo = T)
  
  
  # output$distPlot <- renderPlot({
  #   
  #   # generate bins based on input$bins from ui.R
  #   x    <- faithful[, 2]
  #   bins <- seq(min(x), max(x), length.out = input$bins + 1)
  # 
  #   # draw the histogram with the specified number of bins
  #   hist(x, breaks = bins, col = 'red', border = 'white',main="Example Title",ylab="Example",xlab="Example")
  # 
  # })
  # 

  
  lettuce  <- 1
  squash  <- 1.3
  cucumber  <- 1.6
  
  
  
  a  <- lettuce
  b  <- squash
  c  <- cucumber
  
  x  <- 1
  
  
  
  output$scatterPlot <- renderPlot({
    
    if (input$vegetable == "1"){
      
      
      ggplot(temp, aes(day, cost)) +geom_point(color = 'red') +labs(y = 'Cost', x = 'Day of year') + ylim (0,1)
              
    
    }
    
    else if(input$vegetable == "2") {
      
      
      temp <- es %>% group_by(day = yday(TimeStamp)) %>% 
        summarize(cost = mean(kwCost)*24*measures_hour*b) %>% 
        filter(row_number() < 366) # discard extra day from graph
      
      
      
      ggplot(temp, aes(day, cost)) +geom_point(color = 'green') +labs(y = 'Cost', x = 'Day of year') + ylim (0,1)
      
      
    }
    else if(input$vegetable == "3") {
      
      
      temp <- es %>% group_by(day = yday(TimeStamp)) %>% 
        summarize(cost = mean(kwCost)*24*measures_hour*c) %>% 
        filter(row_number() < 366) # discard extra day from graph
      
      
    
      
      ggplot(temp, aes(day, cost)) +geom_point(color = 'blue') +labs(y = 'Cost', x = 'Day of year') + ylim (0,1)
      
    }
    
    
    # ggplot(temp, aes(day, cost)) +geom_point(color = 'red') +labs(y = 'Cost', x = 'Day of year') + ylim (0,1)
    
  })
  
  
  
  
  
  
  
  
  
  
  
  output$report <- renderText({paste("******************************REPORT******************************")}
  )
  
  output$avg_annual_income <- renderText({
    
    if (input$vegetable == "1"){
      
      paste('Average annual cost: $', round(model_cost*a,2))
    }
    
    else if(input$vegetable == "2") {
      paste('Average annual cost: $', round(model_cost*b,2))
      
    }
    else if(input$vegetable == "3") {
      paste('Average annual cost: $', round(model_cost*c,2))
      
    }
    
    
    # paste('Average annual cost: $', round(model_cost,2)
          
          })
                                         
  
  
  output$avg_annual_savings_adaptive_led <- renderText({
    
    
    if (input$vegetable == "1"){
      
      paste('Average annual saving of adaptive LEDs: ', round(savings*a,2))
    }
    
    else if(input$vegetable == "2") {
      paste('Average annual saving of adaptive LEDs: ', round(savings*b,2))
      
    }
    else if(input$vegetable == "3") {
      paste('Average annual saving of adaptive LEDs: ', round(savings*c,2))
      
    }
    
    
    # paste('Average annual saving of adaptive LEDs: ', round(savings,2))
    
  }
  )
  
  output$avg_annual_kw <- renderText({
    
    
    
    
    if (input$vegetable == "1"){
      
      paste('Average annual kw: ', round(sum(es$kw*a)/years*LEDs,2))
    }
    
    else if(input$vegetable == "2") {
      paste('Average annual kw: ', round(sum(es$kw*b)/years*LEDs,2))
      
    }
    else if(input$vegetable == "3") {
      paste('Average annual kw: ', round(sum(es$kw*c)/years*LEDs,2))
      
    }
    
    # paste('Average annual kw: ', round(sum(es$kw)/years*LEDs,2))
    
    }
  )
  
  output$avg_hrs_daily_per_led <- renderText({
    
    
    if (input$vegetable == "1"){
      
      paste('Average hours per day each LED on: ', round(sum(es$LEDon*a)/measures_hour/365/years,2))
    }
    
    else if(input$vegetable == "2") {
      paste('Average hours per day each LED on: ', round(sum(es$LEDon*b)/measures_hour/365/years,2))
      
    }
    else if(input$vegetable == "3") {
      paste('Average hours per day each LED on: ', round(sum(es$LEDon*c)/measures_hour/365/years,2))
      
    }
    
    # paste('Average hours per day each LED on: ', round(sum(es$LEDon)/measures_hour/365/years,2))
    
    }
  )
  
  output$avg_annual_cost_per_led <- renderText({
    
    
    if (input$vegetable == "1"){
      
      paste('Average annual cost per LED: ', round(sum(es$kwCost*a)/years,2))
    }
    
    else if(input$vegetable == "2") {
      paste('Average annual cost per LED: ', round(sum(es$kwCost*b)/years,2))
      
    }
    else if(input$vegetable == "3") {
      paste('Average annual cost per LED: ', round(sum(es$kwCost*c)/years,2))
      
    }
    # paste('Average annual cost per LED: ', round(sum(es$kwCost)/years,2))
    }
  )
  
  output$avg_led_wattage <- renderText({
    
    if (input$vegetable == "1"){
      
      paste('Average LED wattage: ', round(mean(es$kw*a),2))
    }
    
    else if(input$vegetable == "2") {
      paste('Average LED wattage: ', round(mean(es$kw*b),2))
      
    }
    else if(input$vegetable == "3") {
      paste('Average LED wattage: ', round(mean(es$kw*c),2))
      
    }
    # paste('Average LED wattage: ', round(mean(es$kw),2))
    }
  )
  
  
  output$roi <- renderText({
    
    if (input$vegetable == "1"){
      
      
      flow <- c(-LEDTotalCost*a,rep(savings*a/12, LEDLife*12))
    
      rate <- irr(cf=flow)*12
      
      effRate <- (1+rate/12)^12 - 1
      
      paste('ROI: ',round(mean(effRate*100),2),'%')
    }
    
    else if(input$vegetable == "2") {
      
      flow <- c(-LEDTotalCost*b,rep(savings*b/12, LEDLife*12))
      
      rate <- irr(cf=flow)*12
      
      effRate <- (1+rate/12)^12 - 1
      
      paste('ROI: ',round(mean(effRate*100*b),2),'%')
      
    }
    else if(input$vegetable == "3") {
      
      flow <- c(-LEDTotalCost*c,rep(savings*c/12, LEDLife*12))
      
      rate <- irr(cf=flow)*12
      
      effRate <- (1+rate/12)^12 - 1
      
      paste('ROI: ',round(mean(effRate*100*c),2),'%')
      
    }
    
    # paste('ROI: ',round(mean(effRate*100),2),'%')
    }
  )
 
  # output$example <- renderText({
  #   
  #   if (input$vegetable == "1"){
  #   
  #   paste('ROI: ',round(mean(effRate*100*a),2),'%')
  #     }
  # 
  #   else if(input$vegetable == "2") {
  #     paste('ROI: ',round(mean(effRate*100*b),2),'%')
  #     
  #   }
  #   else if(input$vegetable == "3") {
  #     paste('ROI: ',round(mean(effRate*100*c),2),'%')
  # 
  #   }
  #   
  # }
  # )
  
  
  
})