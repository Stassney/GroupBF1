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
  
  output$example_plot <- renderPlotly({
    receiving_therapy <- barplot(
      colSums(c("name")), names.arg = "name", xlab = "Region", ylab = "People receiving HAART therapy", 
      col = "blue", main = "Percent of people Receiving HAART")
    
    return(receiving_therapy)
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
  
  hiv_df1 <- read.csv(
    "data/by_area_hiv_est_from_1990-present.csv", stringsAsFactors = FALSE)
  
  hiv_df1 <- hiv_df1[-(1:4),]
  colnames(hiv_df1) <- hiv_df1[1,]
  colnames(hiv_df1)[1:2] <- c("Year","Location")
  hiv_df1 <- hiv_df1[-1,]
  
  names(hiv_df1)[3] <- "Region"
  
  #### Dataframe number 2
  
  hiv_df2 <- read.csv(
    "data/by_area_hiv_treatment_est_from_1990-present.csv", stringsAsFactors = FALSE)
  
  hiv_df2 <- hiv_df2[-(1:4),]
  colnames(hiv_df2)<-hiv_df2[1,]
  colnames(hiv_df2)[1:2] <- c("Year","Location")
  hiv_df2 <- hiv_df2[-1,]
  
  names(hiv_df2)[3] <- "Region"
  
  dim(hiv_df1)
  dim(hiv_df2)
  intersect(colnames(hiv_df1),colnames(hiv_df2))
  
  #### hiv_df2 dataframe without NA columns
  
  hiv_df2_noNA <- hiv_df2[-c(20:50)]
  
  ### Changing name
  names(hiv_df2_noNA)[4] <- "Percent of people receiving ART"
  
  #### Merging both data frames together
  
  merge_hiv_df <- merge(x=hiv_df1, y=hiv_df2_noNA, by=c("Year","Location", "Region"))
  dim(data)
  
  ## Changing for col namnes for "merge_hiv_df"
  
  colnames(merge_hiv_df)[1] <- "Year"
  colnames(merge_hiv_df)[13] <- "Total_death"
  colnames(merge_hiv_df)[14] <- "AIDS(death)-Children and Adults-LOW ESTIMATE."
  colnames(merge_hiv_df)[14] <- "AIDS(death)-Children and Adults-HIGH ESTIMATE."
  colnames(merge_hiv_df)[15] <- "AIDS(death)-Children and Adults-HIGH ESTIMATE."
  colnames(merge_hiv_df)[16] <- "AIDS(death)-Children (0-14)."
  colnames(merge_hiv_df)[15] <- "AIDS(death)-Children-LOW ESTIMATE."
  colnames(merge_hiv_df)[15] <- "AIDS(death)-Children AND ADULTS-HIGH ESTIMATE."
  colnames(merge_hiv_df)[17] <- "AIDS(death)-Children (0-14)-LOW ESTIMATE."
  colnames(merge_hiv_df)[18] <- "AIDS(death)-Children (0-14)-HIGH ESTIMATE."
  colnames(merge_hiv_df)[19] <- "AIDS(death)-Adults (15+)"
  colnames(merge_hiv_df)[20] <- "AIDS(death)-Adults (15+)-LOW ESTIMATE"
  colnames(merge_hiv_df)[21] <- "AIDS(death)-Adults (15+)-HIGH ESTIMATE"
  colnames(merge_hiv_df)[40] <- "Mothers Needing Antiretrovirals"
  colnames(merge_hiv_df)[41] <- "Mothers Needing Antiretrovirals-LOW ESTIMATE"
  colnames(merge_hiv_df)[42] <- "Mothers Needing Antiretrovirals-HIGH ESTIMATE"
  
  #### Making missing value "..." into "NA"
  
  merge_hiv_df[merge_hiv_df == "..."] <- NA
  
  not_benefiting <- merge_hiv_df %>%
    filter(Year == "2018") %>%  
    select(Year, Region, `Total_death`) %>%
    top_n(10)
  output$example_plot_3 <- renderPlotly({
    demographics_therapy <- pie(num_1, labels = num_1 , main = "Demographics not benefiting from therapy", 
                                col = rainbow(length(num_1)))
    legend("topleft", c("Middle East and North Africa", "Gambia",
                        "Honduras", "Italy", "Myanmar", "Nepal", "Paraguay", "Somalia", "South Sudan"), cex = 0.8,
           fill = rainbow(length(num_1)))
    return(demographics_therapy)
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

