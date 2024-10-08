### Practice tidy with biogeochemistry SGD data from Hawaii ####
### Created by: Jobel Y. Villafane Pagan #############
### Updated on: 2024-10-02 ####################


#### Load Libraries ######
library(tidyverse)
library(here)

### Load data ######
ChemData<-read_csv(here("Week_04","data", "chemicaldata_maunalua.csv"))
View(ChemData)
glimpse(ChemData)

## Filter data Na ##

ChemData_Clean<-ChemData %>%
  drop_na() %>% # Filters out everything that is not a complete row
separate(col = Tide_time , #Choose the column of tide time 
         into = c("Tide", "Time"),  #separate it into two columns tide and time
         sep = "_", #Separate by _
         remove = FALSE) %>%  #Keep the original tide_time column

unite(col = "Site_Zone",  #the name of the NEW column
      c(Site, Zone),  # the columns to unite
      sep = ".", #lets put a . in the middle
      remove = FALSE) #keep the original

ChemData_long <-ChemData_Clean %>%
  pivot_longer(cols = Temp_in:percent_sgd, # the columns you want to pivot. his says select the temp to percent SGD columns
               names_to = "Variables", # the names of the new columns with all the columns name
               values_to = "Values") #names of the new columns with all the values

ChemData_long %>%
group_by(Variables, Site) %>% #group by everything we want 
  summarise(Param_means = mean(Values, na.rm = TRUE), #get mean
            Param_vars = var(Values, na.rm = TRUE)) #get variance
  
  ##Chalange calculate mean, varience and standar deviation by site, zone and tide

ChemData_long %>%
  group_by(Site, Zone, Tide) %>% # Group by site, zone, and tide
  summarise(Param_means = mean (Values, na.rm = TRUE), #mean
            Parm_vars = var(Values, na.rm = TRUE), #Variance
            Param_sd = sd(Values, na.rm = TRUE)) #Standar deviation
  
##Plotting data as facet
ChemData_long %>%
  ggplot(aes(x = Site, y = Values))+
  geom_boxplot()+
  facet_wrap(~Variables, scales = "free")

#Long to wide
ChemData_wide<-ChemData_long %>%
  pivot_wider(names_from = Variables,
              values_from = Values)

## Start again with other data
ChemData_clean<-ChemData %>%
  drop_na() %>%  #Filters what is not in complete rows
  separate(col = Tide_time, #Choose the columns
           into = c("Tide", "Time"), #separate into two
           sep = "_",  #separate by _
           remove = FALSE) %>%
  pivot_longer(cols = Temp_in:percent_sgd,  #column to pivot
                names_to = "Variables",  #names of the new columns
                values_to = "Values") %>%
  group_by(Variables, Site,Time) %>%
    summarise(mean_vals = mean(Values, na.rm = TRUE)) %>%
    pivot_wider(names_from = Variables,
              values_from = mean_vals) %>%
write_csv(here("Week_04","Output","summary_biogeo.csv"))

View(ChemData_wide)




