#### Today we are going to plot penguin data ####
#### Created by Jobel Y. Villafane Pagan ########
#### Updated on 2424-09-15 ######################



#### Load libraries #######
library(palmerpenguins)
library(tidyverse)
library (here)
library(beyonce)
library(ggthemes)

### load data ####

glimpse(penguins)

## data analysis section ####

ggplot(data = penguins,
       mapping = aes(x= bill_depth_mm,
                     y = bill_length_mm, 
                     group = species, 
                     color = species))+
  geom_point()+
  geom_smooth(method = "lm")+
  labs(x = "Bill depth (mm)",
       y = "Bill length (mm)"
       
  )+
  scale_color_viridis_d()+
  scale_x_continuous(breaks = c(14,17,21),
                     labels = c("low","medium","high"))+
  scale_color_manual(values = beyonce_palette(22))+
 theme_bw()+
 theme(axis.title = element_text(size = 15,
                                 color = "black"),
       panel.background = element_rect(fill = "gray"))+
       theme(legend.position = "bottom")+
  theme(legend.key = element_rect(fill = "white", colour = "black"))+
  theme(legend.title = element_text(face = "bold"))

ggsave(here("Week_03","Output","penguin.png"),
       width = 7, height = 5)


ggplot(diamonds, aes(carat, price))+
  geom_point()+
  coord_trans(x = "log10", y = "log10")
