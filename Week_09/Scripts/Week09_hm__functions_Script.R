### Homework: Functions ###
### Created by: Jobel Y. Villafane Pagan ###
### Updated on: 2024-10-28 ####

#Load Libraries ##
library(tidyverse)
library(tidytuesdayR)
library(here)
library(taylor)
library(ggplot2)
library(dplyr)
library(tayloRswift)


#View data
tuesdata <- tidytuesdayR::tt_load(2023, week = 42)

taylor_album_songs <- tuesdata$taylor_album_songs
taylor_all_songs <- tuesdata$taylor_all_songs
taylor_albums <- tuesdata$taylor_albums

glimpse(taylor_album_songs)
glimpse(taylor_all_songs)
glimpse(taylor_albums)

view(taylor_album_songs)
view(taylor_all_songs)
view(taylor_albums)

#plot function of scatter plot of energy vs. danceability
create_energy_danceability_plot <- function(data) {
  # Filter out rows with NA in energy or danceability
  filtered_data <- data %>%
    filter(!is.na(energy) & !is.na(danceability))
  
  ggplot(filtered_data, aes(x = energy, y = danceability, color = album_name)) +
    geom_point() +
    labs(title = "Energy vs. Danceability of Taylor Swift Songs",
         x = "Energy",
         y = "Danceability") +
    scale_color_taylor(palette = "taylor1989") +
    theme_minimal() +
  theme(plot.title = element_text(hjust = 0.75, face = "bold"),  # Center and bold the title
        axis.text.x = element_text(angle = 45, hjust = 1))
}

#Calling the function
create_energy_danceability_plot(taylor_album_songs)

#non plot function
get_summary_statistics <- function(data) {      #Function
  data %>%
    summarise(
      mean_danceability = mean(danceability, na.rm = TRUE), #calculate mean
      mean_energy = mean(energy, na.rm = TRUE))
}
summary_statistics <- get_summary_statistics(taylor_album_songs)

# View the results
print(summary_statistics)
