### Forecasting the geographic spread of Ebola Virus Disease in the Democratic Republic of the Congo during the 2018-2020 outbreak

### Alicia Rosello

# Expert elicitation time line

## PREP

# packages
require(ggplot2)
require(lubridate)
require(dplyr)

# paths
files<-"Outputs/"
plots<-"Plots/"

## read in data
file<-paste0(files, "results_all.csv")
df<-read.csv(file, row.names = 1)

## descriptive output
length(table(df$expert))
length(table(df$expert.date))
table(is.na(df$expert.date))
filter(df,forecast.month=="November 2019")%>%group_by(expert.date)%>%summarise(n=n())
length(unique(df$expert.date))

## make dataset of experts and the date of the EE
experts<-df%>%group_by(date, expert, expert.date, forecast.month)%>%summarise(n=n())%>%select(date, expert, expert.date, forecast.month)
experts$date<-as.Date(as.character(experts$date), format = "%d-%m-%Y")

experts$expert<-as.character(paste("Expert",experts$expert))

forecast.month_levels <- c("November 2019", "December 2019", "January 2020", "February 2020", "March 2020")
forecast.month_colors <- c("#000000", "#0a3a8c", "#4192bf", "#009E73", "#D55E00")

experts <- experts[with(experts, order(date)), ]

experts$forecast.month <- factor(experts$forecast.month, levels=forecast.month_levels, ordered=TRUE)

positions <- c(0.5, -0.5, 1.0, -1.0, 1.5, -1.5)
directions<-c(1,-1)

line_pos <- data.frame(
  "date"=unique(experts$date),
  "position"=rep(positions, length.out=length(unique(experts$date))),
  "direction"=rep(directions, length.out=length(unique(experts$date)))
)

experts <- merge(x=experts, y=line_pos, by="date", all = TRUE)
experts <- experts[with(experts, order(date, forecast.month)), ]

text_offset <- 0.15

experts$month_count <- ave(experts$date==experts$date, experts$date, FUN=cumsum)
experts$text_position <- (experts$month_count * text_offset * experts$direction) + experts$position

month_buffer <- 2

first_month<-floor_date(min(experts$date), unit="month")
month_date_range <- seq(first_month, (max(experts$date) + months(month_buffer)), by='month')
month_format <- format(month_date_range, '%b')
month_experts <- data.frame(month_date_range, month_format)

timeline_plot<-ggplot(experts,aes(x=date,y=0, col=forecast.month, label=expert))+
  labs(col="Forecast Month")+
  scale_color_manual(values=forecast.month_colors, labels=forecast.month_levels, drop = FALSE)+
  theme_classic()

# Plot horizontal black line for timeline
timeline_plot<-timeline_plot+geom_hline(yintercept=0, 
                                        color = "black", size=0.3)

# Plot vertical segment lines for milestones
timeline_plot<-timeline_plot+geom_segment(data=experts[experts$month_count == 1,], aes(y=position,yend=0,xend=date), color='black', size=0.3)

# Plot scatter points at zero and date
timeline_plot<-timeline_plot+geom_point(aes(y=0), size=3)

# Horizontal line for forecast period
finish<-ceiling_date(month_experts$month_date_range, "month")
forecast_window<-data.frame(start_forecast_window=month_experts$month_date_range,
                         finish_forecast_window=finish,
                        position_forecast_window=0.25)
forecast_window$forecast.month<-paste(month(forecast_window$start_forecast_window, label = T, abbr = F), year(forecast_window$start_forecast_window))
experts<-merge(experts,forecast_window)
trial<-experts[!duplicated(experts$forecast.month),]
timeline_plot<-timeline_plot+geom_segment(data =trial, aes(y=position_forecast_window, yend=position_forecast_window,x=start_forecast_window,xend=finish_forecast_window,color=forecast.month), size=3, lty="solid", alpha=0.5)

# Don't show axes, appropriately position legend
timeline_plot<-timeline_plot+theme(axis.line.y=element_blank(),
                                   axis.text.y=element_blank(),
                                   axis.title.x=element_blank(),
                                   axis.title.y=element_blank(),
                                   axis.ticks.y=element_blank(),
                                   axis.text.x =element_blank(),
                                   axis.ticks.x =element_blank(),
                                   axis.line.x =element_blank(),
                                   legend.position = "bottom"
)

# Show text for each month
timeline_plot<-timeline_plot+geom_text(data=month_experts, aes(x=month_date_range,y=-0.1,label=month_format),size=2.5,vjust=0.5, color='black', angle=90, fontface="bold")


# Show text for each milestone
timeline_plot<-timeline_plot+geom_label(aes(y=text_position,label=expert),size=2.5, fontface="bold")



## save
ggsave(timeline_plot,file=paste0(plots, Sys.Date(), "_timeline_EE.png"),width = 22,height=13,units = "cm")


