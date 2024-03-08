### Forecasting the geographic spread of Ebola Virus Disease in the Democratic Republic of the Congo during the 2018-2020 outbreak

### Alicia Rosello

### Expert elicitation results 1 - data input November  2019

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
# forecast November 2019

HZ_considered<-c("LOLWA",  "NYANKUNDE", "OICHA", "MANDIMA", "MAMBASA", "BENI", "MABALAKO","KALUNGUTA", "KATWA", "GOMA")

# period considered
time_period<-"November 2019"
time_period_FR<-"Novembre 2019"

# number of responses
n_responses<-3

# response 1 exp 15 25-10-2019 
chips_1<-c("10","6","2","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("11","6","2","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("10","6","2","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("0","2","4","4","3","2","1","1","1","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_5<-c("5","8","4","2","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_6<-c("4","6","6","2","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_7<-c("4","7","5","2","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_8<-c("6","6","5","2","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_9<-c("8","7","4","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_10<-c("10","4","2","1","1","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
               low_bin=rep(low_bins, length(HZ_considered)),
               high_bin=rep(high_bins, length(HZ_considered)),
               date=rep("25-10-2019", times=length(HZ_considered)),
               chips=c(chips_1, chips_2, chips_3, chips_4, chips_5, chips_6,chips_7,chips_8,chips_9,chips_10),
               expert=rep("15",length(HZ_considered)),
               institution=rep("LSHTM",length(HZ_considered)), 
               last.in.field=rep("<2 weeks ago",length(HZ_considered)),
               experience.ide=rep("<5 years",length(HZ_considered)))


# response 2 exp7 28-10-2019
chips_1<-c("19","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("19","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("15","3","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("0","0","0","1","1","1","1","2","2","2","2","2","1","1","1","1","1","1","0","0","0","0","0","0","0")
chips_5<-c("2","4","4","2","2","1","1","1","1","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_6<-c("3","4","4","2","1","1","1","1","1","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_7<-c("1","1","2","3","3","2","2","1","1","1","1","1","1","0","0","0","0","0","0","0","0","0","0","0","0")
chips_8<-c("4","5","5","4","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_9<-c("10","8","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_10<-c("19","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")

df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("25-10-2019", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4, chips_5, chips_6,chips_7,chips_8,chips_9,chips_10),
                expert=rep("7",length(HZ_considered)),
                institution=rep("LSHTM",length(HZ_considered)), 
                last.in.field=rep("<2 weeks ago",length(HZ_considered)),
                experience.ide=rep("<5 years",length(HZ_considered)))

df<-rbind(df, df1)

# response 3 exp 12 28-10-2019
chips_1<-c("16","3","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_2<-c("16","3","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_3<-c("12","4","2","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_4<-c("0","1","1","4","4","6","2","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_5<-c("2","5","6","4","1","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_6<-c("1","1","4","5","4","1","1","1","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_7<-c("0","1","6","7","3","1","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_8<-c("10","8","2","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_9<-c("16","2","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")
chips_10<-c("18","1","1","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0")


df1<-data.frame(HZ=rep(HZ_considered, each=length(chips_1)),
                low_bin=rep(low_bins, length(HZ_considered)),
                high_bin=rep(high_bins, length(HZ_considered)),
                date=rep("25-10-2019", times=length(HZ_considered)),
                chips=c(chips_1, chips_2, chips_3, chips_4, chips_5, chips_6,chips_7,chips_8,chips_9,chips_10),
                expert=rep("12",length(HZ_considered)),
                institution=rep("LSHTM",length(HZ_considered)), 
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

