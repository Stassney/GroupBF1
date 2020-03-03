# BF1 Midpoint Deliverable


## Introductory paragraph (Stassney)

### Introduction:

#### There are about 37.9 M people (ppl) globally affected by HIV today. 
#### Every day there are more than 5,700 ppl who contracted HIV which is nearly 240 ppl/hour.
#### The purpose of this project is to:
#### - learn and show where in the world HIV is most common and
#### - to understand how the distribution of HIV treatment (HAART therapy) affects 
####   the prevalence of HIV in certain parts of the world.
####     - Questions such as:
####       - Where in the world is HAART therapy most accessible? (Interactive Map Chart)
####       - Who is receiving HAART therapy? (Bar Graph)
####       - What demographics around the world are not benefiting from HAART therapy? (Pie Chart)
####       - How accessibility to HAART therapy affects the prevalence of HIV in certain parts of the world?
  
### Data Source:

#### UNAIDS 2019 HIV estimates

"http://apps.who.int/gho/data/node.home"

#### UNAIDS 2019 HIV estimates treatments

"http://apps.who.int/gho/data/node.home"


## Summary Information (Maxine)

#### Dataframe number 1

hiv_df1 <- read.csv("by_area_hiv_est_from_1990-present.csv", stringsAsFactors = FALSE)

hiv_df1 <- hiv_df1[-(1:4),]
colnames(hiv_df1) <- hiv_df1[1,]
colnames(hiv_df1)[1:2] <- c("Year","Location")
hiv_df1 <- hiv_df1[-1,]

names(hiv_df1)[3] <- "Region"

#### Dataframe number 2

hiv_df2 <- read.csv("by_area_hiv_treatment_est_from_1990-present.csv", stringsAsFactors = FALSE)

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

#### Merging both data frames together

merge_hiv_df <- merge(x=hiv_df1, y=hiv_df2_noNA, by=c("Year","Location", "Region"))
dim(data)

#### Viewing the 
View(merge_hiv_df)

## Changing for col namnes for "merge_hiv_df"

colnames(merge_hiv_df)[13] <- "AIDS(death)-Children and Adults"
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

View(merge_hiv_df)

# Making missing value "..." into "NA"

merge_hiv_df[merge_hiv_df == "..."] <- NA


#Computes (and includes) 5 pieces of _relevant_ information using a function saved in a `script/` file. For each piece of information, make sure to:
  
    


#### learn and show where in the world HIV is most common

hiv_worldwide <- merge_hiv_df %>%
  filter(Region == max(Region)) %>%
  select(Region,"Estimated adults (15+) living with HIV")

#### Paragraph :
#### Our Data shows that Central and Western Europe have the
#### highest number of people living with HIV. Our data
#### reports that 2,200,000 people are living with HIV


#### Where in the world is HAART therapy most accessible?

hiv_worldwide <- hiv_df2_noNA %>%
  filter(Region == max(Region))%>%
  select(Year, Region, `Percent of People all ages living with HIV receiving ART`)

#### Pargaph :
#### Where in the world is HAART therapy most accessible?
#### HAART Therapy is found is mainly found in North America..
#### The code displays a list of countries sand regions where there are more than
#### In 2018, 79% percent of people living with HIV were receivng  ART therapy.


####  Who is receiving HAART therapy? (Bar Graph)

hiv_worldwide <- merge_hiv_df %>%
  filter( Year == max(Year)) %>%
  select( 'Number of adults (15+) receiving ART', `Number of children (0-14) receiving ART`) %>%
  filter( `Number of children (0-14) receiving ART` == max(`Number of children (0-14) receiving ART`))

#### Paragraph:
####  People of all ages are receiving HAART therapy.
####  Our data reports that both children and adults are receiving ART
####  Therapy. Adults rank higher than children in receiving the therapy
####  with 22,394,000 cases



#### Who is not receiving ART therapy?

