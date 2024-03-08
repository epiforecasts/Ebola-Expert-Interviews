### Forecasting the geographic spread of Ebola Virus Disease in the Democratic Republic of the Congo during the 2018-2020 outbreak

### Alicia Rosello

### Generate expert elicitation plots

## PREP

# packages
require(ggplot2)
require(dplyr)
require(lubridate)

# paths
files<-"Outputs/"
plots<-"Plots/"

### GET DATA
source("00_data_cases.R")

### PLOTS

## Nov
time_period<-"November 2019"
time_period_FR<-"Novembre 2019"
source("00_plots.R")
df_cm_nov2019<-df_cm

## Dec
time_period<-"December 2019"
time_period_FR<-"Décembre 2019"
source("00_plots.R")
df_cm_dec2019<-df_cm

## Jan
time_period<-"January 2020"
time_period_FR<-"Janvier 2020"
source("00_plots.R")
df_cm_jan2020<-df_cm

## Feb
time_period<-"February 2020"
time_period_FR<-"Février 2020"
source("00_plots.R")
df_cm_feb2020<-df_cm

## Mar
time_period<-"March 2020"
time_period_FR<-"Mars 2020"
source("00_plots.R")
df_cm_mar2020<-df_cm


### COMBINATON PLOTS

# merge datasets
df_cm_nov2019$forecast.month<-"November 2019"
df_cm_dec2019$forecast.month<-"December 2019"
df_cm_jan2020$forecast.month<-"January 2020"
df_cm_feb2020$forecast.month<-"February 2020"
df_cm_mar2020$forecast.month<-"March 2020"
big_dataset_cm<-rbind(df_cm_nov2019,df_cm_dec2019,df_cm_jan2020,df_cm_feb2020,df_cm_mar2020)

# merge cases with cm dataset with all expert forecasts
big_dataset_cm_with_data<-merge(x=evd_cases_study_period, y=big_dataset_cm, by=c("HZ","forecast.month"))
# only HZs in study
evd_cases_study_period<-evd_cases_study_period[evd_cases_study_period$health_zone%in%big_dataset_cm$HZ,]
# find threshold
big_dataset_cm_with_data$p_threshold<-big_dataset_cm_with_data$p_cm
big_dataset_cm_with_data$p_threshold<-gsub('^.{2}','',big_dataset_cm_with_data$p_threshold)
# do cases meet threshold?
big_dataset_cm_with_data$meeting_threshold<-as.numeric(as.character(big_dataset_cm_with_data$cases_total))>=as.numeric(as.character(big_dataset_cm_with_data$p_threshold))
# factor levels
big_dataset_cm_with_data$forecast.month<-factor(big_dataset_cm_with_data$forecast.month, levels = c("November 2019","December 2019","January 2020", "February 2020", "March 2020"))

# remove november
big_dataset_cm_with_data_non_pilot<-filter(big_dataset_cm_with_data,month_year!="November 2019") 

# plots
plot_all<-ggplot(data=big_dataset_cm_with_data, aes(x=p_cm, p_cm_val, col=meeting_threshold))+
  geom_boxplot()+facet_wrap(~HZ+forecast.month)+
  scale_y_continuous(name="Probability")+
  scale_x_discrete(name=paste("Predicted new EVD cases reported (confirmed+probable)"))+
  guides(col=guide_legend(title="Threshold met"))+
  theme_bw()

plot_all_non_pilot<-ggplot(data=big_dataset_cm_with_data_non_pilot, aes(x=p_cm, p_cm_val, col=meeting_threshold))+
  geom_boxplot()+facet_wrap(~HZ+forecast.month)+
  scale_y_continuous(name="Probability")+
  scale_x_discrete(name=paste("Predicted new EVD cases reported (confirmed+probable)"))+
  guides(col=guide_legend(title="Threshold met"))+
  theme_bw()

# save plots
ggsave(plot_all, file=paste0(plots, Sys.Date(), "_all_HZ_month_years_cm_bw.png"), width=25, height=20, units = "cm")
ggsave(plot_all_non_pilot, file=paste0(plots, Sys.Date(), "_non_pilot_HZ_month_years_cm_bw.png"), width=25, height=20, units = "cm")
