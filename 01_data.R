### Forecasting the geographic spread of Ebola Virus Disease in the Democratic Republic of the Congo during the 2018-2020 outbreak

### Alicia Rosello

### Expert elicitation data outputted to .csv files

## PREP

# paths
files<-"Outputs/"

## source scripts to generate csvs
source("00_data_1.R")
df_nov19<-df
df_nov19$forecast.month<-time_period

source("00_data_2.R")
df_all_dec19<-df
df_all_dec19$forecast.month<-time_period
df_additional_HZ_dec19<-df_additional_HZ
df_additional_HZ_dec19$forecast.month<-time_period

source("00_data_3.R")
df_all_jan20<-df
df_all_jan20$forecast.month<-time_period
df_additional_HZ_jan20<-df_additional_HZ
df_additional_HZ_jan20$forecast.month<-time_period

source("00_data_4.R")
df_all_feb20<-df
df_all_feb20$forecast.month<-time_period
df_additional_HZ_feb20<-df_additional_HZ
df_additional_HZ_feb20$forecast.month<-time_period
  
source("00_data_5.R")
df_all_mar20<-df
df_all_mar20$forecast.month<-time_period
df_additional_HZ_mar20<-df_additional_HZ
df_additional_HZ_mar20$forecast.month<-time_period

## combine into dataset
df<-rbind(df_nov19, df_all_dec19, df_all_jan20, df_all_feb20, df_all_mar20)
df_additional_HZ<-rbind(df_additional_HZ_dec19, df_additional_HZ_jan20,  df_additional_HZ_feb20, df_additional_HZ_mar20)
  
## save dataset all
write.csv(df, file=paste0(files, "results_all.csv"))
write.csv(df_additional_HZ, file=paste0(files, "results_additional_HZ.csv"))


