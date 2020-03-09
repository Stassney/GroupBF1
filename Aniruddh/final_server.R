library(shiny)
library(plotly)
library(dplyr)
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
  most_accessible <- hiv_df2_noNA %>%
    filter(Year == "2018") %>%
    select(Year, Region, `Percent of people receiving ART`)
  
  output$example_plot_2 <- renderPlotly({
    most_accessible <- ggplot(most_accessible) +
      geom_point(mapping = aes(x = Region, y = `Percent of people receiving ART`)) +
      geom_smooth (
        mapping = aes(x = Region, y = `Percent of people receiving ART`),
      )
    return(ggplotly(most_accessible))
  })
  #### The chart above represents the percent of people who are receiving the 
  #### HAART therapy. 
  #### Bar charts are useful to show a distribution of data points.
  #### It gives us a chance easily interpret data. Along with that it is used to
  #### compare data.
  #### or perform a comparison of metric values across different subgroups of your
  #### data.
  #### It also makes us understand how differently access of drugs/ treatment 
  #### can be depending where a person resides. 
  
  
  
}
# 2nd graph starts

#### The chart above represents how HAART is accessible to different
#### regions of the world, in 2018. This type of chart is 
#### especially useful when you want to demonstrate several
#### trends or numbers. Our chart indicates that Spain and Jordan have
####  the percentage of people receiving HAART 
####  Italy, Namibia have the highest percentage of people.
####  receiving HAART. Spain has the lowest percentage
####  Our chart shows that spain has 84 percent
#### receiving Art, while Nambia has 92 %.
#### By adding renderPlotty, we can also see details about a data of every point.
#### This further helps us to understand and learn from it. 
#### We learn how differently people receive HAART being in different regions
#### of the world. In general, poorer countries where the drugs is more needed
#### are not able to get enough of the treatment. For example, in Madagascar,
#### only 9 Percent of the people receive HAART.
#### Using ggplot for this problem was useful as it shows us how
#### how to map variables to aesthetics, what graphical primitives 
#### to use, and it takes care of the details.

