### Homework Week 04 Penguin data ####
### Created by Jobel Y. Villafane-Pagan ########
### Updated on 2024-09-17 ######################

#### Load Libraries #######
library(palmerpenguins)
library(tidyverse)
library(here)
library(beyonce)

# Analysis
#Part 1: calculate the mean and variance of body mass by species, island, and sex without any NAs
glimpse(penguins)

penguins %>%
  filter(!is.na(body_mass_g), !is.na(species), !is.na(island), !is.na(sex)) %>%  # Remove NAs in specified columns
  group_by(species, island, sex) %>%
  summarize(
    mean_body_mass = mean(body_mass_g),
    variance_body_mass = var(body_mass_g),
    .groups = 'drop'
  )

#Part 2
penguins %>%
  filter(sex != "male") %>%  # Exclude male penguins
  mutate(log_mass = log(body_mass_g)) %>%  # Calculate log of body mass
  select(Species = species, island, sex, log_mass)  # Select specific columns
  

ggplot(data = penguins,
       mapping = aes(x = species, y = body_mass_g, group = species)) +
  
  geom_point(aes(color = species, alpha = island), size = 3) +  # Color points by species
  geom_smooth(method = "lm", aes(group = species)) +  # Linear model for each species
  labs(x = "Species",
       y = "Body Mass (g)", 
       title = "Body Mass of Penguins",
       subtitle = "The body mass is based on female penguins by species and island" ) +  # plot title and subtitle
  
  scale_color_manual(values = beyonce_palette(23)) +  #color palette
  scale_alpha_manual(values = c(0.3, 0.6, 1)) +
  theme_bw() + 
  theme(axis.title = element_text(size = 15),
        plot.title = element_text(size = 24, face = "bold"),
        panel.background = element_rect(fill = "white")) # Customizing background

ggsave(here("Week_04","output","penguinHm.png"))
