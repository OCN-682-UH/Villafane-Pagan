### Creating maps ####
### Created by: Jobel Y. Villafane Pagan #############
### Updated on: 2024-10-08 ####################


# Load libraries
library(tidyverse)
library(here)
library(maps)
library(mapdata)
library(mapproj)
library(ggspatial)

# Read in data on population in California by county
popdata<-read_csv(here("Week_07","data","CApopdata.csv"))

#read in data on number of seastars at different field sites
stars<-read_csv(here("Week_07","data","stars.csv"))

# get data for states
states<-map_data("state")
head(states) 

# Use the states dataset
CA_data<-states %>%
  filter(region == "california") 
  
ggplot()+
  geom_polygon(data = CA_data, 
               aes(x = long,
                   y = lat,
                   group = group),
               color = "blue",
               fill = "green")

CApop_county<-popdata %>%
  select("subregion" = County, Population)  %>% # rename the county column
  inner_join(counties) %>%
  filter(region == "california")

ggplot()+
  geom_polygon(data = CApop_county, 
               aes(x = long, 
                   y = lat, 
                   group = group,
                   fill = Population),
               color = "black") +
geom_point(data = stars, # add a point at all my sites
           aes(x = long,
               y = lat,
               size = star_no))+
  coord_map()+
  theme_void() +
  scale_fill_gradient(trans = "log10")+
  labs(size = "# stars/m2")  

ggsave(here("Week_07","Output","CApop.pdf"))