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
####       - Who is receiving HAART therapy? (Histogram on Categorical Variable)
####       - What demographics around the world are benefiting from HAART therapy? (Pie Chart)
####       - How accessibility to HAART therapy affects the prevalence of HIV in certain parts of the world?
  
### Data Source:

#### UNAIDS 2019 HIV estimates

"http://apps.who.int/gho/data/node.home"

#### UNAIDS 2019 HIV estimates treatments

"http://apps.who.int/gho/data/node.home"


#### Loading and viewing "by_area_hiv_est_from_1990-present.csv" file

data1<-read.csv("by_area_hiv_est_from_1990-present.csv", stringsAsFactors = FALSE)
data1<-data1[-(1:4),]
data1<-data1[,-2]
colnames(data1)<-data1[1,]
colnames(data1)[1:2]<-c("Year","Location")
data1<-data1[-1,]


View(data1)

#### Loading and viewing "by_area_hiv_treatment_est_from_1990-present.csv" file

data2<-read.csv("by_area_hiv_treatment_est_from_1990-present.csv", stringsAsFactors = FALSE)
data2<-data2[-(1:4),]
data2<-data2[,-2]
colnames(data2)<-data2[1,]
colnames(data2)[1:2]<-c("Year","Location")
data2<-data2[-1,]
dim(data1)
dim(data2)
intersect(colnames(data1),colnames(data2))
data<-merge(data1,data2,by=c("Year","Location"))
dim(data)

View(data2)

write.csv(data1, data2,file ="Merge_Data.csv") ## Does not work. 

View(Merge_Data.csv)                           ## I tried viewing this code but does not work.


## Summary Information (**15 points**) (Maxine)

Computes (and includes) 5 pieces of _relevant_ information using a function saved in a `script/` file. For each piece of information, make sure to:

- Compute the information accurately in the script (**1 point**)


- Include the piece of information using in-line R code in the paragraph (**1 point**)

- Make clear the relevance of including the information (if not apparent) (**1 point**)


## Summary Table (**10 points**) (Stassney)
- Introduces the table, explaining why the particular grouping calculation was performed (**2 points**)

- Creates a summarized data frame to include as the table using `group_by()` (**2 points**)

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

# Who is receiving HAART therapy? (Histogram on Categorical Variable) data 2

qplot(data1$Location, geom= "histogram"))

g + geom_bar(aes(fill=), width = 0.5) + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) + 
  labs(title="Histogram on Categorical Variable", 
       subtitle="People Receieving HAART Treatment")   

# What demographics around the world are benefiting from HAART therapy? (Pie Chart)

pie <- ggplot(mpg, aes(x = "", fill = factor(class))) + 
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
- -1 point for 1 - 2 `lintr` errors
- -2 points for 3 - 4 `lintr` errors
- -3 points for 5 - 6 `lintr` errors
- -4 points for 7 - 8 `lintr` errors
- -5 points for 9+ `lintr` errors
