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

##Fix
ChemData_new<-ChemData %>%
  filter(complete.cases(.)) %>%
  separate(col = Tide_time , #Choose the column of tide time 
         into = c("Tide", "Time"),  #separate it into two columns tide and time
         sep = "_")
  
  head(ChemData_new)
  