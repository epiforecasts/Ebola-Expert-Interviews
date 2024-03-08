### Forecasting the geographic spread of Ebola Virus Disease in the Democratic Republic of the Congo during the 2018-2020 outbreak

### Alicia Rosello

### Expert elicitationresults 5 - data input March 2020

## PREP

# packages
require(dplyr)

# paths
files<-"Outputs/"
plots<-"Plots/"

# bins
low_bins<-seq(from=0,to=48,by=2)
high_bins<-seq(from=2, to=50, by=2)




# ----------------------------------------------------------------
# forecast February 2020

HZ_considered<-c("MANDIMA", "BENI", "BUTEMBO", "GOMA")

# period considered
time_period<-"March 2020"
time_period_FR<-"Mars 2020"

# number of responses
n_responses<-8

# response exp13 18-02-2020 
chips_1<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("12","8","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("18","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
               low_bin=rep(low_bins, length(HZ_considered)),
               high_bin=rep(high_bins, length(HZ_considered)),
               date=rep("18-02-2020", times=length(HZ_considered)),
               chips=c(chips_1, chips_2, chips_3, chips_4),
               expert=rep("13",length(HZ_considered)),
               institution=rep("WHO",length(HZ_considered)), 
               last.in.field=rep("<2 weeks ago",length(HZ_considered)),
               experience.ide=rep(">5 years",length(HZ_considered)))

# response exp1 18-02-2020
chips_1<-c("18","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("10","8","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("18","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("18","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("18-02-2020", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4),
                expert=rep("1",length(HZ_considered)),
                institution=rep("LSHTM",length(HZ_considered)), 
                last.in.field=rep(">2 weeks ago",length(HZ_considered)),
                experience.ide=rep(">5 years",length(HZ_considered)))

df<-rbind(df, df1)

# response exp8 20-02-2020
chips_1<-c("10","3","2","2","1","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("15","2","1","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("17","2","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("19","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

chips_exp8_MABALAKO<-c("10","4","3","2","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")


df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("20-02-2020", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4),
                expert=rep("8",length(HZ_considered)),
                institution=rep("MSF",length(HZ_considered)), 
                last.in.field=rep("<2 weeks ago",length(HZ_considered)),
                experience.ide=rep(">5 years",length(HZ_considered)))

df<-rbind(df, df1)

# response exp4 21-02-2020
chips_1<-c("9","5","3","3","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("3","7","7","3","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("6","6","6","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("17","3","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

chips_exp4_MABALAKO<-c("13","7","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")


df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("21-02-2020", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4),
                expert=rep("4",length(HZ_considered)),
                institution=rep("WHO",length(HZ_considered)), 
                last.in.field=rep("never",length(HZ_considered)),
                experience.ide=rep(">5 years",length(HZ_considered)))
df<-rbind(df, df1)

# response exp5 21-02-2020
chips_1<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("19","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("21-02-2020", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4),
                expert=rep("5",length(HZ_considered)),
                institution=rep("WHO",length(HZ_considered)), 
                last.in.field=rep(">2 weeks ago",length(HZ_considered)),
                experience.ide=rep("<5 years",length(HZ_considered)))

df<-rbind(df, df1)

# response exp9 24-02-2020
chips_1<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("15","5","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("24-02-2020", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4),
                expert=rep("9",length(HZ_considered)),
                institution=rep("MSF",length(HZ_considered)), 
                last.in.field=rep(">2 weeks ago",length(HZ_considered)),
                experience.ide=rep(">5 years",length(HZ_considered)))

df<-rbind(df, df1)

# response exp3 25-02-2020
chips_1<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("25-02-2020", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4),
                expert=rep("3",length(HZ_considered)),
                institution=rep("WHO",length(HZ_considered)), 
                last.in.field=rep(">2 weeks ago",length(HZ_considered)),
                experience.ide=rep(">5 years",length(HZ_considered)))

df<-rbind(df, df1)

# response exp11 25-02-2020
chips_1<-c("19","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("13","7","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("19","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

chips_exp11_MABALAKO<-c("17","3","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("25-02-2020", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4),
                expert=rep("11",length(HZ_considered)),
                institution=rep("WHO",length(HZ_considered)), 
                last.in.field=rep("<2 weeks ago",length(HZ_considered)),
                experience.ide=rep("<5 years",length(HZ_considered)))

df<-rbind(df, df1)



## aggregate results
df$chips<-as.numeric(as.character(df$chips))

# probabilities
df$p<-df$chips/20

# how many chips per HZ placed?
df%>%group_by(HZ)%>%summarise(sum.chips=sum(chips))

# total chips all experts
all.experts<-df%>%group_by(HZ,low_bin)%>%summarise(chips.all.experts=sum(chips))

# probabilities per HZ
all.experts$p.all.experts<-all.experts$chips.all.experts/(n_responses*20)

# merge
df<-merge(df, all.experts, by=c("HZ","low_bin"))

# add expert and date into one col
df$expert.date<-paste("expert",df$expert, df$date)

# output
write.csv(df, file=paste0(files, "results_", gsub(" ", "_", time_period), ".csv"))

# factor level for experts
df$expert.date<-as.factor(df$expert.date)
df$expert.date = factor(df$expert.date,levels(df$expert.date)[c(1,4:8,2,3)]) # adjust


## add expert info on all other health zones
df_additional_HZ_MABALAKO<-data.frame(HZ="MABALAKO",
                                   low_bin=rep(low_bins,3),
                                   high_bin=rep(high_bins,3),
                                   chips=c(chips_exp4_MABALAKO,chips_exp8_MABALAKO,chips_exp11_MABALAKO),
                                   expert=c(rep("4", length(chips_exp4_MABALAKO)),
                                            rep("8", length(chips_exp8_MABALAKO)),
                                            rep("11", length(chips_exp11_MABALAKO))))

df_additional_HZ<-df_additional_HZ_MABALAKO
df_additional_HZ$chips<-as.numeric(as.character(df_additional_HZ$chips))
df_additional_HZ$p<-df_additional_HZ$chips/20
experts<-df%>%group_by(expert,date, institution, last.in.field, experience.ide, expert.date)%>%summarise(n=n())%>%select(-n)
df_additional_HZ<-merge(df_additional_HZ, experts, by="expert")

# save dataset extra HZ
write.csv(df_additional_HZ, file=paste0(files, "results_", gsub(" ", "_", time_period), "_additional_HZ.csv"))


# # total chips all experts
# all.experts<-df_additional_HZ%>%group_by(HZ,low_bin)%>%summarise(chips.all.experts=sum(chips))
# # probabilities per HZ all experts
# all.experts_MABALAKO<-all.experts%>%filter(HZ=="MABALAKO")
# all.experts_MABALAKO$p.all.experts<-all.experts_MABALAKO$chips.all.experts/(20*length(unique(df_additional_HZ_MABALAKO$expert)))
# all.experts<-all.experts_MABALAKO
# # merge
# df_additional_HZ<-merge(df_additional_HZ, all.experts, by=c("HZ","low_bin"))
# # same order of rows as df
# df_additional_HZ<-df_additional_HZ[,names(df)]
# 
# # bind with other dataset
# df_all<-rbind(df, df_additional_HZ)
# 
# # save dataset all
# write.csv(df, file=paste0(files, "results_", gsub(" ", "_", time_period), "_with_additional_HZ.csv"))


