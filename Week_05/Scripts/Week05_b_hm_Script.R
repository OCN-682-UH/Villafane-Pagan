### Homework: Data Wrangling - lubridate and time ###
### Created by: Jobel Y. Villafane Pagan ###
### Updated on: 2024-10-06 ####

#Load Libraries ##
library(tidyverse)
library(here)
library(lubridate)

##load data ##
#Conductivity data
CondData<-read_csv(here("Week_05", "Data", "CondData.csv"))

#Depth data
DepthData<-read_csv(here("Week_05", "Data", "DepthData.csv"))

glimpse(CondData)
glimpse(DepthData)

view(CondData)
View(DepthData)

##