### Forecasting the geographic spread of Ebola Virus Disease in the Democratic Republic of the Congo during the 2018-2020 outbreak

### Alicia Rosello

### Expert elicitation results 4 - data input February 2020

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

HZ_considered<-c("BUNIA", "MANDIMA", "MAMBASA", "MUSIENENE", "KAYNA", "BENI", "MABALAKO", "KALUNGUTA", "KATWA", "BUTEMBO", "GOMA")

# period considered
time_period<-"February 2020"
time_period_FR<-"Février 2020"

# number of responses
n_responses<-11

# response exp1 17-01-2020 
chips_1<-c("18","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("2","4","5","4","3","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("2","4","5","4","3","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("18","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_5<-c("18","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_6<-c("1","2","3","4","4","3","2","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_7<-c("1","2","3","4","4","3","2","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_8<-c("18","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_9<-c("16","4","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_10<-c("10","5","3","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_11<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
               low_bin=rep(low_bins, length(HZ_considered)),
               high_bin=rep(high_bins, length(HZ_considered)),
               date=rep("17-01-2020", times=length(HZ_considered)),
               chips=c(chips_1, chips_2, chips_3, chips_4, chips_5, chips_6, chips_7, chips_8, chips_9, chips_10, chips_11),
               expert=rep("1",length(HZ_considered)),
               institution=rep("LSHTM",length(HZ_considered)), 
               last.in.field=rep(">2 weeks ago",length(HZ_considered)),
               experience.ide=rep(">5 years",length(HZ_considered)))

# reponse exp2 16-01-2020
chips_1<-c("15","4","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("4","11","3","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("2","11","5","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("7","10","2","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_5<-c("15","3","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_6<-c("0","2","12","4","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_7<-c("0","10","7","3","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_8<-c("0","4","9","4","3","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_9<-c("0","11","8","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_10<-c("0","9","6","3","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_11<-c("17","3","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

chips_exp2_OICHA<-c("4","12","4","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp2_BIENA<-c("14","3","2","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("16-01-2020", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4, chips_5, chips_6, chips_7, chips_8, chips_9, chips_10, chips_11),
                expert=rep("2",length(HZ_considered)),
                institution=rep("WHO",length(HZ_considered)), 
                last.in.field=rep("<2 weeks ago",length(HZ_considered)),
                experience.ide=rep(">5 years",length(HZ_considered)))

df<-rbind(df, df1)

# reponse exp3 15-01-2020
chips_1<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("0","0","0","1","2","8","8","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("12","8","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("17","3","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_5<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_6<-c("6","8","5","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_7<-c("0","0","0","0","0","7","9","3","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_8<-c("11","9","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_9<-c("11","9","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_10<-c("13","7","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_11<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

chips_exp3_LOLWA<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")


df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("15-01-2020", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4, chips_5, chips_6, chips_7, chips_8, chips_9, chips_10, chips_11),
                expert=rep("3",length(HZ_considered)),
                institution=rep("WHO",length(HZ_considered)), 
                last.in.field=rep(">2 weeks ago",length(HZ_considered)),
                experience.ide=rep(">5 years",length(HZ_considered)))

df<-rbind(df, df1)

# reponse exp4 17-01-2020
chips_1<-c("13","4","3","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("8","2","2","2","6","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("1","2","3","3","4","3","3","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("5","2","2","3","3","3","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_5<-c("16","4","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_6<-c("1","4","2","3","4","4","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_7<-c("0","0","0","0","2","3","4","5","3","2","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_8<-c("5","6","6","3","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_9<-c("1","2","4","5","4","2","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_10<-c("1","2","2","5","6","3","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_11<-c("18","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp4_BIENA<-c("1","3","4","5","5","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp4_VUHOVI<-c("9","4","3","2","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp4_OICHA<-c("6","6","6","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("17-01-2020", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4, chips_5, chips_6, chips_7, chips_8, chips_9, chips_10, chips_11),
                expert=rep("4",length(HZ_considered)),
                institution=rep("WHO",length(HZ_considered)), 
                last.in.field=rep("never",length(HZ_considered)),
                experience.ide=rep(">5 years",length(HZ_considered)))

df<-rbind(df, df1)

# reponse exp5 17-01-2020
chips_1<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("9","6","5","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("1","1","2","3","5","4","3","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("10","8","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_5<-c("18","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_6<-c("0","0","0","2","5","8","4","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_7<-c("0","0","0","0","0","3","5","7","4","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_8<-c("3","5","6","4","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_9<-c("3","4","6","5","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_10<-c("0","1","4","7","5","3","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_11<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp5_BIENA<-c("18","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp5_OICHA<-c("18","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("17-01-2020", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4, chips_5, chips_6, chips_7, chips_8, chips_9, chips_10, chips_11),
                expert=rep("5",length(HZ_considered)),
                institution=rep("WHO",length(HZ_considered)), 
                last.in.field=rep(">2 weeks ago",length(HZ_considered)),
                experience.ide=rep("<5 years",length(HZ_considered)))

df<-rbind(df, df1)

# reponse exp8 21-01-2020
chips_1<-c("11","3","2","1","1","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("7","3","2","2","2","2","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("7","4","3","2","2","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("11","5","1","1","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_5<-c("15","4","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_6<-c("4","3","3","2","2","1","1","1","1","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_7<-c("1","1","1","2","2","3","3","2","1","1","1","1","1","0","0","0","0","0","0","0","0","0","0","0","0")
chips_8<-c("8","5","3","2","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_9<-c("5","6","3","1","1","1","1","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_10<-c("7","4","2","1","1","1","1","1","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_11<-c("18","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

chips_exp8_BIENA<-c("16","2","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp8_VUHOVI<-c("16","2","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("21-01-2020", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4, chips_5, chips_6, chips_7, chips_8, chips_9, chips_10, chips_11),
                expert=rep("8",length(HZ_considered)),
                institution=rep("MSF",length(HZ_considered)), 
                last.in.field=rep("<2 weeks ago",length(HZ_considered)),
                experience.ide=rep(">5 years",length(HZ_considered)))

df<-rbind(df, df1)

# reponse exp9 22-01-2020)
chips_1<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("7","7","6","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("7","7","6","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_5<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_6<-c("0","4","6","6","4","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_7<-c("6","7","7","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_8<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_9<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_10<-c("8","7","5","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_11<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("22-01-2020", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4, chips_5, chips_6, chips_7, chips_8, chips_9, chips_10, chips_11),
                expert=rep("9",length(HZ_considered)),
                institution=rep("MSF",length(HZ_considered)), 
                last.in.field=rep(">2 weeks ago",length(HZ_considered)),
                experience.ide=rep(">5 years",length(HZ_considered)))

df<-rbind(df, df1)

# reponse exp11 22-01-2020
chips_1<-c("15","4","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("0","3","7","6","3","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("10","6","4","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("5","9","6","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_5<-c("15","5","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_6<-c("0","0","0","0","0","1","6","8","3","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_7<-c("0","0","0","0","0","2","3","8","5","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_8<-c("4","8","6","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_9<-c("3","7","8","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_10<-c("8","5","4","3","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_11<-c("15","3","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp11_OICHA<-c("1","10","8","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("22-01-2020", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4, chips_5, chips_6, chips_7, chips_8, chips_9, chips_10, chips_11),
                expert=rep("11",length(HZ_considered)),
                institution=rep("WHO",length(HZ_considered)), 
                last.in.field=rep("<2 weeks ago",length(HZ_considered)),
                experience.ide=rep("<5 years",length(HZ_considered)))

df<-rbind(df, df1)

# reponse exp12 16-01-2020
chips_1<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("6","5","3","3","1","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("1","4","7","5","2","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("5","7","4","2","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_5<-c("8","8","3","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_6<-c("0","0","0","2","4","4","4","4","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_7<-c("0","4","4","4","4","2","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_8<-c("4","4","4","3","2","2","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_9<-c("1","3","4","4","3","1","1","1","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_10<-c("1","3","4","4","2","2","1","1","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_11<-c("19","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_exp12_OICHA<-c("11","8","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("16-01-2020", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4, chips_5, chips_6, chips_7, chips_8, chips_9, chips_10, chips_11),
                expert=rep("12",length(HZ_considered)),
                institution=rep("LSHTM",length(HZ_considered)), 
                last.in.field=rep(">2 weeks ago",length(HZ_considered)),
                experience.ide=rep(">5 years",length(HZ_considered)))

df<-rbind(df, df1)

# reponse exp13 24-01-2020
chips_1<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("2","3","4","6","4","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("0","1","2","4","7","4","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("12","8","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_5<-c("12","8","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_6<-c("0","0","0","0","0","0","2","4","8","4","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_7<-c("4","7","5","3","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_8<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_9<-c("4","13","3","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_10<-c("4","13","3","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_11<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("24-01-2020", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4, chips_5, chips_6, chips_7, chips_8, chips_9, chips_10, chips_11),
                expert=rep("13",length(HZ_considered)),
                institution=rep("WHO",length(HZ_considered)), 
                last.in.field=rep("<2 weeks ago",length(HZ_considered)),
                experience.ide=rep(">5 years",length(HZ_considered)))

df<-rbind(df, df1)

# reponse exp14 28-01-2020
chips_1<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("3","13","4","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("12","7","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("2","9","9","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_5<-c("0","8","8","4","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_6<-c("0","0","0","0","4","7","7","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_7<-c("3","9","6","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_8<-c("4","12","4","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_9<-c("0","10","7","3","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_10<-c("12","7","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_11<-c("20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

chips_exp14_OICHA<-c("6","6","4","4","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("28-01-2020", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4, chips_5, chips_6, chips_7, chips_8, chips_9, chips_10, chips_11),
                expert=rep("14",length(HZ_considered)),
                institution=rep("WHO",length(HZ_considered)), 
                last.in.field=rep("<2 weeks ago",length(HZ_considered)),
                experience.ide=rep(">5 years",length(HZ_considered)))

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
df$expert.date = factor(df$expert.date,levels(df$expert.date)[c(1,6:11,2:5)]) # adjust


## add expert info on all other health zones
df_additional_HZ_OICHA<-data.frame(HZ="OICHA",
                                   low_bin=rep(low_bins,6),
                                   high_bin=rep(high_bins,6),
                                   chips=c(chips_exp2_OICHA,chips_exp4_OICHA,chips_exp5_OICHA,
                                           chips_exp11_OICHA, chips_exp12_OICHA, chips_exp14_OICHA),
                                   expert=c(rep("2", length(chips_exp2_OICHA)),
                                            rep("4", length(chips_exp2_OICHA)),
                                            rep("5", length(chips_exp2_OICHA)),
                                            rep("11", length(chips_exp2_OICHA)),
                                            rep("12", length(chips_exp2_OICHA)),
                                            rep("14", length(chips_exp2_OICHA))))

df_additional_HZ_BIENA<-data.frame(HZ="BIENA",
                                   low_bin=rep(low_bins,4),
                                   high_bin=rep(high_bins,4),
                                   chips=c(chips_exp2_BIENA,chips_exp4_BIENA,
                                           chips_exp5_BIENA,chips_exp8_BIENA),
                                   expert=c(rep("2", length(chips_exp2_BIENA)),
                                            rep("4", length(chips_exp2_BIENA)),
                                            rep("5", length(chips_exp2_BIENA)),
                                            rep("8", length(chips_exp2_BIENA))))

df_additional_HZ_LOLWA<-data.frame(HZ="LOLWA",
                                   low_bin=rep(low_bins,1),
                                   high_bin=rep(high_bins,1),
                                   chips=c(chips_exp3_LOLWA),
                                   expert=c(rep("3", length(chips_exp3_LOLWA))))

df_additional_HZ_VUHOVI<-data.frame(HZ="VUHOVI",
                                   low_bin=rep(low_bins,2),
                                   high_bin=rep(high_bins,2),
                                   chips=c(chips_exp4_VUHOVI,chips_exp8_VUHOVI),
                                   expert=c(rep("4", length(chips_exp4_VUHOVI)),
                                            rep("8", length(chips_exp8_VUHOVI))))

df_additional_HZ<-rbind(df_additional_HZ_OICHA, df_additional_HZ_BIENA,df_additional_HZ_LOLWA,df_additional_HZ_VUHOVI)
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
# all.experts_BIENA<-all.experts%>%filter(HZ=="BIENA")
# all.experts_BIENA$p.all.experts<-all.experts_BIENA$chips.all.experts/(20*length(unique(df_additional_HZ_BIENA$expert)))
# all.experts<-rbind(all.experts_OICHA, all.experts_BIENA)
# # merge
# df_additional_HZ<-merge(df_additional_HZ, all.experts, by=c("HZ","low_bin"))
# # same order of rows as df
# df_additional_HZ<-df_additional_HZ[,names(df)]
# 
# # bind OICHA and BIENA with other dataset
# df_all<-rbind(df, df_additional_HZ)
# 
# 
# # save dataset all
# write.csv(df, file=paste0(files, "results_", gsub(" ", "_", time_period), "_with_additional_HZ.csv"))


