#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)
library(readr)
library(dplyr)

#### Clean data ####
raw_data_month <- read_csv("data/raw_data/raw_data_month.csv")
raw_data_cause <- read_csv("data/raw_data/raw_data_cause.csv")
raw_data_demographics <- read_csv("data/raw_data/raw_data_demographics.csv")
test_data <- read_csv("data/raw_data/raw_data_test.csv")

cleaned_data <-
  test_data[c("Country Name", "Country Code", "Indicator Name", "Indicator Code",  "2019", "2020")]

filtered_data <- cleaned_data %>%
  filter(`Indicator Code` %in% c("NY.GDP.PCAP.PP.KD", "SL.UEM.TOTL.NE.ZS", "NY.GDP.DEFL.KD.ZG", "NY.GDP.MKTP.KD.ZG", "NE.TRD.GNFS.ZS", "SL.TLF.CACT.NE.ZS"))



#### Save data ####
write_csv(cleaned_data, "outputs/data/analysis_data.csv")
