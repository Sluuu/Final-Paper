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

WDIsearch("gdp growth")
WDIsearch("inflation")
WDIsearch("population, total")
WDIsearch("Unemployment, total")
WDIsearch("Labor force participation rate, total")
WDIsearch("Trade (% of GDP)")
WDIsearch("GNI per capita")

world_bank_data <-WDI(
    indicator =
      c("FP.CPI.TOTL.ZG", "NY.GDP.MKTP.KD.ZG", "SP.POP.TOTL","SL.UEM.TOTL.NE.ZS", "SL.TLF.CACT.NE.ZS", "NE.TRD.GNFS.ZS", "NY.GNP.MKTP.PC.CD")
  )


#### Save Data ####
write_csv(world_bank_data, "data/raw_data/raw_data.csv")
