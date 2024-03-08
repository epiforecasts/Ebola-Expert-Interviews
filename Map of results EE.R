##########################################
## Forecast results DRC Ebola outbreak ###
## AR
## Start: 11-12-2019
##########################################

### prep

# paths
wdir<-"~/Documents/GitHub"
setwd(wdir)

files<-"~/Documents/VEEPED/Ebola/Expert elicitation/Results/"

# data
df<-read.csv(file=paste0(files,"11-12-2019 results_december_cm.csv"), row.names = 1)


# packages
require(dplyr)
require(RColorBrewer)
require(leaflet)
require(ggplot2)
require(mapview)
require(raster)
require(htmltools)
library(sp)
require(sf)
require(rgeos)
require(htmlwidgets)
library(spdep)
library(tidyverse)

# administrative levels DRC
DRC <- getData('GADM', country='COD', level=1)


# Plot map HZs using LEAFLET
# Use leaflet to display a blank map with OpenStreetMap imagery 
map <-leaflet() %>%
  addProviderTiles(providers$OpenStreetMap) 

My_gradient<-c("Green", "Blue")
palProvince <-  colorFactor(My_gradient, domain = DRC$NAME_1)
My_gradient <- c("white", "red")       ## brown1 is actually red
palprobcases <-  colorBin(My_gradient, domain = data$total_cases, bins = c(c(0,1,10,50),seq(from = 100,to = max(data$total_cases),by=100),max(data$total_cases)))
My_gradient <- c("white", "purple")       ## brown1 is actually red
pal2w <-  colorBin(My_gradient, domain = data$cases_2w, bins = c(0,1,5,10,max(data$cases_2w)))
My_gradient<-c("dark blue", "blue", "light blue")
palHZ_class <-  colorFactor(My_gradient, domain = data$HZ_class)
My_gradient<-c("white", "purple")
palZSnum <-  colorFactor(My_gradient, domain = data$ZSnum)
My_gradient<-c("yellow", "dark green")
palSous <-  colorFactor(My_gradient, domain = data$Sous.coordination)

# opacity
data$opacity_by_HZ_class<-data$HZ_class
data$opacity_by_HZ_class<-gsub("outside outbreak area","0.3", data$opacity_by_HZ_class)
data$opacity_by_HZ_class<-gsub("directly surrrounding outbreak","0.3",data$opacity_by_HZ_class)
data$opacity_by_HZ_class<-gsub("outbreak","0.3",data$opacity_by_HZ_class)


## define labels using the sprintf() function to format text
number_total_labels <- sprintf(
  "<strong>%s</strong><br/>%d cases",    # this is C-style formatting which means 
  data$ZSName, data$total_cases            # "print NAME_2 in bold font, return, 
  #  print the number of cases in normal font"
) %>% lapply(htmltools::HTML)

number_2w_labels <- sprintf(
  "<strong>%s</strong><br/>%d cases",    # this is C-style formatting which means 
  data$ZSName, data$cases_2w            # "print NAME_2 in bold font, return, 
  #  print the number of cases in normal font"
) %>% lapply(htmltools::HTML)

HZ_class_labels <- sprintf(
  "<strong>%s</strong><br/>%s",    # this is C-style formatting which means 
  data$ZSName, data$HZ_class            # "print NAME_2 in bold font, return, 
  #  print the number of cases in normal font"
) %>% lapply(htmltools::HTML)

ZSnum_labels <- sprintf(
  "<strong>%s</strong>",    # this is C-style formatting which means 
  mini_data$ZSnum            # "print NAME_2 in bold font
) %>% lapply(htmltools::HTML)

Province_labels <- sprintf(
  "<strong>%s</strong>",    # this is C-style formatting which means 
  loc_HZ_overall_w_province$NAME_1            # "print NAME_2 in bold font
) %>% lapply(htmltools::HTML)

SC_labels <- sprintf(
  "<strong>%s</strong>",    # this is C-style formatting which means 
  data$Sous.coordination            # "print NAME_2 in bold font
) %>% lapply(htmltools::HTML)

group_name_2w<-paste("Number of cases ",dates_considered[1], " to ", dates_considered[2],sep="")

