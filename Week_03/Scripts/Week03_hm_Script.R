#### Homework plotting the penguin data ####
#### Created by Jobel Y. Villafane Pagan ########
#### Updated on 2424-09-15 ######################


#### Load libraries #######
library(palmerpenguins)
library(tidyverse)
library(here)
library(beyonce)
library(ggthemes)
library("see")

### Load data ###
glimpse(penguins)

### Data analysis ###

ggplot(data = penguins, 
      aes (x = species,
           y = flipper_length_mm, 
                             fill = species))+
  
  geom_violindot(fill_dots = "black")+
  labs (x = "Species",
        y = "Flipper length (mm)",
        title = "Palmer Archipelago Penguins",
        subtitle = "Flipper dimensions for Adelie, Chinstrap, and Gentoo Penguins")+ #Title and subtitle 
  
  scale_fill_manual(values = beyonce_palette(129))+ #Adjust the fill color scale
  theme_modern()+
  theme(axis.title = element_text(size = 15,
                                  color = "black"), #Adjust axis size and color
        legend.position = "none"  # Remove the legend
  )

ggsave(here("Week_03","Output","homework_w3.png"))
