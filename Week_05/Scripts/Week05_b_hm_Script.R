### Homework: Data Wrangling - lubridate and time ###
### Created by: Jobel Y. Villafane Pagan ###
### Updated on: 2024-10-06 ####

# Load Libraries
library(tidyverse)
library(here)
library(lubridate)

# Data, process dates, and round the conductivity data
results <- read_csv("Week_05/Data/CondData.csv") %>%
  mutate(
    date = parse_date_time(date, orders = c("mdy HMS", "ymd HMS", "dmy HMS")), #date column correctly
    rounded_time = floor_date(date, unit = "10 seconds") # Round to nearest 10 seconds
  ) %>%
  inner_join(
    read_csv("Week_05/Data/DepthData.csv") %>%
      mutate(
        date = parse_date_time(date, orders = c("mdy HMS", "ymd HMS", "dmy HMS")), #date column in depth data
        rounded_time = floor_date(date, unit = "10 seconds")
      ),
    by = "rounded_time"
  ) %>%
  # Group data by minute for averages
  mutate(minute_time = floor_date(rounded_time, unit = "1 minute")) %>%
  group_by(minute_time) %>%
  summarize(
    avg_depth = mean(Depth, na.rm = TRUE),
    avg_conductivity = mean(AbsPressure, na.rm = TRUE),
    avg_salinity = mean(Salinity, na.rm = TRUE)
  ) %>%
  ungroup()

# show
print(head(results))

# Plotting
results %>%
  ggplot(aes(x = minute_time, y = avg_depth)) +
  geom_line(color = 'blue', linewidth = 1) +
  labs(
    title = "Average Depth over Time",
    x = "Time",
    y = "Depth (m)"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"), # Center and make the title bold
    axis.text.x = element_text(angle = 45, hjust = 1), # Rotate the x-axis for better date readability
    panel.background = element_rect(fill = "lightblue"), # background color of the plotting area
    plot.background = element_rect(fill = "lightyellow") # background color of the entire plot
  )

# Save the plot as Output_01.png
ggsave("Output_01.png")
