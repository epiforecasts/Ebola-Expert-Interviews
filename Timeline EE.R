# Timeline project
# Started 15-01-2020 AR

# wd
getwd()
wdir<-"~/Documents/VEEPED/Ebola/Expert elicitation/Results/"
setwd(wdir)

# data
dat_dec<-read.csv(file=paste0(wdir,"30-11-2019 results_december.csv"), row.names = 1)
dat_dec$EE<-"Dec 2019"
dat_jan<-read.csv(file=paste0(wdir,"31-12-2019 results_january.csv"), row.names = 1)
dat_jan$EE<-"Jan 2020"

dat<-rbind(dat_dec, dat_jan)
        
# packages
library(ggplot2)
library(scales)
library(lubridate)

# classes
dat$date<-as.Date(dat$date, format="%d-%m-%Y")

# only need expert nbumber and their dates
dat<-dat%>%group_by(date, expert)%>%summarise(n())
dat<-dat[,1:2]

# order by date
dat <- dat[with(dat, order(date)), ]

# colours for each expert
experts<-unique(dat$expert)
length(experts)

# positions
positions <- c(0.5, -0.5, 1.0, -1.0, 1.5, -1.5)
directions <- c(1, -1)
line_pos <- data.frame(
  "date"=unique(dat$date),
  "position"=rep(positions, length.out=length(unique(dat$date))),
  "direction"=rep(directions, length.out=length(unique(dat$date)))
)

df<- merge(x=dat, y=line_pos, by="date", all = TRUE)
df <- df[with(df, order(date)), ]

text_offset <- 0.08

df$day_count <- ave(df$date==df$date, df$date, FUN=cumsum)
df$text_position <- (df$day_count * text_offset * df$direction) + df$position
head(df)

day_buffer <- 2

date_range <- seq(min(df$date) - days(day_buffer), max(df$date) + days(day_buffer), by='day')
day_format <- format(date_range, '%d')
day_df <- data.frame(date_range, day_format)

month_buffer <- 1

month_date_range <- seq(min(df$date) - months(month_buffer), max(df$date) + months(month_buffer), by='month')
month_date_range <- as.Date(
  intersect(
    ceiling_date(month_date_range, unit="month"),
    floor_date(month_date_range, unit="month")
  ),  origin = "1970-01-01"
)
month_format <- format(month_date_range, '%b')
month_df <- data.frame(month_date_range,month_format)



# PLOT

# no colour experts
timeline_plot1<-ggplot(df,aes(x=date,y=0, label=expert, col=as.character(expert)))+
  labs(col="Expert")+
  geom_hline(yintercept=0, color = "black", size=0.3)+ # Plot horizontal black line for timeline
  theme_classic()+
  geom_segment(data=df[df$day_count == 1,], aes(y=position,yend=0,xend=date), color='black', size=0.2)+ # Plot vertical segment lines for milestones
  geom_point(aes(y=0), size=3, col="black")+ # Plot scatter points at zero and date
  theme(axis.line.y=element_blank(),
        axis.text.y=element_blank(),
        axis.title.x=element_blank(),
        axis.title.y=element_blank(),
        axis.ticks.y=element_blank(),
        axis.text.x =element_blank(),
        axis.ticks.x =element_blank(),
        axis.line.x =element_blank(),
        legend.position = "bottom")+ # Don't show axes, appropriately position legend
  geom_text(data=day_df, aes(x=date_range,y=-0.1,label=day_format),size=3,vjust=0.5, color='black')+ # Show text for each month
  geom_text(data=month_df, aes(x=month_date_range,y=-0.2,label=month_format, fontface="bold"),size=5, color='black')+ # Show year text
  geom_text(aes(y=text_position,label=paste("expert",expert)),size=4, col="black") # Show text for each milestone

ggsave(timeline_plot1, file=paste0(wdir, "Plots/15-01-2020 Timeline.png"))

# coloured experts
timeline_plot<-ggplot(df,aes(x=date,y=0, label=expert, col=as.character(expert)))+
  labs(col="Expert")+
  geom_hline(yintercept=0, color = "black", size=0.3)+ # Plot horizontal black line for timeline
  theme_classic()+
  geom_segment(data=df[df$day_count == 1,], aes(y=position,yend=0,xend=date), color='black', size=0.2)+ # Plot vertical segment lines for milestones
  geom_point(aes(y=0), size=3, col="black")+ # Plot scatter points at zero and date
  theme(axis.line.y=element_blank(),
        axis.text.y=element_blank(),
        axis.title.x=element_blank(),
        axis.title.y=element_blank(),
        axis.ticks.y=element_blank(),
        axis.text.x =element_blank(),
        axis.ticks.x =element_blank(),
        axis.line.x =element_blank(),
        legend.position = "bottom")+ # Don't show axes, appropriately position legend
  geom_text(data=day_df, aes(x=date_range,y=-0.1,label=day_format),size=3,vjust=0.5, color='black')+ # Show text for each month
  geom_text(data=month_df, aes(x=month_date_range,y=-0.2,label=month_format, fontface="bold"),size=5, color='black')+ # Show year text
  geom_text(aes(y=text_position,label=paste("expert",expert)),size=4) # Show text for each milestone

ggsave(timeline_plot, file=paste0(wdir, "Plots/15-01-2020 Timeline colours.png"))
