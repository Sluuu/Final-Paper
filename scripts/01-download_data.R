#### Preamble ####
# Purpose: Downloads and saves the data from The World Bank
# Author: Sean Liu
# Date: 2 April 2024 
# Contact: yuhsiang.liu@mail.utoronto.ca
# License: MIT



#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(readr)
library(dataverse)
library(WDI)


#### Download data ####

download.file(url = "https://databank.worldbank.org/data/download/WDI_CSV.zip", 
              destfile = "data/raw_data/raw_data_testing.csv")

WDIsearch("gdp growth")
WDIsearch("inflation")
WDIsearch("population, total")
WDIsearch("Unemployment, total")

world_bank_data <-
  WDI(
    indicator =
      c("FP.CPI.TOTL.ZG", "NY.GDP.MKTP.KD.ZG", "SP.POP.TOTL","SL.UEM.TOTL.NE.ZS")
  )


#### Save Data ####
write_csv(world_bank_data, "data/raw_data/raw_data.csv")
