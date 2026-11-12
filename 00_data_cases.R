### Forecasting the geographic spread of Ebola Virus Disease in the Democratic Republic of the Congo during the 2018-2020 outbreak

### Alicia Rosello

### Obtain and clean data


# packages
require(dplyr)
require(lubridate)

# paths
files<-"Outputs/"
plots<-"Plots/"

# get data
headers =  read.csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vSrr9DRaC2fXzPdmOxLW-egSYtxmEp_RKoYGggt-zOKYXSx4RjPsM4EO19H7OJVX1esTtIoFvlKFWcn/pub?gid=1564028913&single=true&output=csv", header = F, nrows = 1, as.is = TRUE)
evd_cases = read.csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vSrr9DRaC2fXzPdmOxLW-egSYtxmEp_RKoYGggt-zOKYXSx4RjPsM4EO19H7OJVX1esTtIoFvlKFWcn/pub?gid=1564028913&single=true&output=csv", skip = 2, header = F)
colnames(evd_cases)= headers

# correct classes
evd_cases_2<-evd_cases
evd_cases_2$total_cases<-as.numeric(as.character(evd_cases_2$total_cases))
evd_cases_2<-as.data.frame(evd_cases_2)
evd_cases_2$health_zone<-toupper(as.character(evd_cases_2$health_zone))
evd_cases_2<-evd_cases_2%>%mutate_all(as.character)
evd_cases_2$total_cases<-as.numeric(evd_cases_2$total_cases)
# only keep records with 1 or more cases
evd_cases_2<-evd_cases_2%>%filter(total_cases>0)
# add a row column in case any problems later
evd_cases_2$rowN<-1:nrow(evd_cases_2)
# resolve those where the cases database and the spatial databases don't match
evd_cases_2$health_zone<-gsub("KAYINA", "KAYNA",evd_cases_2$health_zone)
evd_cases_2$health_zone<-as.character(evd_cases_2$health_zone)
evd_cases_2$health_zone<-gsub("MANGURUJIPA", "MANGUREDJIPA",evd_cases_2$health_zone)
evd_cases_2$health_zone<-as.character(evd_cases_2$health_zone)
evd_cases_2$health_zone<-gsub("N/A", NA ,evd_cases_2$health_zone)
evd_cases_2$health_zone<-as.character(evd_cases_2$health_zone)
evd_cases_2$health_zone<-gsub("RWAMPARA \\(BUNIA)", "RWAMPARA" ,evd_cases_2$health_zone)
# remove cases where health zone not specified
evd_cases_3<-evd_cases_2[!is.na(evd_cases_2$health_zone),] #remove HZ with no name that has 1 case
# check if any NAs
table(is.na(evd_cases_3$health_zone))
table(is.na(evd_cases_3$total_cases))
# include all cases since beginning of outbreak and store this into evd_cases_max
evd_cases_max<-evd_cases_3%>%group_by(country, province, health_zone)%>%summarise(total_cases=max(na.omit(total_cases)))
evd_cases_max<-evd_cases_max[,c("health_zone","total_cases")]
# include only cases in the study period
evd_cases_3$report_date<-as.Date(evd_cases_3$report_date)
min_date<-as.Date("2019-11-01")
max_date<-as.Date("2020-04-01")
# add month and year
evd_cases_3$month<-lubridate::month(evd_cases_3$report_date,label = T, abbr = FALSE)
evd_cases_3$year<-year(evd_cases_3$report_date)
evd_cases_3$month_year<-paste(evd_cases_3$month,evd_cases_3$year)
# only dates during study period considered, remove unwanted cols
evd_cases_study_period<-evd_cases_3%>%filter(report_date>min_date & report_date<max_date)%>%group_by(country, province, health_zone, month, year, month_year)%>%summarise(cases_total=max(na.omit(total_cases))-min(na.omit(total_cases)))
evd_cases_study_period<-evd_cases_study_period[,c("health_zone","month", "year", "month_year","cases_total")]
# rename variables
evd_cases_study_period$HZ<-evd_cases_study_period$health_zone
evd_cases_study_period$forecast.month<-evd_cases_study_period$month_year