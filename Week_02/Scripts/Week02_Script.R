### This is my first script. I am learning how to import data ####
### Created by: Jobel Yometh Villafane Pagan ####
### Created on: 2024-09-07 ####
#################################################


### libraries #####
library(tidyverse)
library(here)


### Read in my data #####
weight<-read_csv(here("Week_02","Data","weightdata.csv"))


# analysis ######
head(weight)  ## looks at the upper lines
tail(weight) ## looks at the bottom 6 lines
view(weight)
