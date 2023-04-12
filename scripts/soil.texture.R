## HEADER ####
## WHO: JOE COLLINS
## WHAT: soil texture plots 
## LAST EDIT: 16/02/2023
####

## 00 packages ####

library(ggtern)
library(dplyr)

## PLOT TEXTURAL TRIANGLE ####

textures <- ggtern(
  data= dat, aes(
    x = Sand,
    y = Clay,
    z = Silt
  )) +
  geom_point(
    aes(color=Treatment),
    size=2,alpha=0.5
  )+
  labs(
    title="Harper Adams Conservation Agriculture Experiment",
    subtitle="Treatment soil textures",
    color="Treatment"
  )+
  theme_bw()                 

textures



textures_cust<-textures+
  labs(
    yarrow = "Clay (%)",
    zarrow = "Silt (%)",
    xarrow = "Sand (%)"
  )+
  theme_showarrows()+        # Add arrows to axis titles
  theme_hidetitles()+
  theme_clockwise()          # Direction of ternary rotation

textures_cust


data(USDA) # Load USDA
head(USDA)

textures_classes<-textures_cust+
  geom_polygon(
    data=USDA,aes(x=Sand,y=Clay,z=Silt,group=Label),
    fill=NA,size = 0.3,alpha=0.5,
    color = "grey30"
  )

textures_classes


USDA_text <- USDA  %>% 
  group_by(Label) %>%
  summarise_if(is.numeric, mean, na.rm = TRUE) %>%
  ungroup()

head(USDA_text)


#open png for file save and define size and resolution
png(paste("plots/", "soil texture plot by treatment", ".png", sep=""),
    width=1200, height=900, res=150)

textures_names<-textures_classes+
  geom_text(
    data=USDA_text,
    aes(x=Sand,y=Clay,z=Silt,label=Label),
    size = 2,
    color = "grey30"
  ) + 
  theme(legend.position = c(0.8, 0.8), legend.title = element_text(colour="black", size=10, face="bold"),
        legend.text = element_text(colour="black", size=10,face="bold"), 
        legend.background = element_rect(size=0.5, linetype="solid", colour ="darkblue"))

textures_names

dev.off() # turn dev off


## 03 spatial plot ####




#open png for file save and define size and resolution
png(paste("plots/", "texture spatial plot", ".png", sep=""),
    width=1200, height=900, res=150)

ggplot(data = dat, aes( x = x, y = y)) +
  geom_polygon(data = f1, aes( x = long, y = lat), fill = "white", color = "black")+ 
  geom_polygon(data = f2, aes( x = long, y = lat), fill = "white", color = "black")+ 
  geom_point(aes(color = Treatment))+ 
  ggtitle(label = "Soil Texture", subtitle = "Sample time: 01/10/2022") + 
  coord_equal() +
  theme_bw() +
  theme(plot.title = element_text(size = 14, face = "bold")) +
  theme(axis.title.y = element_text(size = 12, face = "bold")) +
  theme(axis.title.x = element_text(size = 12, face = "bold")) +
  theme(plot.margin = unit(c(0, 0, 0, 0), "cm"))

dev.off() # turn dev off
