library(shiny)
library(ggplot2)

source("final_ui.R")
source("final_server.R")

shinyApp(ui = ui, server = server)



server <- function(input, output) {
  output$out_message <- renderText({
    msg <- paste("", input$username, "!")
    return(msg)
  })
  
  hiv_df2 <- read.csv("data/by_area_hiv_treatment_est_from_1990-present.csv", stringsAsFactors = FALSE)
  
  names(hiv_df2_noNA)[4] <- "Percent of people receiving ART"
  receiving <- hiv_df2_noNA %>%
    filter(Year == "2018") %>%
    select(Year, Region, `Percent of people receiving ART`) %>%
    top_n(10)
  name <- c("Eswatini", "Madagascar", "Namibia", " Rwanda","Zimbabwe", "Jordan",
            "Cape Verde", "Denmark", "Italy", "Portugal", "Spain")
  num <- c(86, 9, 92, 87, 88, 84, 89, 89, 91, 90, 84)
  
  output$example_plot <- renderPlotly({
    receiving_therapy <- barplot(
      num, names.arg = name, xlab = "Region", ylab = "People receiving HAART therapy", 
      col = "blue", main = "Percent of people Receiving HAART")
    return(barplotly(receiving_therapy))
  })
  #### The chart above represents the percent of people who are receiving the 
  #### HAART therapy. Bar charts are useful to show a distribution of data points
  #### or perform a comparison of metric values across different subgroups of your
  #### data.
  
  
}
# 2nd graph starts
server <- function(input, output) {
  output$out_message_2 <- renderText({
    msg <- paste("", input$username, "!")
    return(msg)
  })
  
  output$example_plot_2 <- renderPlotly({
    most_accessible <- ggplot(receiving) +
      geom_point(mapping = aes(x = Region, y = `Percent of people receiving ART`)) +
      geom_smooth (
        mapping = aes(x = Region, y = `Percent of people receiving ART`),
      )
    return(ggplotly(most_accessible))
  })
}


ui <- fluidPage(
  h1("Hello App"),
  textInput(
    inputId = "username",
    label = h3("Type in your name")
  ),
  textOutput(outputId = "out_message"),
  plotlyOutput(outputId = "example_plot"),
  textOutput(outputId = "out_message_2"),
  plotlyOutput(outputId = "example_plot_2")
)
