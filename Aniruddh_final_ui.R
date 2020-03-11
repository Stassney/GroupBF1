library(shiny)
library(plotly)
library(ggplot2)
ui <- navbarPage(title = "Analysis",
                 tabPanel("Bar plot", tab_1),
                 tabPanel("Interactive plot", tab_2),
                 tabPanel("Pie plot", tab_3)
)

tab_1 <- fluidPage(
  sidebarLayout(
    mainPanel(
      plotlyOutput(outputId = "example_plot")
    ),
    sidebarPanel(
      selectInput("Region",
                  label = "Choose a variable to display",
                  choices = list("Percent of People all ages living with HIV receiving ART - Lower", 
                                 "Percent of People all ages living with HIV receiving ART - Upper"),
                  selected = "Percent of People all ages living with HIV receiving ART - Lower"),
      radioButtons(inputId = "People receiving HAART therapy",
                   label = "Choose a variable to display",
                   choices = list("Year", 
                                  "Location"),
                   selected = "Year")
    )
  )
)
tab_2 <- fluidPage(
  sidebarLayout(
    mainPanel(plotlyOutput(outputId = "example_plot_2")
    ),
    sidebarPanel(selectInput("Region", 
                             label = "Choose a variable to display",
                             choices = list("Percent of children(0-14) living with HIV receiving ART", 
                                            "Percent of adults(15+) living with HIV receiving ART"),
                             selected = "Percent of children(0-14) living with HIV receiving ART"),
                 radioButtons("Percent of people receiving ART",
                              label = "Choose a variable to display",
                              choices = list("Year", 
                                             "Location"),
                              selected = "Year")
                 
    )
  )
)
tab_3 <- fluidPage(
  sidebarLayout(
    mainPanel(plotlyOutput(outputId = "example_plot_3")
    ),
    sidebarPanel(selectInput("Region", 
                             label = "Choose a variable to display",
                             choices = list("AIDS(death)-Children (0-14)", 
                                            "AIDS(death)-Adults (15+)"),
                             selected = "AIDS(death)-Children (0-14)"),
                 radioButtons("Percent of people receiving ART",
                              label = "Choose a variable to display",
                              choices = list("Year", 
                                             "Location"),
                              selected = "Year")
                 
    )
  )
)
