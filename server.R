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

  
  
  
  #******************************Veggies variables******************************
  
  lettuce  <- 1
  squash  <- 1.5
  cucumber  <- 1.8
  
  
  
  a  <- lettuce
  b  <- squash
  c  <- cucumber
  
  
  #******************************region variables******************************
  athens <- 1
  ithaca <-.85
  alexandria <- .75
  
  
  x <- athens
  y <- ithaca
  z <- alexandria
  
    
  #******************************plot rendering******************************
  
  output$scatterPlot <- renderPlot({
    
  #******************************region 1******************************
    
    if ((input$vegetable == "1")&(input$region == "1")){
      
      temp <- es %>% group_by(day = yday(TimeStamp)) %>% 
        summarize(cost = mean(kwCost)*24*measures_hour*(a*x)) %>% 
        filter(row_number() < 366) # discard extra day from graph
      
      ggplot(temp, aes(day, cost)) +geom_point(color = 'red') +labs(y = 'Cost', x = 'Day of year',title = "Athens - Lettuce") + ylim (0,1)
              
    
    }
    
    else if((input$vegetable == "2")&(input$region =="1")) {
      
      
      temp <- es %>% group_by(day = yday(TimeStamp)) %>% 
        summarize(cost = mean(kwCost)*24*measures_hour*(b*x)) %>% 
        filter(row_number() < 366) # discard extra day from graph
      
      
      
      ggplot(temp, aes(day, cost)) +geom_point(color = 'black') +labs(y = 'Cost', x = 'Day of year',title = "Athens - Squash") + ylim (0,1)
      
      
    }
    else if((input$vegetable == "3")&(input$region == "1")) {
      
      
      temp <- es %>% group_by(day = yday(TimeStamp)) %>% 
        summarize(cost = mean(kwCost)*24*measures_hour*(c*x)) %>% 
        filter(row_number() < 366) # discard extra day from graph
      
      
    
      
      ggplot(temp, aes(day, cost)) +geom_point(color = 'grey') +labs(y = 'Cost', x = 'Day of year', title = "Athens - Cucumber") + ylim (0,1)
      
    }
    
    #******************************region 2******************************
      
     else if ((input$vegetable == "1")&(input$region == "2")){
        
       temp <- es %>% group_by(day = yday(TimeStamp)) %>% 
         summarize(cost = mean(kwCost)*24*measures_hour*(a*y)) %>% 
         filter(row_number() < 366) # discard extra day from graph 
       
       
        ggplot(temp, aes(day, cost)) +geom_point(color = 'red') +labs(y = 'Cost', x = 'Day of year', title = "Ithaca - Lettuce") + ylim (0,1)
        
        
      }
    
    else if((input$vegetable == "2")&(input$region == "2")) {
      
      
      temp <- es %>% group_by(day = yday(TimeStamp)) %>% 
        summarize(cost = mean(kwCost)*24*measures_hour*(b*y)) %>% 
        filter(row_number() < 366) # discard extra day from graph
      
      
      
      ggplot(temp, aes(day, cost)) +geom_point(color = 'pink') +labs(y = 'Cost', x = 'Day of year', title = "Ithaca - Squash") + ylim (0,1)
      
      
    }
    else if((input$vegetable == "3")&(input$region == "2")) {
      
      
      temp <- es %>% group_by(day = yday(TimeStamp)) %>% 
        summarize(cost = mean(kwCost)*24*measures_hour*(c*y)) %>% 
        filter(row_number() < 366) # discard extra day from graph
      
      
      
      
      ggplot(temp, aes(day, cost)) +geom_point(color = 'purple') +labs(y = 'Cost', x = 'Day of year', title = "Ithaca - Cucumber") + ylim (0,1)
      
    }
    
    #******************************region 3******************************
    
    
    
   else if ((input$vegetable == "1")&(input$region == "3")){
     
     temp <- es %>% group_by(day = yday(TimeStamp)) %>% 
       summarize(cost = mean(kwCost)*24*measures_hour*(a*z)) %>% 
       filter(row_number() < 366) # discard extra day from graph
  
      
      ggplot(temp, aes(day, cost)) +geom_point(color = 'orange') +labs(y = 'Cost', x = 'Day of year', title = "Alexandria - Lettuce") + ylim (0,1)
      
      
    }
    
    else if((input$vegetable == "2")&(input$region == "3")) {
      
      
      temp <- es %>% group_by(day = yday(TimeStamp)) %>% 
        summarize(cost = mean(kwCost)*24*measures_hour*(b*z)) %>% 
        filter(row_number() < 366) # discard extra day from graph
      
      
      
      ggplot(temp, aes(day, cost)) +geom_point(color = 'green') +labs(y = 'Cost', x = 'Day of year', title = "Alexandria - Squash") + ylim (0,1)
      
      
    }
    else if((input$vegetable == "3")&(input$region == "3")) {
      
      
      temp <- es %>% group_by(day = yday(TimeStamp)) %>% 
        summarize(cost = mean(kwCost)*24*measures_hour*(c*z)) %>% 
        filter(row_number() < 366) # discard extra day from graph
      
      
      
      
      ggplot(temp, aes(day, cost)) +geom_point(color = 'blue') +labs(y = 'Cost', x = 'Day of year', title = "Alexandria - Cucumber") + ylim (0,1)
      
    }

    
  })
  
  
  #******************************report creation******************************
  
  
  output$report <- renderText({paste("******************************REPORT******************************")}
  )

  output$avg_annual_income <- renderText({
    
  #******************************region 1******************************
    
    if ((input$vegetable == "1")&(input$region == "1")){
      
      paste('Average annual cost: $', round(model_cost*(a*x),2))
    }
    
    else if((input$vegetable == "2")&(input$region == "1")) {
      paste('Average annual cost: $', round(model_cost*(b*x),2))
      
    }
    else if((input$vegetable == "3")&(input$region == "1")) {
      paste('Average annual cost: $', round(model_cost*(c*x),2))
      
    }
    
  #******************************region 2******************************
    
    else if ((input$vegetable == "1")&(input$region == "2")){
      
      paste('Average annual cost: $', round(model_cost*(a*y),2))
    }
    
    else if((input$vegetable == "2")&(input$region == "2")) {
      paste('Average annual cost: $', round(model_cost*(b*y),2))
      
    }
    else if((input$vegetable == "3")&(input$region == "2")) {
      paste('Average annual cost: $', round(model_cost*(c*y),2))
      
    }
    
  #******************************region 3******************************  
    
    else if ((input$vegetable == "1")&(input$region == "3")){
      
      paste('Average annual cost: $', round(model_cost*(a*z),2))
    }
    
    else if((input$vegetable == "2")&(input$region == "3")) {
      paste('Average annual cost: $', round(model_cost*(b*z),2))
      
    }
    else if((input$vegetable == "3")&(input$region == "3")) {
      paste('Average annual cost: $', round(model_cost*(c*z),2))
      
    }
    
          })
                                         
  
  output$avg_annual_savings_adaptive_led <- renderText({
 
  #******************************region 1******************************   
    
    if ((input$vegetable == "1")&(input$region == "1")){
      
      paste('Average annual saving of adaptive LEDs: ', round(savings*(a*x),2))
    }
    
    else if((input$vegetable == "2")&(input$region == "1")) {
      paste('Average annual saving of adaptive LEDs: ', round(savings*(b*x),2))
      
    }
    else if((input$vegetable == "3")&(input$region == "1")) {
      paste('Average annual saving of adaptive LEDs: ', round(savings*(c*x),2))
      
    }
    
    #******************************region 2******************************
    
    else if ((input$vegetable == "1")&(input$region == "2")){
      
      paste('Average annual saving of adaptive LEDs: ', round(savings*(a*y),2))
    }
    
    else if((input$vegetable == "2")&(input$region == "2")) {
      paste('Average annual saving of adaptive LEDs: ', round(savings*(b*y),2))
      
    }
    else if((input$vegetable == "3")&(input$region == "2")) {
      paste('Average annual saving of adaptive LEDs: ', round(savings*(c*y),2))
      
    }
    
    #******************************region 3******************************
    
    else if ((input$vegetable == "1")&(input$region == "3")){
      
      paste('Average annual saving of adaptive LEDs: ', round(savings*(a*z),2))
    }
    
    else if((input$vegetable == "2")&(input$region == "3")) {
      paste('Average annual saving of adaptive LEDs: ', round(savings*(b*z),2))
      
    }
    else if((input$vegetable == "3")&(input$region == "3")) {
      paste('Average annual saving of adaptive LEDs: ', round(savings*(c*z),2))
      
    }
  }
  )
  
  output$avg_annual_kw <- renderText({
    
    #******************************region 1******************************
    
    if ((input$vegetable == "1")&(input$region == "1")){
      
      paste('Average annual kw: ', round(sum(es$kw*(a*x))/years*LEDs,2))
    }
    
    else if((input$vegetable == "2")&(input$region == "1")) {
      paste('Average annual kw: ', round(sum(es$kw*(b*x))/years*LEDs,2))
      
    }
    else if((input$vegetable == "3")&(input$region =="1")) {
      paste('Average annual kw: ', round(sum(es$kw*(c*x))/years*LEDs,2))
      
    }
    
    #******************************region 2******************************
    
    else if ((input$vegetable == "1")&(input$region == "2")){
      
      paste('Average annual kw: ', round(sum(es$kw*(a*y))/years*LEDs,2))
    }
    
    else if((input$vegetable == "2")&(input$region == "2")) {
      paste('Average annual kw: ', round(sum(es$kw*(b*y))/years*LEDs,2))
      
    }
    else if((input$vegetable == "3")&(input$region =="2")) {
      paste('Average annual kw: ', round(sum(es$kw*(c*y))/years*LEDs,2))
      
    }
    
    #******************************region 3******************************
    
    else if ((input$vegetable == "1")&(input$region == "3")){
      
      paste('Average annual kw: ', round(sum(es$kw*(a*z))/years*LEDs,2))
    }
    
    else if((input$vegetable == "2")&(input$region == "3")) {
      paste('Average annual kw: ', round(sum(es$kw*(b*z))/years*LEDs,2))
      
    }
    else if((input$vegetable == "3")&(input$region =="3")) {
      paste('Average annual kw: ', round(sum(es$kw*(c*z))/years*LEDs,2))
      
    }
    
    
    }
  )
  
  output$avg_hrs_daily_per_led <- renderText({
    
    #******************************region 1******************************
    
    if ((input$vegetable == "1")&(input$region == "1")){
      
      paste('Average hours per day each LED on: ', round(sum(es$LEDon*(a*x))/measures_hour/365/years,2))
    }
    
    else if((input$vegetable == "2")&(input$region == "1")) {
      paste('Average hours per day each LED on: ', round(sum(es$LEDon*(b*x))/measures_hour/365/years,2))
      
    }
    else if((input$vegetable == "3")&(input$region == "1")) {
      paste('Average hours per day each LED on: ', round(sum(es$LEDon*(c*x))/measures_hour/365/years,2))
      
    }
    
    #******************************region 2******************************
    
    else if ((input$vegetable == "1")&(input$region == "2")){
      
      paste('Average hours per day each LED on: ', round(sum(es$LEDon*(a*y))/measures_hour/365/years,2))
    }
    
    else if((input$vegetable == "2")&(input$region == "2")) {
      paste('Average hours per day each LED on: ', round(sum(es$LEDon*(b*y))/measures_hour/365/years,2))
      
    }
    else if((input$vegetable == "3")&(input$region == "2")) {
      paste('Average hours per day each LED on: ', round(sum(es$LEDon*(c*y))/measures_hour/365/years,2))
      
    }
    
    #******************************region 3******************************
    
    else if ((input$vegetable == "1")&(input$region == "3")){
      
      paste('Average hours per day each LED on: ', round(sum(es$LEDon*(a*z))/measures_hour/365/years,2))
    }
    
    else if((input$vegetable == "2")&(input$region == "3")) {
      paste('Average hours per day each LED on: ', round(sum(es$LEDon*(b*z))/measures_hour/365/years,2))
      
    }
    else if((input$vegetable == "3")&(input$region == "3")) {
      paste('Average hours per day each LED on: ', round(sum(es$LEDon*(c*z))/measures_hour/365/years,2))
      
    }
    
    }
  )
  
  output$avg_annual_cost_per_led <- renderText({
    
    #******************************region 1******************************
    
    if ((input$vegetable == "1")&(input$region == "1")){
      
      paste('Average annual cost per LED: ', round(sum(es$kwCost*(a*x))/years,2))
    }
    
    else if((input$vegetable == "2")&(input$region == "1")) {
      paste('Average annual cost per LED: ', round(sum(es$kwCost*(b*x))/years,2))
      
    }
    else if((input$vegetable == "3")&(input$region == "1")) {
      paste('Average annual cost per LED: ', round(sum(es$kwCost*(c*x))/years,2))
      
    }
    
    #******************************region 2******************************
    
    else if ((input$vegetable == "1")&(input$region == "2")){
      
      paste('Average annual cost per LED: ', round(sum(es$kwCost*(a*y))/years,2))
    }
    
    else if((input$vegetable == "2")&(input$region == "2")) {
      paste('Average annual cost per LED: ', round(sum(es$kwCost*(b*y))/years,2))
      
    }
    else if((input$vegetable == "3")&(input$region == "2")) {
      paste('Average annual cost per LED: ', round(sum(es$kwCost*(c*y))/years,2))
      
    }
    
    #******************************region 3******************************
    
    else if ((input$vegetable == "1")&(input$region == "3")){
      
      paste('Average annual cost per LED: ', round(sum(es$kwCost*(a*z))/years,2))
    }
    
    else if((input$vegetable == "2")&(input$region == "3")) {
      paste('Average annual cost per LED: ', round(sum(es$kwCost*(b*z))/years,2))
      
    }
    else if((input$vegetable == "3")&(input$region == "3")) {
      paste('Average annual cost per LED: ', round(sum(es$kwCost*(c*z))/years,2))
      
    }
    }
  )
  
  output$avg_led_wattage <- renderText({
    
    #******************************region 1******************************
    
    if ((input$vegetable == "1")&(input$region == "1")){
      
      paste('Average LED wattage: ', round(mean(es$kw*(a*x)),2))
    }
    
    else if((input$vegetable == "2")&(input$region == "1")) {
      paste('Average LED wattage: ', round(mean(es$kw*(b*x)),2))
      
    }
    else if((input$vegetable == "3")&(input$region == "1")) {
      paste('Average LED wattage: ', round(mean(es$kw*(c*x)),2))
      
    }
    
    #******************************region 2******************************
    
    else if ((input$vegetable == "1")&(input$region == "2")){
      
      paste('Average LED wattage: ', round(mean(es$kw*(a*y)),2))
    }
    
    else if((input$vegetable == "2")&(input$region == "2")) {
      paste('Average LED wattage: ', round(mean(es$kw*(b*y)),2))
      
    }
    else if((input$vegetable == "3")&(input$region == "2")) {
      paste('Average LED wattage: ', round(mean(es$kw*(c*y)),2))
      
    }
    
    #******************************region 3******************************
    
    else if ((input$vegetable == "1")&(input$region == "3")){
      
      paste('Average LED wattage: ', round(mean(es$kw*(a*z)),2))
    }
    
    else if((input$vegetable == "2")&(input$region == "3")) {
      paste('Average LED wattage: ', round(mean(es$kw*(b*z)),2))
      
    }
    else if((input$vegetable == "3")&(input$region == "3")) {
      paste('Average LED wattage: ', round(mean(es$kw*(c*z)),2))
      
    }
    
    }
  )
  
  
  output$roi <- renderText({
    
    #******************************region 1******************************
    if ((input$vegetable == "1")&(input$region == "1")){
      
      
      flow <- c(-LEDTotalCost*(a*x),rep(savings*((a*x)/12), LEDLife*12))
    
      rate <- irr(cf=flow)*12
      
      effRate <- (1+rate/12)^12 - 1
      
      paste('ROI: ',round(mean(effRate*100*(a*x)),2),'%')
    }
    
    else if((input$vegetable == "2")&(input$region == "1")) {
      
      flow <- c(-LEDTotalCost*(b*x),rep(savings*((b*x)/12), LEDLife*12))
      
      rate <- irr(cf=flow)*12
      
      effRate <- (1+rate/12)^12 - 1
      
      paste('ROI: ',round(mean(effRate*100*(b*x)),2),'%')
      
    }
    else if((input$vegetable == "3")&(input$region == "1")) {
      
      flow <- c(-LEDTotalCost*(c*x),rep(savings*((c*x)/12), LEDLife*12))
      
      rate <- irr(cf=flow)*12
      
      effRate <- (1+rate/12)^12 - 1
      
      paste('ROI: ',round(mean(effRate*100*(c*x)),2),'%')
      
    }
    
    #******************************region 2******************************
    
    else if ((input$vegetable == "1")&(input$region == "2")){
      
      
      flow <- c(-LEDTotalCost*(a*y),rep(savings*((a*y)/12), LEDLife*12))
      
      rate <- irr(cf=flow)*12
      
      effRate <- (1+rate/12)^12 - 1
      
      paste('ROI: ',round(mean(effRate*100*(a*y)),2),'%')
    }
    
    else if((input$vegetable == "2")&(input$region == "2")) {
      
      flow <- c(-LEDTotalCost*(b*y),rep(savings*((b*y)/12), LEDLife*12))
      
      rate <- irr(cf=flow)*12
      
      effRate <- (1+rate/12)^12 - 1
      
      paste('ROI: ',round(mean(effRate*100*(b*y)),2),'%')
      
    }
    else if((input$vegetable == "3")&(input$region == "2")) {
      
      flow <- c(-LEDTotalCost*(c*y),rep(savings*((c*y)/12), LEDLife*12))
      
      rate <- irr(cf=flow)*12
      
      effRate <- (1+rate/12)^12 - 1
      
      paste('ROI: ',round(mean(effRate*100*(c*y)),2),'%')
      
    }
    
    #******************************region 3******************************
    
    else if ((input$vegetable == "1")&(input$region == "3")){
      
      
      flow <- c(-LEDTotalCost*(a*z),rep(savings*((a*z)/12), LEDLife*12))
      
      rate <- irr(cf=flow)*12
      
      effRate <- (1+rate/12)^12 - 1
      
      paste('ROI: ',round(mean(effRate*100*(a*z)),2),'%')
    }
    
    else if((input$vegetable == "2")&(input$region == "3")) {
      
      flow <- c(-LEDTotalCost*(b*z),rep(savings*((b*z)/12), LEDLife*12))
      
      rate <- irr(cf=flow)*12
      
      effRate <- (1+rate/12)^12 - 1
      
      paste('ROI: ',round(mean(effRate*100*(b*z)),2),'%')
      
    }
    else if((input$vegetable == "3")&(input$region == "3")) {
      
      flow <- c(-LEDTotalCost*(c*z),rep(savings*((c*z)/12), LEDLife*12))
      
      rate <- irr(cf=flow)*12
      
      effRate <- (1+rate/12)^12 - 1
      
      paste('ROI: ',round(mean(effRate*100*(c*z)),2),'%')
      
    }
    
    }
  )
 
  
})
