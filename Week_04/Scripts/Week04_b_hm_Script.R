### Homework using biogeochemistry SGD data from Hawaii ####
### Created by: Jobel Y. Villafane Pagan #############
### Updated on: 2024-10-05 ####################

#Load libraries #
library(tidyverse)
library(here)
library(beyonce)

### Load data ######
ChemData<-read_csv(here("Week_04","data", "chemicaldata_maunalua.csv"))
View(ChemData)
glimpse(ChemData)


ChemData_clean<-ChemData %>%
  drop_na() %>% # Filters out everything that is not a complete row
  separate(col = Tide_time , #Choose the column of tide time 
           into = c("Tide", "Time"),  #separate it into two columns tide and time
           sep = "_") %>%
  pivot_longer(cols = Temp_in:percent_sgd,
               names_to = "Variables",
               values_to = "Values") %>%
  filter(Tide == "Low", Season == "SPRING") %>%
  group_by(Variables, Site, Lat, Long, Zone) %>%
  summarise(Param_means = mean(Values, na.rm = TRUE),
          Param_vars = var(Values, na.rm = TRUE))

# Plotting
ggplot(data = ChemData_clean,
       mapping = aes(x = Variables, y = Param_means, color = Site)) +  # Use Param_means
  geom_point() +
  theme_minimal() +
  labs(title = "Biogeochemical conditions of Black Point and Wailupe (Oahu, HI) ",
       x = "Groundwater parameters",
       y = "Mean Values") +
  facet_wrap(~Variables, scales = "free")
