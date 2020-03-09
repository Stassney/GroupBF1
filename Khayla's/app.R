library(shiny)

# Define UI for application that draws a histogram

## Creating the title for Pie Chart

ui <- fluidPage(
    titlePanel("Demographics not benefiting from therapy"),
        mainPanel(
        plotOutput("demographics_therapy"))
    )
## Rendering Pie Chart

server <- function(input, output) not_benefiting <- merge_hiv_df %>%
    filter(Year == "2018") %>%  
    select(Year, Region, `Total_death`) %>%
    top_n(10)
    name_1 <- c("Middle East and North Africa",  "Gambia", "Honduras", 
            "Italy", "Myanmar", "Nepal", "Paraguay", "Somalia", "South Sudan")
    num_1 <- c(8400, 980, 780, 710, 7800, 910, 720, 710, 9900)

    demographics_therapy <- pie(num_1, labels = num_1 , main = "Demographics not benefiting from therapy", 
                            col = rainbow(length(num_1)))
    legend("topleft", c("Middle East and North Africa", "Gambia", 
                    "Honduras", "Italy", "Myanmar", "Nepal", "Paraguay", "Somalia", "South Sudan"), cex = 0.8,
    fill = rainbow(length(num_1)))
    

## Run the Application 
    
shinyApp(ui = ui, server = server)

