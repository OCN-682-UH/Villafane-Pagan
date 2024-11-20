#Homework: Homework about factors ###
#Created by: Jobel Y. Villafane ###
# Crated on 2024-11-20 ##

library(tidyverse)
library(here)
library(janitor)

#Read data
intertidal <- read_csv("Week_09/Data/intertidaldata.csv")

#Inspect the Data
head(intertidal)

#Clean the column names using janitor
intertidal <- intertidal %>% clean_names()

#Ensure factor with the correct order (Low, Mid, High)
intertidal <- intertidal %>%
  mutate(quadrat = factor(quadrat, levels = c("Low", "Mid", "High")))

#Create Plot
ggplot(intertidal, aes(x = quadrat, y = algae, color = site)) +
  geom_point(size = 3) +  # Add points
  geom_smooth() +  # Add regression line
  labs(title = "Algae Cover During Tidal Changes", 
       x = "Tidal Height", 
       y = "Algae (%)") +
  theme_minimal()+
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 16))

# Save the plot to a PDF file
ggsave("algae_cover_plot.pdf", width = 8, height = 6)
