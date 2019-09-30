library(shiny)

ui <- fluidPage(
                selectInput(inputId = "selection", label = "select your vegetable", c("yes","no")),
                
                plotOutput("outPut")
                )

server <- function(input, output) {
  output$outPut <- renderPlot({hist(rnorm(100))})
}

shinyApp(ui = ui, server = server)