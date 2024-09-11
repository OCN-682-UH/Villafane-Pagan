#My first plot
#By jobel Y. Villafane Pagan
#Created 2024-09-10


#libraries
library(tidyverse)
library(palmerpenguins)

#Look at the data
view(penguins)
head(penguins)
glimpse(penguins)

#make a plot
ggplot(data = penguins,
       mapping = aes(x = bill_depth_mm, 
                     y = bill_length_mm,
                     color = species,
                     size = body_mass_g,
                     alpha = flipper_length_mm))+

geom_point() +
  labs(title = "Bill depth and length", 
       subtitle = "My fancy subtitle",
       x = "Bill Depth (mm)",
       y = "Bill Length (mm)",
       color = "Species Yay!",
       caption = "Source: Palmer Penguins Package/Palmer LTER") +
scale_color_viridis_d() 


ggplot (data = penguins, 
        mapping = aes(x = bill_depth_mm,
                      y = bill_length_mm,
                      color = species))+
  
  geom_point()+
  facet_grid(sex~species)