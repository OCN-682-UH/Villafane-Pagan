### Creating maps based on Biogechemical data ####
### Created by: Jobel Y. Villafane Pagan #############
### Updated on: 2024-10-08 ####################

##libraries ##
library(ggmap)
library(tidyverse)
library(here)
library(ggspatial)


##Create map##
ggmap(Oahu)
Oahu<-get_map("Oahu")
 
#Make a data frame of lon and lat coordinates
WP<-data.frame(lon = -157.7621, lat = 21.27427) # coordinates for Wailupe

# Get base layer
Map1<-get_map(WP, zoom = 17, maptype = "satellite")

# plot it
ggmap(Map1) +
  geom_point(data = ChemData_new,
             aes (x = Long, y = Lat, color = Salinity ),
             size = 4) +
  scale_color_viridis_c() + 
  annotation_scale(bar_cols = c("black", "white"), location = "bl") +
  annotation_north_arrow(location = "tl)") +
  coord_sf(crs = 4326)

                   