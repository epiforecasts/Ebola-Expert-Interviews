### Forecasting the geographic spread of Ebola Virus Disease in the Democratic Republic of the Congo during the 2018-2020 outbreak

### Alicia Rosello

### Expert elicitation results 2 - data input December 2019

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
# forecast December 2019

HZ_considered<-c("MANDIMA", "MAMBASA", "BENI", "MABALAKO","KALUNGUTA", "GOMA")

# period considered
time_period<-"December 2019"
time_period_FR<-"Décembre 2019"

# number of responses
n_responses<-10

# response exp1 11-11-2019 
chips_1<-c("4","4","4","4","4","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("4","4","4","4","4","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("10","4","3","2","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("4","4","4","4","4","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_5<-c("10","4","3","2","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_6<-c("18","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp1_KOMANDA<-c("4","4","4","4","4","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp1_OICHA<-c("4","4","4","4","4","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
               low_bin=rep(low_bins, length(HZ_considered)),
               high_bin=rep(high_bins, length(HZ_considered)),
               date=rep("11-11-2019", times=length(HZ_considered)),
               chips=c(chips_1, chips_2, chips_3, chips_4, chips_5, chips_6),
               expert=rep("1",length(HZ_considered)),
               institution=rep("LSHTM",length(HZ_considered)), 
               last.in.field=rep("<2 weeks ago",length(HZ_considered)),
               experience.ide=rep(">5 years",length(HZ_considered)))

# response exp2 12-11-2019
chips_1<-c("1","4","9","4","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("6","9","4","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("1","3","8","4","2","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("1","2","7","4","3","2","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_5<-c("3","9","5","2","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_6<-c("8","5","4","1","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

chips_exp2_OICHA<-c("12","5","2","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp2_KOMANDA<-c("8","8","2","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("12-11-2019", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4, chips_5, chips_6),
                expert=rep("2",length(HZ_considered)),
                institution=rep("WHO",length(HZ_considered)), 
                last.in.field=rep("<2 weeks ago",length(HZ_considered)),
                experience.ide=rep(">5 years",length(HZ_considered)))

df<-rbind(df, df1)

# response exp3 15-11-2019
chips_1<-c("6","6","4","3","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("7","6","6","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("5","5","5","4","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("3","6","4","5","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_5<-c("10","10","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_6<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp3_LOLWA<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp3_OICHA<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp3_KOMANDA<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("15-11-2019", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4, chips_5, chips_6),
                expert=rep("3",length(HZ_considered)),
                institution=rep("WHO",length(HZ_considered)), 
                last.in.field=rep(">2 weeks ago",length(HZ_considered)),
                experience.ide=rep(">5 years",length(HZ_considered)))

df<-rbind(df, df1)

# response exp4 15-11-2019
chips_1<-c("0","0","0","0","0","0","3","3","5","4","3","2","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("0","1","3","4","4","3","2","1","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("0","0","0","1","1","4","4","4","2","2","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("0","0","0","0","0","1","3","5","5","4","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_5<-c("0","1","4","6","3","2","1","1","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_6<-c("10","4","0","0","2","2","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp4_OICHA<-c("11","6","3","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp4_BUTEMBO<-c("11","9","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp4_KATWA<-c("10","10","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp4_MAKISO_KISANGANI<-c("10","7","2","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("15-11-2019", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4, chips_5, chips_6),
                expert=rep("4",length(HZ_considered)),
                institution=rep("WHO",length(HZ_considered)), 
                last.in.field=rep("never",length(HZ_considered)),
                experience.ide=rep(">5 years",length(HZ_considered)))

df<-rbind(df, df1)

# response exp5 15-11-2019
chips_1<-c("14","6","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("16","4","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("0","3","11","6","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("0","0","0","2","7","8","3","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_5<-c("18","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_6<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp5_OICHA<-c("19","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("15-11-2019", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4, chips_5, chips_6),
                expert=rep("5",length(HZ_considered)),
                institution=rep("WHO",length(HZ_considered)), 
                last.in.field=rep("<2 weeks ago",length(HZ_considered)),
                experience.ide=rep("<5 years",length(HZ_considered)))

df<-rbind(df, df1)


# response exp6 20-11-2019
chips_1<-c("10","7","3","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("14","4","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("14","6","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("8","11","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_5<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_6<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("20-11-2019", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4, chips_5, chips_6),
                expert=rep("6",length(HZ_considered)),
                institution=rep("MoH",length(HZ_considered)), 
                last.in.field=rep("<2 weeks ago",length(HZ_considered)),
                experience.ide=rep(">5 years",length(HZ_considered)))

df<-rbind(df, df1)

# response exp7 22-11-2019)
chips_1<-c("5","4","4","3","2","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("8","6","4","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("6","4","2","1","1","1","1","1","1","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("10","7","3","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_5<-c("11","7","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_6<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("22-11-2019", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4, chips_5, chips_6),
                expert=rep("7",length(HZ_considered)),
                institution=rep("LSHTM",length(HZ_considered)), 
                last.in.field=rep("<2 weeks ago",length(HZ_considered)),
                experience.ide=rep("<5 years",length(HZ_considered)))

df<-rbind(df, df1)

# response exp8 C22-11-2019)
chips_1<-c("2","4","6","3","2","1","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("7","4","3","2","1","1","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("0","0","1","2","3","3","3","3","3","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("0","0","0","0","0","0","1","1","1","2","3","4","3","2","1","1","1","0","0","0","0","0","0","0","0")
chips_5<-c("4","5","5","4","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_6<-c("11","6","2","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp8_BUTEMBO<-c("10","10","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp8_KATWA<-c("10","10","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")


df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("22-11-2019", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4, chips_5, chips_6),
                expert=rep("8",length(HZ_considered)),
                institution=rep("MSF",length(HZ_considered)), 
                last.in.field=rep(">2 weeks ago",length(HZ_considered)),
                experience.ide=rep(">5 years",length(HZ_considered)))

df<-rbind(df, df1)

# response exp9 22-11-2019)
chips_1<-c("9","8","3","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("10","8","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("10","8","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_5<-c("8","8","4","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_6<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp9_KOMANDA<-c("14","6","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp9_OICHA<-c("8","8","4","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")


df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("22-11-2019", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4, chips_5, chips_6),
                expert=rep("9",length(HZ_considered)),
                institution=rep("MSF",length(HZ_considered)), 
                last.in.field=rep(">2 weeks ago",length(HZ_considered)),
                experience.ide=rep(">5 years",length(HZ_considered)))

df<-rbind(df, df1)

# response exp10 14-11-2019)
chips_1<-c("5","0","0","0","3","3","0","9","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("10","2","2","0","0","6","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("0","0","0","0","0","0","0","0","0","2","3","4","5","6","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("0","0","0","0","0","0","0","0","0","2","3","4","5","6","0","0","0","0","0","0","0","0","0","0","0")
chips_5<-c("10","7","3","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_6<-c("14","6","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp10_OICHA<-c("10","10","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp10_KOMANDA<-c("11","9","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp10_NYANKUNDE<-c("13","7","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")


df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("14-11-2019", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4, chips_5, chips_6),
                expert=rep("10",length(HZ_considered)),
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
df$expert.date = factor(df$expert.date,levels(df$expert.date)[c(1,3:10,2)])


## add expert info on all other health zones
df_additional_HZ_OICHA<-data.frame(HZ="OICHA",
                                   low_bin=rep(low_bins,7),
                                   high_bin=rep(high_bins,7),
                                   chips=c(chips_exp1_OICHA,chips_exp2_OICHA,chips_exp3_OICHA,
                                           chips_exp4_OICHA, chips_exp5_OICHA, chips_exp9_OICHA,
                                           chips_exp10_OICHA),
                                   expert=c(rep("1", length(chips_exp1_OICHA)),
                                            rep("2", length(chips_exp1_OICHA)),
                                            rep("3", length(chips_exp1_OICHA)),
                                            rep("4", length(chips_exp1_OICHA)),
                                            rep("5", length(chips_exp1_OICHA)),
                                            rep("9", length(chips_exp1_OICHA)),
                                            rep("10", length(chips_exp1_OICHA))))

df_additional_HZ_KOMANDA<-data.frame(HZ="KOMANDA",
                                     low_bin=rep(low_bins,5),
                                     high_bin=rep(high_bins,5),
                                     chips=c(chips_exp1_KOMANDA,chips_exp2_KOMANDA,chips_exp3_KOMANDA,
                                             chips_exp9_KOMANDA,chips_exp10_KOMANDA),
                                     expert=c(rep("1", length(chips_exp1_OICHA)),
                                              rep("2", length(chips_exp1_OICHA)),
                                              rep("3", length(chips_exp1_OICHA)),
                                              rep("9", length(chips_exp1_OICHA)),
                                              rep("10", length(chips_exp1_OICHA))))

df_additional_HZ_BUTEMBO<-data.frame(HZ="BUTEMBO",
                                   low_bin=rep(low_bins,2),
                                   high_bin=rep(high_bins,2),
                                   chips=c(chips_exp4_BUTEMBO, chips_exp8_BUTEMBO),
                                   expert=c(rep("4", length(chips_exp4_BUTEMBO)),
                                            rep("8", length(chips_exp8_BUTEMBO))))

df_additional_HZ_KATWA<-data.frame(HZ="KATWA",
                                     low_bin=rep(low_bins,2),
                                     high_bin=rep(high_bins,2),
                                     chips=c(chips_exp4_KATWA, chips_exp8_KATWA),
                                     expert=c(rep("4", length(chips_exp4_KATWA)),
                                              rep("8", length(chips_exp8_KATWA))))

df_additional_HZ_LOLWA<-data.frame(HZ="LOLWA",
                                       low_bin=rep(low_bins,1),
                                       high_bin=rep(high_bins,1),
                                       chips=c(chips_exp3_LOLWA),
                                       expert=c(rep("3", length(chips_exp3_LOLWA))))

df_additional_HZ_MAKISO_KISANGANI<-data.frame(HZ="MAKISO_KISANGANI",
                                     low_bin=rep(low_bins,1),
                                     high_bin=rep(high_bins,1),
                                     chips=c(chips_exp4_MAKISO_KISANGANI),
                                     expert=c(rep("4", length(chips_exp4_MAKISO_KISANGANI))))

df_additional_HZ_NYANKUNDE<-data.frame(HZ="NYANKUNDE",
                                              low_bin=rep(low_bins,1),
                                              high_bin=rep(high_bins,1),
                                              chips=c(chips_exp10_NYANKUNDE),
                                              expert=c(rep("10", length(chips_exp10_NYANKUNDE))))


df_additional_HZ<-rbind(df_additional_HZ_OICHA, 
                        df_additional_HZ_KOMANDA,
                        df_additional_HZ_BUTEMBO,
                        df_additional_HZ_KATWA,
                        df_additional_HZ_LOLWA,
                        df_additional_HZ_MAKISO_KISANGANI,
                        df_additional_HZ_NYANKUNDE)
df_additional_HZ$chips<-as.numeric(as.character(df_additional_HZ$chips))
df_additional_HZ$p<-df_additional_HZ$chips/20
experts<-df%>%group_by(expert,date, institution, last.in.field, experience.ide, expert.date)%>%summarise(n=n())%>%select(-n)
df_additional_HZ<-merge(df_additional_HZ, experts, by="expert")

# save dataset extra HZ
write.csv(df_additional_HZ, file=paste0(files, "results_", gsub(" ", "_", time_period), "_additional_HZ.csv"))


# # total chips all experts
# all.experts<-df_additional_HZ%>%group_by(HZ,low_bin)%>%summarise(chips.all.experts=sum(chips))
# # probabilities per HZ all experts
# all.experts_OICHA<-all.experts%>%filter(HZ=="OICHA")
# all.experts_OICHA$p.all.experts<-all.experts_OICHA$chips.all.experts/(20*length(unique(df_additional_HZ_OICHA$expert)))
# all.experts_KOMANDA<-all.experts%>%filter(HZ=="KOMANDA")
# all.experts_KOMANDA$p.all.experts<-all.experts_KOMANDA$chips.all.experts/(20*length(unique(df_additional_HZ_KOMANDA$expert)))
# all.experts<-rbind(all.experts_OICHA, all.experts_KOMANDA)
# # merge
# df_additional_HZ<-merge(df_additional_HZ, all.experts, by=c("HZ","low_bin"))
# # same order of rows as df
# df_additional_HZ<-df_additional_HZ[,names(df)]
# 
# # bind OICHA and KOMANDA with other dataset
# df_all<-rbind(df, df_additional_HZ)
# 
# # save dataset all
# write.csv(df, file=paste0(files, "results_", gsub(" ", "_", time_period), "_with_additional_HZ_3ormore_experts.csv"))

