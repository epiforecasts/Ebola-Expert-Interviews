### Forecasting the geographic spread of Ebola Virus Disease in the Democratic Republic of the Congo during the 2018-2020 outbreak

### Alicia Rosello

### Expert elicitation results 3 - data input January 2020

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
# forecast January 2020

HZ_considered<-c("OICHA", "MANDIMA", "BIENA", "BENI", "MABALAKO", "GOMA")

# period considered
time_period<-"January 2020"
time_period_FR<-"Janvier 2020"

# number of responses
n_responses<-8

# response exp1 17-12-2019 
chips_1<-c("1","3","5","5","3","2","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("1","4","5","4","3","2","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("1","3","5","5","3","2","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("0","0","1","2","3","4","4","3","2","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_5<-c("0","0","0","0","0","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1")
chips_6<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp1_BUTEMBO<-c("14","3","2","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
               low_bin=rep(low_bins, length(HZ_considered)),
               high_bin=rep(high_bins, length(HZ_considered)),
               date=rep("17-12-2019", times=length(HZ_considered)),
               chips=c(chips_1, chips_2, chips_3, chips_4, chips_5, chips_6),
               expert=rep("1",length(HZ_considered)),
               institution=rep("LSHTM",length(HZ_considered)), 
               last.in.field=rep(">2 weeks ago",length(HZ_considered)),
               experience.ide=rep(">5 years",length(HZ_considered)))

# response exp2 19-12-2019
chips_1<-c("9","5","3","1","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("0","1","5","7","6","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("0","8","10","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("0","0","10","5","4","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_5<-c("0","0","0","0","13","7","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_6<-c("18","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

chips_exp2_BUTEMBO<-c("3","12","5","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp2_KATWA<-c("3","12","5","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("19-12-2019", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4, chips_5, chips_6),
                expert=rep("2",length(HZ_considered)),
                institution=rep("WHO",length(HZ_considered)), 
                last.in.field=rep("<2 weeks ago",length(HZ_considered)),
                experience.ide=rep(">5 years",length(HZ_considered)))

df<-rbind(df, df1)

# response exp4 18-12-2019
chips_1<-c("1","6","5","2","1","2","3","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("1","3","3","4","4","2","0","0","3","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("6","5","4","2","1","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("5","5","5","3","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_5<-c("1","1","3","4","5","3","3","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_6<-c("11","7","0","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp4_BUTEMBO<-c("5","5","4","3","1","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("18-12-2019", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4, chips_5, chips_6),
                expert=rep("4",length(HZ_considered)),
                institution=rep("WHO",length(HZ_considered)), 
                last.in.field=rep("never",length(HZ_considered)),
                experience.ide=rep(">5 years",length(HZ_considered)))

df<-rbind(df, df1)

# response exp5 19-12-2019
chips_1<-c("17","3","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("1","5","9","4","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("18","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("0","0","4","7","5","3","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_5<-c("0","0","0","0","0","0","0","0","0","1","2","4","6","4","2","1","0","0","0","0","0","0","0","0","0")
chips_6<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp5_KALUNGUTA<-c("18","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp5_BUTEMBO<-c("19","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp5_KATWA<-c("19","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("19-12-2019", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4, chips_5, chips_6),
                expert=rep("5",length(HZ_considered)),
                institution=rep("WHO",length(HZ_considered)), 
                last.in.field=rep(">2 weeks ago",length(HZ_considered)),
                experience.ide=rep("<5 years",length(HZ_considered)))

df<-rbind(df, df1)

# response exp8 C23-12-2019)
chips_1<-c("7","5","3","2","2","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("2","3","5","4","3","2","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("7","6","3","2","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("8","5","3","2","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_5<-c("0","0","1","1","1","1","2","3","3","2","2","1","1","1","1","0","0","0","0","0","0","0","0","0","0")
chips_6<-c("18","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("23-12-2019", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4, chips_5, chips_6),
                expert=rep("8",length(HZ_considered)),
                institution=rep("MSF",length(HZ_considered)), 
                last.in.field=rep("<2 weeks ago",length(HZ_considered)),
                experience.ide=rep(">5 years",length(HZ_considered)))

df<-rbind(df, df1)

# response exp9 23-12-2019)
chips_1<-c("4","11","4","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("2","4","8","4","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("4","11","4","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("2","4","9","3","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_5<-c("0","0","1","4","10","4","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_6<-c("13","5","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp9_BUTEMBO<-c("3","4","9","3","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp9_KATWA<-c("3","4","9","3","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("23-12-2019", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4, chips_5, chips_6),
                expert=rep("9",length(HZ_considered)),
                institution=rep("MSF",length(HZ_considered)), 
                last.in.field=rep(">2 weeks ago",length(HZ_considered)),
                experience.ide=rep(">5 years",length(HZ_considered)))

df<-rbind(df, df1)

# response exp10 17-12-2019)
chips_1<-c("16","4","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("15","5","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("19","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("6","8","6","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_5<-c("6","8","6","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_6<-c("18","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("17-12-2019", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4, chips_5, chips_6),
                expert=rep("10",length(HZ_considered)),
                institution=rep("WHO",length(HZ_considered)), 
                last.in.field=rep("<2 weeks ago",length(HZ_considered)),
                experience.ide=rep("<5 years",length(HZ_considered)))

df<-rbind(df, df1)

# response exp11 23-12-2019)
chips_1<-c("0","0","3","3","5","7","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("0","0","0","0","0","0","0","0","0","4","4","5","4","3","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("8","7","5","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("1","3","4","5","4","2","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_5<-c("0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","1","1","2","4","6","4","2","0","0","0")
chips_6<-c("16","4","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp11_BUTEMBO<-c("9","7","4","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp11_MANGUREDJIPA<-c("10","7","3","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("23-12-2019", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4, chips_5, chips_6),
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
df$expert.date = factor(df$expert.date,levels(df$expert.date)[c(1,4:8,2,3)])


## add expert info on all other health zones
df_additional_HZ_BUTEMBO<-data.frame(HZ="BUTEMBO",
                                     low_bin=rep(low_bins,6),
                                     high_bin=rep(high_bins,6),
                                     chips=c(chips_exp1_BUTEMBO,chips_exp2_BUTEMBO,chips_exp4_BUTEMBO,
                                             chips_exp5_BUTEMBO, chips_exp9_BUTEMBO, chips_exp11_BUTEMBO),
                                     expert=c(rep("1", length(chips_exp1_BUTEMBO)),
                                              rep("2", length(chips_exp1_BUTEMBO)),
                                              rep("4", length(chips_exp1_BUTEMBO)),
                                              rep("5", length(chips_exp1_BUTEMBO)),
                                              rep("9", length(chips_exp1_BUTEMBO)),
                                              rep("11", length(chips_exp1_BUTEMBO))))

df_additional_HZ_KATWA<-data.frame(HZ="KATWA",
                                     low_bin=rep(low_bins,3),
                                     high_bin=rep(high_bins,3),
                                     chips=c(chips_exp2_KATWA,chips_exp5_KATWA,chips_exp9_KATWA),
                                     expert=c(rep("2", length(chips_exp2_KATWA)),
                                              rep("5", length(chips_exp2_KATWA)),
                                              rep("9", length(chips_exp2_KATWA))))

df_additional_HZ_KALUNGUTA<-data.frame(HZ="KALUNGUTA",
                                   low_bin=rep(low_bins,1),
                                   high_bin=rep(high_bins,1),
                                   chips=c(chips_exp5_KALUNGUTA),
                                   expert=c(rep("5", length(chips_exp5_KALUNGUTA))))

df_additional_HZ_MANGUREDJIPA<-data.frame(HZ="MANGUREDJIPA",
                                       low_bin=rep(low_bins,1),
                                       high_bin=rep(high_bins,1),
                                       chips=c(chips_exp11_MANGUREDJIPA),
                                       expert=c(rep("11", length(chips_exp11_MANGUREDJIPA))))


df_additional_HZ<-rbind(df_additional_HZ_BUTEMBO,df_additional_HZ_KATWA,df_additional_HZ_KALUNGUTA,df_additional_HZ_MANGUREDJIPA) 
df_additional_HZ$chips<-as.numeric(as.character(df_additional_HZ$chips))
df_additional_HZ$p<-df_additional_HZ$chips/20
experts<-df%>%group_by(expert,date, institution, last.in.field, experience.ide, expert.date)%>%summarise(n=n())%>%select(-n)
df_additional_HZ<-merge(df_additional_HZ, experts, by="expert")

# save dataset extra HZ
write.csv(df_additional_HZ, file=paste0(files, "results_", gsub(" ", "_", time_period), "_additional_HZ.csv"))


# # total chips all experts
# all.experts<-df_additional_HZ%>%group_by(HZ,low_bin)%>%summarise(chips.all.experts=sum(chips))
# # probabilities per HZ all experts
# all.experts_BUTEMBO<-all.experts%>%filter(HZ=="BUTEMBO")
# all.experts_BUTEMBO$p.all.experts<-all.experts_BUTEMBO$chips.all.experts/(20*length(unique(df_additional_HZ_BUTEMBO$expert)))
# all.experts_KATWA<-all.experts%>%filter(HZ=="KATWA")
# all.experts_KATWA$p.all.experts<-all.experts_KATWA$chips.all.experts/(20*length(unique(df_additional_HZ_KATWA$expert)))
# all.experts<-rbind(all.experts_BUTEMBO, all.experts_KATWA)
# # merge
# df_additional_HZ<-merge(df_additional_HZ, all.experts, by=c("HZ","low_bin"))
# # same order of rows as df
# df_additional_HZ<-df_additional_HZ[,names(df)]
# 
# # bind BUTEMBO and KATWA with other dataset
# df_all<-rbind(df, df_additional_HZ)
# 
# # save dataset all
# write.csv(df, file=paste0(files, "results_", gsub(" ", "_", time_period), "_with_additional_HZ.csv"))

