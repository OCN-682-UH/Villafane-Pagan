### Today we are going to plot Penguin data ####
### Created by Jobel Y. Villafane-Pagan ########
### Updated on 2024-09-17 ######################

#### Load Libraries #######
library(palmerpenguins)
library(tidyverse)
library(here)

## Analysis ####
glimpse(penguins)

filter(.data = penguins, sex == "female")
filter(.data = penguins, year == "2008")
filter(.data = penguins, body_mass_g > 5000)

filter (.data = penguins, year == 2008 | 2009)
filter (.data = penguins, year %in% c("2008", "2009"))

filter (.data = penguins, !(island = "Dream")
filter (.data = penguins, island != "Dream") 

filter (.data = penguins, species %in% c("Adelie", "Gentoo"))

data2<-mutate(.data = penguins,
              body_mass_kg = body_mass_g/1000)
bill_length_depth = bill_length_mm/bill_depth_mm #convert mass to kg and calculate the ratio of bill length to depth

data2<- mutate(.data = penguins
               after_2008 = ifelse(year>2008, "After 2008", "Before 2008"))

data2<-mutate(penguins,
                flipper_plus_mass = flipper_length_mm + body_mass_g,
                thicc_penguins = ifelse(body_mass_g>4000, "Big", "Small")

penguins %>% #use penguin data frame
  filter(sex == "female") %>% #select females
  mutate(log_mass = log(body_mass_g)) %>%
  select(Species = species, island, sex, log_mass)

penguins %>% 
  drop_na(sex) %>%
  group_by(island, sex) %>%
  summarise(mean_flipper = mean(flipper_length_mm, na.rm = TRUE),
            max_bill_length = max(bill_length_mm, na.rm = TRUE))
  