#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(ECharts2Shiny)

server <- function(input, output) {
    hiv_df2 <- read.csv("data/by_area_hiv_treatment_est_from_1990-present.csv", stringsAsFactors = FALSE)
    hiv_df2 <- hiv_df2[-(1:4),]
    colnames(hiv_df2)<-hiv_df2[1,]
    colnames(hiv_df2)[1:2] <- c("Year","Location")
    hiv_df2 <- hiv_df2[-1,]
    names(hiv_df2)[3] <- "Region"
    hiv_df2_noNA <- hiv_df2[-c(20:50)]
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
        
        return(receiving_therapy)
    })
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
    
my ui    


  
  
    
    
    
