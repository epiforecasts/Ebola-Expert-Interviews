### Forecasting the geographic spread of Ebola Virus Disease in the Democratic Republic of the Congo during the 2018-2020 outbreak

### Alicia Rosello

# Expert elicitation cumulative results

## PREP

# packages
require(dplyr)
require(data.table)

# paths
files<-"Outputs/"

# read in data
file<-paste0(files, "results_", gsub(" ", "_", time_period), ".csv")
df<-read.csv(file)
# file_all_HZ<-paste0(files, "results_", gsub(" ", "_", time_period), "_with_additional_HZ.csv")
# df<-read.csv(file_all_HZ)


# french label
if (time_period=="November 2019"){
  time_period_FR<-"Novembre 2019"
}else if(time_period=="December 2019"){
  time_period_FR<-"Décembre 2019"
}else if(time_period=="January 2020"){
  time_period_FR<-"Janvier 2020"
}else if(time_period=="February 2020"){
  time_period_FR<-"Février 2020"
}else if(time_period=="March 2020"){
  time_period_FR<-"Mars 2020"
}else(print("Error scenario"))

# read in HZ rated by all experts
df<-read.csv(file=file, row.names = 1)

df_p_larger_or_equal_2<-df%>%filter(low_bin==0)%>%mutate(p_cm=">=2", p_cm_val=1-p)%>%dplyr::select(HZ, date, expert, expert.date, p_cm_val, p_cm)
df_p_larger_or_equal_6<-df%>%filter(low_bin>=6)%>%group_by(HZ, date, expert, expert.date)%>%summarise(p_cm_val=sum(p))%>%mutate(p_cm=">=6")
df_p_larger_or_equal_10<-df%>%filter(low_bin>=10)%>%group_by(HZ, date, expert, expert.date)%>%summarise(p_cm_val=sum(p))%>%mutate(p_cm=">=10")
df_p_larger_or_equal_20<-df%>%filter(low_bin>=20)%>%group_by(HZ, date, expert, expert.date)%>%summarise(p_cm_val=sum(p))%>%mutate(p_cm=">=20")

df_cm<-rbindlist(list(df_p_larger_or_equal_2,df_p_larger_or_equal_6,df_p_larger_or_equal_10,df_p_larger_or_equal_20))

# save
write.csv(df_cm, file=paste0(files, "results_", gsub(" ", "_", time_period), "_cm.csv"))

# remove  dataset created
rm("df_cm")