hiv_worldwide <- hiv_df2_noNA %>%
  filter( Region < 500) %>%
  select(Year, Region, `Number of adults (15+) receiving ART`, `Number of children (0-14) receiving ART`)%>%
  filter( Region == min(Region)
          
          
          
#### Paragrpah:
#### Who is not receiving ART therapy?
#### Our dataset displays that there are zero
#### reported cases of children receiving HAART therapy in Afghanistan.
#### Relationship between prevelance of HIV and people receiving ART

hiv_worldwide <- merge_hiv_df %>%
            filter(Region == max(Region))%>%
            select( Region , 'Number of adults (15+) receiving ART', `Adult (15-49) prevalence (%)`)
          


## Summary Table (Stassney)

#### Introducing  the table:
#### Total number of rows in "merge_hiv_df"

nrow(merge_hiv_df)

#### There are 1661 total rows

#### Total number of columns in "merge_hiv_df"

ncol(merge_hiv_df)

#### There are 67 total columns 

#### Summary of "merge_hiv_df"

summary(merge_hiv_df)


#### Explain why the grouping calculation was performed:

#### The dataframe "merge_hiv_df" came from two different data set.
#### The first data.cvs file was named under "hiv_df1" and 
#### the second data.csv file was named under "hiv_df2".
#### However, dataframe "hiv_df2" was altered and shortend.
#### Filtering the specific columns helped us solve our specific questions faster.

####  Creates a summarized data frame to include as the table using `group_by()

year <- merge_hiv_df %>% 
  group_by(Year) %>% 
  summarize(Total death = max(Total death)) %>% 
  select(Total death)

#### Intentionally sorts the table in a relevant way:

merge_hiv_df <- arrange(merge_hiv_df, desc(Total death))

#### Displays well formatted column names (**1 point**)

names(merge_hiv_df)[13] <- "Total death"
names(merge_hiv_df)[1] <- "Year"

#### Only displays relevant columns in the table

#### Dataframe Consist of:
#### year, region, demographics, age, and total AIDS death

relevant_info_df <- select(
  merge_hiv_df, Year:Total death,
  -Location)

#### Renders the table in the report using an appropriate package 

install.packages("shiny")
library(shiny)

renderTable(expr, striped = FALSE, hover = FALSE, bordered = FALSE,
            spacing = c("s"), width = "auto", align = NULL,
            rownames = FALSE, colnames = TRUE, digits = NULL, na = "NA",
            env = merge_hiv_df, quoted = FALSE, outputArgs = merge_hiv_df)

#### Interprets information the table, honing in on important information


## Charts (Khayla & Aniruddh)

#### Question 1: Where in the world is HAART therapy most accessible?
#### (Interactive Map Chart)
lat_and_long.df <- data.frame(name, lat, long)

lat <- c("26.5225", "18.7669", "22.9576", "1.9403", "19.0154", 
         "30.5852", "16.5388","56.2639", "41.8719", "39.3999", "40.4637")
long <- c("31.4659", "46.8691", "18.4904","29.8739", "29.1549", 
          "36.2384", "23.0418", "9.5018", "12.5674", "8.2245", "3.7492")
lat_and_long <- lat_and_long.df %>%
  mutate(total = lat_and_long$long + lat_and_long$lat)

map <- leaflet() %>%
  addTiles() %>%
  addCircleMarkers(
    lng = lat_and_long$long, lat = lat_and_long$lat, radius = lat_and_long$total,
    label = lapply(details, htmltools::HTML)
  )

#### Question 2: Who is receiving HAART therapy? 
#### (Bar plot) 
  
names(hiv_df2_noNA)[4] <- "Percent of people receiving ART"
receiving_df <- hiv_df2_noNA %>%
  filter(Year == "2018") %>%
  select(Year, Region, `Percent of people receiving ART`) %>%
  top_n(10)
name <- c("Eswatini", "Madagascar", "Namibia", " Rwanda","Zimbabwe", "Jordan",
          "Cape Verde", "Denmark", "Italy", "Portugal", "Spain")
num <- c(86, 9, 92, 87, 88, 84, 89, 89, 91, 90, 84)

receiving_therapy <- barplot(
  num, names.arg = name,xlab = "Region", ylab = "People receiving HAART therapy", 
  col = "blue", main = "Percent of people Receiving Art")



#### Question 3: What demographics around the world are not benefiting from HAART therapy? 
#### (Pie Chart)

names(merge_hiv_df)[13] <- "Total death"
not_benefiting <- merge_hiv_df %>%
  filter(Year == "2018") %>%
  select(Year, Region, `Total death`) %>%
  top_n(10)
name_1 <- c("Middle East and North Africa",  "Gambia", "Honduras", 
            "Italy", "Myanmar", "Nepal", "Paraguay", "Somalia", "South Sudan")
num_1 <- c(8400, 980,780, 710, 7800, 910, 720, 710, 9900)

demographics_therapy <- pie(num_1, labels = num_1 , main = "Demographics not benefiting from therapy", 
                            col = rainbow(length(num_1)))
legend("topleft", c("Middle East and North Africa", "Gambia", 
                    "Honduras", "Italy", "Myanmar", "Nepal", "Paraguay", "Somalia", "South Sudan"), cex = 0.8,
       fill = rainbow(length(num_1)))

#### The bar graph that I created shows a percentage of who receiving HAART therapy
#### based on the region. This bar graph takes the top 10 percent



## Code and Report structure (Maxine & Stassney)
Code is broken up appropriately into the described files.
- Each file is in the appropriate folder: `scripts/`, except `index.Rmd`, which is in the root (**1 point**)
- Each file is loaded into the `index.Rmd` file (**1 point**)
- Only the `index.Rmd` file loads the data (**1 point**)


## Code clarity (Khayla & Aniruddh)

#### Use "lintr" package to help remove lintr() errors.

install.packages("lintr")

#### Load "lintr" packages

library(lintr)
