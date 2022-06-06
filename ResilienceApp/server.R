#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Load data
data <- read.csv("729DV_250SIM_0.1PHI_0.4P_20220111_201456.csv")

# Define server logic required to draw resilience curves
shinyServer(function(input, output) {

    output$ResiliencePlot <- renderPlot({

    minX <- input$sliderX[1]
    maxX <- input$sliderX[2]
    minY <- input$sliderY[1]
    maxY <- input$sliderY[2]
        
    for (i in 1:input$curves) {
        x    <- 1:300
        y    <- data[,i]
            
        if (i == 1) {
            plot(x,y,type="l",ylim=c(minY,maxY),xlim=c(minX,maxX))
        }
        else {lines(x,y,type="l",ylim=c(minY,maxY),xlim=c(minX,maxX))}
        
    }

    })

})
