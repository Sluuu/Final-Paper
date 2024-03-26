#### Preamble ####
# Purpose: Downloads and saves the data from Opendata Toronto
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(dplyr)
library(readr)

#### Download data and save data ####
download.file(url = "https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/a7ae08f3-c512-4a88-bb3c-ab40eca50c5e/resource/dc4ec2fa-d655-46ca-af32-f216d26e9804/download/Homeless%20deaths%20by%20month.csv", 
              destfile = "data/raw_data/raw_data_month.csv")

download.file(url = "https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/a7ae08f3-c512-4a88-bb3c-ab40eca50c5e/resource/ceafdcdf-5f41-4ba5-9b69-f4c8e581ab6e/download/Homeless%20deaths%20by%20cause.csv", 
              destfile = "data/raw_data/raw_data_cause.csv")

download.file(url = "https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/a7ae08f3-c512-4a88-bb3c-ab40eca50c5e/resource/04a75c51-e1ad-4ac3-82bf-e894b16bb9e5/download/Homeless%20deaths%20by%20demographics.csv", 
              destfile = "data/raw_data/raw_data_demographics.csv")




         
