#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Load data
data <- read.csv("729DV_250SIM_0.1PHI_0.4P_20220111_201456.csv")

# Define UI for application that draws a set of reslience curves
shinyUI(fluidPage(

    # Application title
    titlePanel("Resilience Curves"),

    # Sidebar with a slider input for number of resilience curves displayed
    sidebarLayout(
        sidebarPanel(
            sliderInput("curves",
                        "Number of curves:",
                        min = 1,
                        max = 729,
                        value = 1),
            sliderInput("sliderX", "Pick Minimum and Maximum X Values",
                        0, 300, value = c(0, 300)),
            sliderInput("sliderY", "Pick Minimum and Maximum Y Values",
                        0,1, value = c(0, 1)),
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h3("Graph of resilience curves:"),
            plotOutput("ResiliencePlot")
        )
    )
))
