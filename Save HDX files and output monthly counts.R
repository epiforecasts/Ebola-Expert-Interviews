##########################################
## saving copies of HDX and output monthly counts###
## AR
## Start: 06-01-2019
##########################################

### prep

# wd
getwd()
wdir<-"~/Documents/GitHub/Ebola-DRC-maps/"
setwd(wdir)

# packages
require(dplyr)
require(raster)
require(htmltools)
require(htmlwidgets)
library(spdep)
library(tidyverse)

### date
file.to.save<-"~/Documents/VEEPED/Ebola/Data/HDX/"
plot.to.save<-"~/Documents/VEEPED/Ebola/Expert elicitation/Results/Plots/"
# date<-Sys.Date()
date<-"2020-01-06"
  
  
### get data

# cases, from James
headers =  read.csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vSrr9DRaC2fXzPdmOxLW-egSYtxmEp_RKoYGggt-zOKYXSx4RjPsM4EO19H7OJVX1esTtIoFvlKFWcn/pub?gid=1564028913&single=true&output=csv", header = F, nrows = 1, as.is = TRUE)
evd_cases = read.csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vSrr9DRaC2fXzPdmOxLW-egSYtxmEp_RKoYGggt-zOKYXSx4RjPsM4EO19H7OJVX1esTtIoFvlKFWcn/pub?gid=1564028913&single=true&output=csv", skip = 2, header = F)
# evd_cases = read.csv("/Users/eoccaros/Documents/VEEPED/Ebola/Data/HDX/Data_ DRC Ebola Outbreak, North Kivu and Ituri - MOH-By-Health-Zone.csv", skip = 2, header = F)
colnames(evd_cases)= headers


### clean evd_cases
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
# evd_cases_2$rowN<-1:nrow(evd_cases_2)
# resolve those where the cases database and the spatial databases don't match
evd_cases_2$health_zone<-gsub("KAYINA", "KAYNA",evd_cases_2$health_zone)
evd_cases_2$health_zone<-as.character(evd_cases_2$health_zone)
evd_cases_2$health_zone<-gsub("MANGURUJIPA", "MANGUREDJIPA",evd_cases_2$health_zone)
evd_cases_2$health_zone<-as.character(evd_cases_2$health_zone)
evd_cases_2$health_zone<-gsub("N/A", NA ,evd_cases_2$health_zone)
# evd_cases_2$health_zone<-as.character(evd_cases_2$health_zone)
# evd_cases_2$health_zone<-gsub("NYANKUNDE", "NYAKUNDE",evd_cases_2$health_zone)
evd_cases_2$health_zone<-as.character(evd_cases_2$health_zone)
evd_cases_2$health_zone<-gsub("RWAMPARA \\(BUNIA)", "RWAMPARA" ,evd_cases_2$health_zone)
# remove cases where health zone not specified
evd_cases_3<-evd_cases_2[!is.na(evd_cases_2$health_zone),] #remove HZ with no name that has 1 case
# check if any NAs
table(is.na(evd_cases_3$health_zone))
table(is.na(evd_cases_3$total_cases))
table(evd_cases_3$health_zone)

# save
# write.csv(evd_cases_3, file=paste(file.to.save, date, "Data_ DRC Ebola Outbreak, North Kivu and Ituri - MOH-By-Health-Zone.csv"))


# read in data
evd_cases_3<-read.csv(file=paste0(file.to.save,date, " Data_ DRC Ebola Outbreak, North Kivu and Ituri - MOH-By-Health-Zone.csv"), row.names = 1)

# data cleaning
data<-evd_cases_3
data <- data%>%mutate_all(as.character)
data$total_cases <- as.numeric(data$total_cases)
data<-data[!is.na(data$total_cases),]
data <- data%>%group_by(health_zone,report_date)%>%summarise(total_cases=sum(total_cases))
data$report_date <- as.Date(data$report_date, "%Y-%m-%d")
data$total_cases_change<-NA
first_rows<-data%>%group_by(health_zone)%>%filter(report_date==min(report_date))
for(i in 2:nrow(data)){
  hz<-as.character(data[i,"health_zone"])
  rd<-first_rows[(first_rows$health_zone==hz),"report_date"]
  if(data[i,"report_date"]==rd){
    data$total_cases_change[i]<-NA
  }else{
    data$total_cases_change[i]<-data$total_cases[i]-data$total_cases[i-1]
  }
}
data[is.na(data$total_cases_change),]$total_cases_change<-0

# number of new cases in December per HZ
dec_data<-data%>%filter(report_date > "2019-11-30" & report_date < "2020-01-01")
new_cases_dec<-dec_data%>%group_by(health_zone)%>%filter(report_date==min(report_date)|report_date==max(report_date))%>%
  group_by(health_zone)%>%summarise(new.cases.dec=max(total_cases)-min(total_cases))


# plot
HZ_assessed<-c("BENI", "GOMA", "KALUNGUTA", "MABALAKO", "MAMBASA", "MANDIMA")
df<-new_cases_dec%>%filter((health_zone%in%HZ_assessed)|(new.cases.dec>0))
HZ_not_asessed<-(df[!df$health_zone%in%HZ_assessed,"health_zone"])[[1]]
df$health_zone_assessed<-as.character(df$health_zone%in%HZ_asessed)
df$health_zone <- as.factor(as.character(df$health_zone))
df$health_zone <- factor(df$health_zone, levels =  c(HZ_asessed, HZ_not_asessed))

plot1 <- ggplot(data=df,aes(x=health_zone, y=new.cases.dec, fill=health_zone_assessed))+
  geom_bar(stat="identity")+theme_bw()+xlab("Health zone")+ylab("Cases December 2019")+
  ylim(c(0,50))

ggsave(plot1, file=paste0(plot.to.save, "16-01-2020 HZ asessed with cases in December.png"))


