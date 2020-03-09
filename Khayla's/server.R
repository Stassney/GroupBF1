#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)

## Ui.R
fluidPage(
   selectInput("select", label = h3("Select Country"), 
              choices = list("Middle East and North Africa" = 1, "Gambia" = 2, "Honduras" = 3, "Italy" = 4,
                             "Myanmar" = 6, "Nepal" = 7, "Paraguay" = 8, "Somalia" = 9, "South Sudan" = 10), 
              selected = 1),
   hr(),
  fluidRow(column(3, verbatimTextOutput("value")))
  
)

## Server

function(input, output) {
  output$value <- renderPrint({ input$select })
}