## Add these labels to the map, along with highlighting options
## Number layer - inital options as above
Map_DRC <- map %>%    
  
  addPolygons(data=loc_HZ_overall_w_province,   
              fillColor=  ~palProvince(NAME_1),             
              fillOpacity = 1,                   
              color = 'black',                 
              weight =2,                         
              opacity = 1,                       
              group = "Province",
              highlight = highlightOptions(         # When user hovers, give the polygon:
                weight = 4,                             # A thicker outline
                color = "#666"),                        # A grey outline
              label = Province_labels,              
              labelOptions = labelOptions(
                textsize = "15px")) %>%
  
  addPolygons(data=mini_data,   
              fillColor=  ~palZSnum(ZSnum),             
              fillOpacity = 0,                   
              color = 'black',                 
              weight =2,                         
              opacity = 1,                       
              group = "HZ num",
              highlight = highlightOptions(         # When user hovers, give the polygon:
                weight = 4,                             # A thicker outline
                color = "#666"),                        # A grey outline
              label = ZSnum_labels,              
              labelOptions = labelOptions(
                textsize = "15px",
                noHide = TRUE,
                textOnly=TRUE)) %>%
  
  addPolygons(data=data,   
              fillColor=  ~pal2w(cases_2w),             
              fillOpacity = data$opacity_by_HZ_class,                   
              color = 'black',                 
              weight =2,                         
              opacity = 1,                       
              group = group_name_2w,
              highlight = highlightOptions(         # When user hovers, give the polygon:
                weight = 4,                             # A thicker outline
                color = "#666"),                        # A grey outline
              label = number_2w_labels,            
              labelOptions = labelOptions(
                textsize = "15px")) %>%
  
  addPolygons(data=data,   
              fillColor=  ~palTotal(total_cases),             
              fillOpacity = data$opacity_by_HZ_class,                   
              color = 'black',                 
              weight =2,                         
              opacity = 1,                       
              group = "Number of total cases",
              highlight = highlightOptions(         # When user hovers, give the polygon:
                weight = 4,                             # A thicker outline
                color = "#666"),                        # A grey outline
              label = number_total_labels,            # The label we defined as number_total_labels   
              labelOptions = labelOptions(
                textsize = "15px")) %>%
  
  addPolygons(data=data,   
              fillColor=  ~palHZ_class(HZ_class),             
              fillOpacity = 1,                   
              color = 'black',                 
              weight =2,                         
              opacity = 1,                       
              group = "HZ class",
              highlight = highlightOptions(         # When user hovers, give the polygon:
                weight = 4,                             # A thicker outline
                color = "#666"),                        # A grey outline
              label = HZ_class_labels,              
              labelOptions = labelOptions(
                textsize = "15px")) %>%
  
  addPolygons(data=data,   
              fillColor=  ~palSous(Sous.coordination),             
              fillOpacity = 1,                   
              color = 'black',                 
              weight =2,                         
              opacity = 1,                       
              group = "Sous-coordination",
              highlight = highlightOptions(         # When user hovers, give the polygon:
                weight = 4,                             # A thicker outline
                color = "#666"),                        # A grey outline
              label = SC_labels,              
              labelOptions = labelOptions(
                textsize = "15px")) %>%
  
  
  
  # Layers control
  addLayersControl(overlayGroups = c("Number of total cases", group_name_2w, "HZ class","HZ num", "Province", "Sous-coordination"),  
                   options = layersControlOptions(collapsed = FALSE))%>%
  
  # Legend
  addLegend(pal = palHZ_class,                   
            values = data$HZ_class,                   
            opacity = 1,                              
            title = "HZ class",               
            position = "bottomleft",                 
            group = "HZ class",
            labFormat = labelFormat(digits = 0))%>%
  
  addLegend(pal = palTotal,                   
            values = data$total_cases,                   
            opacity = 1,                              
            title = "Number of total cases",               
            position = "bottomleft",                 
            group = "Number of total cases",
            labFormat = labelFormat(digits = 0)) %>%
  
  addLegend(pal = pal2w,                   
            values = data$cases_2w,                   
            opacity = 1,                              
            title = group_name_2w,               
            position = "bottomleft",                 
            group = group_name_2w,
            labFormat = labelFormat(digits = 0)) %>%
  
  # addLegend(pal = palProvince,                   
  #           values = loc_HZ_overall_w_province,                   
  #           opacity = 1,                              
  #           title = "Province",               
  #           position = "bottomleft",                 
  #           group = Province,
  #           labFormat = labelFormat(digits = 0)) %>%
  
  # addLegend(pal = palSous,                   
  #           values = data$Sous.coordination,                   
#           opacity = 1,                              
#           title = "Sous-coordination",               
#           position = "bottomleft",                 
#           group = "Sous-coordination",
#           labFormat = labelFormat(digits = 0)) %>%

hideGroup(c("HZ class", "Province", "Sous-coordination", "Number of total cases"))   ## This means only the first group will be displayed initially

Map_DRC

# saveWidget(Map_DRC, 'mapDRC.html', selfcontained = TRUE)
mapshot(Map_DRC,url = paste0(getwd(), "/21-10-2019_map_DRC_EVD.html"))

# Problem with Mambasa, WHO map has a smaller area for this than the MSF map.
