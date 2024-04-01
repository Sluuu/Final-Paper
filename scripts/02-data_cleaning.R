#### Preamble ####
# Purpose: Cleans the raw data, filtering by year 2008, 2009, and 2020
# Author: Sean Liu
# Date: 2 April 2024
# Contact: yuhsiang.liu@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
library(readr)
library(dplyr)
library(arrow)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

wb_data <-
  raw_data |>
  rename(
    inflation = FP.CPI.TOTL.ZG,
    gdp_growth = NY.GDP.MKTP.KD.ZG,
    population = SP.POP.TOTL,
    unem_rate = SL.UEM.TOTL.NE.ZS,
    lf_par_rate = SL.TLF.CACT.NE.ZS,
    trade_per = NE.TRD.GNFS.ZS, 
    gdp_per_cap = NY.GDP.PCAP.CD
  ) |>
  select(country, year, inflation, gdp_growth, population, unem_rate, lf_par_rate, trade_per, gdp_per_cap) |>
  filter(year %in% c(2020, 2008, 2009))
data_na <- wb_data |> drop_na()



#### Save data ####
write_parquet(data_na, "data/analysis_data/data_na.parquet")
write_csv(data_na, "data/analysis_data/analysis_data.csv")

