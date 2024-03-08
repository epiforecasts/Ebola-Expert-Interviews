### Forecasting the geographic spread of Ebola Virus Disease in the Democratic Republic of the Congo during the 2018-2020 outbreak

### Alicia Rosello

# Expert elicitation descriptive

## PREP

# packages
require(ggplot2)
require(lubridate)
require(dplyr)

# paths
files<-"Outputs/"
plots<-"Plots/"

## read in data
file<-paste0(files, "results_all.csv")
df<-read.csv(file, row.names = 1)

## experts
length(table(df$expert))
length(table(df$expert.date))
table(is.na(df$expert.date))
filter(df,forecast.month=="November 2019")%>%group_by(expert.date)%>%summarise(n=n())
length(unique(df$expert.date))
df%>%group_by(expert, institution)%>%summarise(n=n())%>%group_by(institution)%>%summarise(n=n())
df%>%group_by(expert, experience.ide)%>%summarise(n=n())%>%group_by(experience.ide)%>%summarise(n=n())
df%>%group_by(expert.date, last.in.field)%>%summarise(n=n())%>%group_by(last.in.field)%>%summarise(n=n())

## health zones
HZ_by_month<-df%>%group_by(forecast.month, HZ)%>%summarise(n=n())


## 
