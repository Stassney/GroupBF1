library(shiny)
library(plotly)
ui <- fluidPage(
  textOutput(outputId = "out_message"),
  plotlyOutput(outputId = "example_plot"),
  textOutput(outputId = "out_message_2"),
  plotlyOutput(outputId = "example_plot_2"),
  textOutput(outputId = "out_message_3"),
  plotlyOutput(outputId = "example_plot_3")
  
)

