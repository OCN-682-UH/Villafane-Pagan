##Homework For Loops##
##Created by Jobel Y. Villafane ##

# Load libraries
library(tidyverse)
library(here)
library(readr)

# Define file paths
file_paths <- c("Week_13/Data/homework/TP1.csv", 
                "Week_13/Data/homework/TP2.csv", 
                "Week_13/Data/homework/TP3.csv", 
                "Week_13/Data/homework/TP4.csv")

### Solution 1: Using a FOR Loop ###
# Empty list to store results
results_for_loop <- list()

# For loop to calculate mean and standard deviation
for (file in file_paths) {
  # Read the data
  data <- read_csv(file)
  
  # Calculate statistics
  stats <- data %>%
    summarise(
      PoolID = unique(PoolID),
      mean_temp = mean(Temp.C, na.rm = TRUE),
      sd_temp = sd(Temp.C, na.rm = TRUE),
      mean_light = mean(Intensity.lux, na.rm = TRUE),
      sd_light = sd(Intensity.lux, na.rm = TRUE)
    )
  
  # Append results
  results_for_loop[[basename(file)]] <- stats
}

# Combine results into a single data frame
results_for_loop_df <- bind_rows(results_for_loop, .id = "file_name")
print("Results using For Loop:")
print(results_for_loop_df)


### Solution 2: Using MAP Functions ###
# List all CSV files in the folder
folder_path <- "Week_13/Data/homework"
file_list <- list.files(path = folder_path, pattern = "\\.csv$", full.names = TRUE)

# Reading all files into a single data frame and calculate statistics
results_map <- file_list %>%
  set_names(nm = basename(file_list)) %>%
  map_dfr(~ {
    data <- read_csv(.x) # Read each CSV file
    data %>%
      summarise(
        PoolID = unique(PoolID),
        mean_temp = mean(Temp.C, na.rm = TRUE),
        sd_temp = sd(Temp.C, na.rm = TRUE),
        mean_light = mean(Intensity.lux, na.rm = TRUE),
        sd_light = sd(Intensity.lux, na.rm = TRUE)
      )
  }, .id = "file_name") #column to identify the source file

print("Results using Map Functions:")
print(results_map)