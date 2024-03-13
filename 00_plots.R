### Forecasting the geographic spread of Ebola Virus Disease in the Democratic Republic of the Congo during the 2018-2020 outbreak

### Alicia Rosello

### Expert elicitation plots

#### READ IN DATA

# read in data raw
file_not_all<-paste0(files, "results_", gsub(" ", "_", time_period), ".csv")
df<-read.csv(file_not_all,row.names = 1)

#### PLOTS WITHOUT CUMMULATIVE DATA

plot_1<-ggplot(data=df, aes(x=low_bin, y=(p), col=expert.date))+
  geom_line()+facet_wrap(~HZ)+theme_bw()+
  geom_line(data=df, aes(x=low_bin, y= p.all.experts), col="black", size=1)+
  scale_y_continuous(limits = c(0,1), breaks=seq(0,1, by=0.1), name="Probability")+
  scale_x_continuous(name=paste("Predicted new EVD cases reported (confirmed+probable) during",time_period))+
  labs(colour= "Expert and date")

plot_1_fr<-ggplot(data=df, aes(x=low_bin, y=(p), col=expert.date))+
  geom_line()+facet_wrap(~HZ)+theme_bw()+
  geom_line(data=df, aes(x=low_bin, y= p.all.experts), col="black", size=1)+
  scale_y_continuous(limits = c(0,1), breaks=seq(0,1, by=0.1), name="Probabilité")+
  scale_x_continuous(name=paste("Nouveaux cas d’MVE déclarées prédits (confirmés + probable) pour",time_period_FR))+
  labs(colour= "Expert et date")

# plot HZ:istitution
plot_2<-ggplot(data=df, aes(x=low_bin, y=(p), col=expert.date))+
  geom_line()+facet_wrap(~HZ:institution)+theme_bw()+
  geom_line(data=df, aes(x=low_bin, y= p.all.experts), col="black", size=1)+
  scale_y_continuous(limits = c(0,1), breaks=seq(0,1, by=0.1), name="p")+
  scale_x_continuous(name=paste("Predicted new EVD cases reported (confirmed+probable) during",time_period))+
  labs(colour= "Expert and date")

# plot HZ:last in field
plot_3<-ggplot(data=df, aes(x=low_bin, y=(p), col=expert.date))+
  geom_line()+facet_wrap(~HZ:last.in.field)+theme_bw()+
  geom_line(data=df, aes(x=low_bin, y= p.all.experts), col="black", size=1)+
  scale_y_continuous(limits = c(0,1), breaks=seq(0,1, by=0.1), name="p")+
  scale_x_continuous(name=paste("Predicted new EVD cases reported (confirmed+probable) during",time_period))+
  labs(colour= "Expert and date")

# plot HZ:experience.ide
plot_4<-ggplot(data=df, aes(x=low_bin, y=(p), col=expert.date))+
  geom_line()+facet_wrap(~HZ:experience.ide, ncol = 4)+theme_bw()+
  geom_line(data=df, aes(x=low_bin, y= p.all.experts), col="black", size=1)+
  scale_y_continuous(limits = c(0,1), breaks=seq(0,1, by=0.1), name="p")+
  scale_x_continuous(name=paste("Predicted new EVD cases reported (confirmed+probable) during",time_period))+
  labs(colour= "Expert and date")

# save plots
ggsave(plot_1, file=paste0(plots,Sys.Date(), " results_plot_EE_", gsub(" ", "_", time_period), ".png"))
ggsave(plot_1_fr, file=paste0(plots,Sys.Date(), " results_plot_EE_", gsub(" ", "_", time_period), "_fr.png"))
ggsave(plot_2, file=paste0(plots,Sys.Date(), " results_plot_EE_", gsub(" ", "_", time_period), "_by_institution.png"))
ggsave(plot_3, file=paste0(plots,Sys.Date(), " results_plot_EE_", gsub(" ", "_", time_period), "_by_last_in_field.png"))
ggsave(plot_4, file=paste0(plots,Sys.Date(), " results_plot_EE_", gsub(" ", "_", time_period), "_by_experience.png"))


#### PLOTS WITH CUMMULATIVE DATA

# order factors correctly
# df$expert.date = factor(df$expert.date,levels(df$expert.date)[c(1,3:10,2)])
df_cm$p_cm = as.factor(df_cm$p_cm)
df_cm$p_cm = factor(df_cm$p_cm,levels(df_cm$p_cm)[c(2,4,1,3)])

# plot
plot_1_cm<-ggplot(data=df_cm, aes(x=p_cm, p_cm_val))+
  geom_boxplot()+facet_wrap(~HZ)+
  scale_y_continuous(name="Probability")+
  scale_x_discrete(name=paste("Predicted new EVD cases reported (confirmed+probable) during",time_period))

plot_1_cm_fr<-ggplot(data=df_cm, aes(x=p_cm, p_cm_val))+
  geom_boxplot()+facet_wrap(~HZ)+
  scale_y_continuous(name="Probabilité")+
  scale_x_discrete(name=paste("Nouveaux cas d’MVE déclarées prédits (confirmés + probable) pour",time_period_FR))

plot_2_cm<-ggplot(data=df_cm, aes(x=p_cm, p_cm_val, col=expert.date))+
  geom_point()+facet_wrap(~HZ)+
  scale_y_continuous(name="Probability")+
  scale_x_discrete(name=paste("Predicted new EVD cases reported (confirmed+probable) during",time_period))

# save plots
ggsave(plot_1_cm, file=paste0(plots, Sys.Date(), "_results_plot_EE_", time_period,"_cm_bw.png"))
ggsave(plot_2_cm, file=paste0(plots, Sys.Date(), "_results_plot_EE_", time_period,"_cm_idv.png"))
ggsave(plot_1_cm_fr, file=paste0(plots, Sys.Date(), "_results_plot_EE_", time_period, "_cm_bw_fr.png"))


