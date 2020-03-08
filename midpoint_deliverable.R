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
####       - What demographics around the world are benefiting from HAART therapy? (Pie Chart)
####       - How accessibility to HAART therapy affects the prevalence of HIV in certain parts of the world?
  
### Data Source:

#### UNAIDS 2019 HIV estimates

"http://apps.who.int/gho/data/node.home"

#### UNAIDS 2019 HIV estimates treatments

"http://apps.who.int/gho/data/node.home"


## Summary Information (**15 points**) (Maxine)

#### Dataframe number 1


## Summary Information (Maxine)

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

## Merging both data frames together

merge_hiv_df <- merge(x=hiv_df1, y=hiv_df2_noNA, by=c("Year","Location", "Region"))
dim(data)

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


Computes (and includes) 5 pieces of _relevant_ information using a function saved in a `script/` file. For each piece of information, make sure to:
    
  
- Compute the information accurately in the script (**1 point**)


- Include the piece of information using in-line R code in the paragraph (**1 point**)

- Make clear the relevance of including the information (if not apparent) (**1 point**)


## Summary Table (**10 points**) (Stassney)
- Introduces the table, explaining why the particular grouping calculation was performed (**2 points**)

####

- Creates a summarized data frame to include as the table using `group_by()` (**2 points**)

#### 

- Intentionally sorts the table in a relevant way (**1 point**)

- Only displays relevant columns in the table (**1 point**)

- Displays well formatted column names (**1 point**)

- Successfully renders the table in the report using an appropriate package 
# (e.g., don't just print out the data frame) (**1 point**)

- Interprets information the table, honing in on important information (**2 points**)


## Charts (**30 points**, 10 points each) (Khayla & An)
For each chart, you will be evaluated based on the following (remember, each chart must be a **different chart type**):

# Where in the world is HAART therapy most accessible? (Interactive Map Chart)

map <- leaflet() %>% 
  addTiles() %>%
  addCircleMarkers(
    lng = data$long, lat = data$lat, radius = data$total,
    label = lapply(details, htmltools::HTML)

# Who is receiving HAART therapy? (Bar Graph) data 2

<<<<<<< HEAD
#### Dataframe Consist of:
#### year, region, demographics, age, and total AIDS death

relevant_info_df <- merge_hiv_df %>% 
  select(Year:Total_death, -Location)

#### Renders the table in the report using an appropriate package 

library(shiny)

renderTable(expr, striped = FALSE, hover = FALSE, bordered = FALSE,
            spacing = c("s"), width = "auto", align = NULL,
            rownames = FALSE, colnames = TRUE, digits = NULL, na = "NA",
            env = merge_hiv_df, quoted = FALSE, outputArgs = merge_hiv_df)

#### Interprets information the table, honing in on important information

## Charts (Khayla & Aniruddh)

#### Question 1: Where in the world is HAART therapy most accessible?
#### (Scatter Plot)

x <- receiving$Region
y<- receiving$`Percent of people receiving ART`

most_accessible <- ggplot(data = receiving) +
  geom_point(mapping = aes(x = receiving$Region, y = receiving$`Percent of people receiving ART`)) +
  geom_smooth (
    mapping = aes(x = receiving$Region, y = receiving$`Percent of people receiving ART`),
    
#### The chart above represents how HAART is accessible to different
#### regions of the world, in 2018. This type of chart is 
#### especially useful when you want to demonstrate several
#### trends or numbers. Our chart indicates that Spain and Jordan have
####  the percentage of people receiving HAART 
####  Italy, Namibia have the highest percentage of people.
####  receiving HAART. Spain has the lowest percentage
####  Our chart shows that spain has 84 percent
#### receiving Art, while Nambia has 92 %. 

#### Question 2: Who is receiving HAART therapy? 
#### (Bar plot) 

names(hiv_df2_noNA)[4] <- "Percent of people receiving ART"
receiving <- hiv_df2_noNA %>%
  filter(Year == "2018") %>%
  select(Year, Region, `Percent of people receiving ART`) %>%
  top_n(10)
name <- c("Eswatini", "Madagascar", "Namibia", " Rwanda","Zimbabwe", "Jordan",
          "Cape Verde", "Denmark", "Italy", "Portugal", "Spain")
num <- c(86, 9, 92, 87, 88, 84, 89, 89, 91, 90, 84)

receiving_therapy <- barplot(
  num, names.arg = name,xlab = "Region", ylab = "People receiving HAART therapy", 
  col = "blue", main = "Percent of people Receiving HAART")

#### The chart above represents the percent of people who are receiving the 
#### HAART therapy. Bar charts are useful to show a distribution of data points
#### or perform a comparison of metric values across different subgroups of your
#### data.

#### Question 3: What demographics around the world are not benefiting from HAART therapy? 
#### (Pie Chart)

not_benefiting <- merge_hiv_df %>%
=======
receiving <- merge_hiv_df %>%
>>>>>>> f10f626c5047fcbe4057bcc57ab003503aca8ed4
  filter(Year == "2018") %>%
  mutate(people_recieving_HAART) %>%
  summarise(sum(Number_of_children_(0-14),receiving_ART + Number_of_peple_all_ages_receiving_ART))


bargraph <- data.frame()
receiving <-ggplot(hiv_df2, aes(, ))
librareceiving +geom_bar(stat = "identity")
View(receiving)

# What demographics around the world are benefiting from HAART therapy? (Pie Chart)

demographics <- ggplot(, aes(x = "", fill = factor(class))) + 
  geom_bar(width = 1) +
  theme(axis.line = element_blank(), 
        plot.title = element_text(hjust=0.5)) + 
  labs(fill="class", 
       x=NULL, 
       y=NULL, 
       title="Pie Chart of Denographics", 
       caption="Benefiting from HAART Treatment") 

- A description of what the chart attempts to answer/understand (**1 point**)
- Selected the appropriate chart type / graphical encoding based on the question of interest and the data type(s) of the features (**3 point**)
- Appropriate labels/legends, depending on your chart type (**4 points**). Including, but not limited to:
    - X axis label (if there's an x axis)
- Y axis label (if there's an y axis)
    - Title (if there's an ability to add a title -- e.g., not a map)
- Legend for any encodings that are not immediately apparent
- Interprets information from the chart, honing in on important information (**2 points**)


## Code and Report structure (**7 points**) (Maxine & Stassney)
Code is broken up appropriately into the described files.
- Each file is in the appropriate folder: `scripts/`, except `index.Rmd`, which is in the root (**1 point**)
- Each file is loaded into the `index.Rmd` file (**1 point**)
- Only the `index.Rmd` file loads the data (**1 point**)
- Project uses appropriate packages and logic throughout to produce the report (**1 points**)
- All unused code is removed. (**1 point**)
- Comments are used throughout to express purpose of each section (**1 point**)

Report is professionally formatted, including (but not limtted to):
  - Using headers to delineate between sections (**1 point**)
- Removing any warnings/messages from your script in the report (**1 point**)


## Code clarity (**5 points**) (Khayla & Anura)
To earn full points, you must not have any `lintr()` errors.
