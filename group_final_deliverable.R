# Final Deliverable Rubric

## Packages used and load for the project

library(shiny)
library(plotly)
library(dplyr)
library(lintr)
library(ggplot2)
library(styler)
library(knitr)

#### Dataframe number 1

hiv_df1 <- read.csv(
  "by_area_hiv_est_from_1990-present.csv", stringsAsFactors = FALSE)

hiv_df1 <- hiv_df1[-(1:4),]
colnames(hiv_df1) <- hiv_df1[1,]
colnames(hiv_df1)[1:2] <- c("Year","Location")
hiv_df1 <- hiv_df1[-1,]

names(hiv_df1)[3] <- "Region"

#### Dataframe number 2

hiv_df2 <- read.csv(
  "by_area_hiv_treatment_est_from_1990-present.csv", stringsAsFactors = FALSE)

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

----------------------------------------------

## Introductory page (Stassney)

### The purpose/importance of the project

##### Today, there are 37.9 M people around the world living with HIV.
##### Every day there are more than 5,700 people who contracted HIV which is nearly 240 people per hour.
##### This project will further explore where (globally) and who (demographic) have more 
##### HIV prevalence and where/who are getting access to HIV treatment.

### Data Source:

#### UNAIDS 2019 HIV estimates

"http://apps.who.int/gho/data/node.home"

#### UNAIDS 2019 HIV estimates treatments

"http://apps.who.int/gho/data/node.home"

### Visual flare beyond the summary paragraph

### Bar Graph

server <- function(input, output){
  hiv_df2 <- read.csv(
    "data/by_area_hiv_treatment_est_from_1990-present.csv", stringsAsFactors = FALSE)
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
}

----------------------------------------------

## Interactive Pages with each Conclusion

#### Pie Chart (Khayla)

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

## Ui.R

fluidPage(
  selectInput("select", label = h3("Select Country"), 
              choices = list(
                "Middle East and North Africa" = 1, "Gambia" = 2, "Honduras" = 3, "Italy" = 4,
                "Myanmar" = 6, "Nepal" = 7, "Paraguay" = 8, "Somalia" = 9, "South Sudan" = 10), 
              selected = 1),
  hr(),
  fluidRow(column(3, verbatimTextOutput("value")))
  
)

## Server

function(input, output) {
  output$value <- renderPrint({ input$select })
}

## Conclusion (Stassney)

## Notable data-insight or Pattern discovered

#### A notable data trend or insight discovered from this project is that
#### Middle East, North Africa along with other Low Income Countries (LIC) are
#### are being affected the most from HIV and have higher death rates.

## Specific piece of data demonstrate patterns

#### According to the data table,
#### South Sudan with (9,900 K deaths in 2018),
#### Myanmar, Middle East and North Africa are areas
#### with the highest HIV prevalence which means that
#### this areas are not benefiting with HAART Therapy.

## Implications of the Insight

#### Italy have the least amount of deaths (710 deaths in 2018),
#### Which can means a few things and they are;
#### Italy have better access to HAART Therapy unlike South Sudan,
#### or that Italy has less people that contracted HIV,
#### and Italy's population is less smaller than other countries.

---------------------------------------------- 
  
### Scatter Plot (Aniruddh)

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

## Conclusion (Stassney)
  
## Notable data-insight or Pattern discovered
  
#### A notable data trend or insight discovered from this project is that
#### Namibia (92%), Italy ((91%), and Portugal (90%) have the highest percentage
#### of people receiving HAART Therapy.

## Specific piece of data demonstrate patterns
  
#### One specific data that was alarming was that
#### Madagascar only receive 9 percent of the population
#### received the HAART Therapy unlike High Income Countries (HIC)
#### who receives about 90 percent or more.

## Implications of the Insight

#### According to our data, we can indicate that High Income Countries
#### have better access to HAART Therapy and receiving/benefiting
#### to the therapy than Low Income Countries.    

----------------------------------------------  
    
### Bar Graph (Aniruddh)

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
}

## Conclusion (Stassney)

## Notable data-insight or Pattern discovered

#### A notable data trend or insight discovered from this project is that
#### due to the unequal distribution of HAART Therapy in different regions
#### of the world, Low Income Countries are being affected the most.

## Specific piece of data demonstrate patterns

#### Countries such as Madagascar, South Sudan, and other African Countries
#### have the highest death rate while having the lowest
#### number of HAART therapy being received.

## Implications of the Insight

#### We can imply that High Income Countries have less death rates
#### Due to the having more access to HARRT Therapy unlike
#### Low Income Countries. 
