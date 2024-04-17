#### Preamble ####
# Purpose: Modes for low and high income countries
# Author: Sean Liu
# Date: 16 April 2024
# Contact: yuhsiang.liu@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
library(readr)
library(dplyr)
library(arrow)
library(dataverse)
library(WDI)
library(rstanarm)
library(broom)
library(stargazer)

#### Read data ####
data_na<- read_csv(here::here("data/analysis_data/analysis_data.csv"))


### Model data ####

data_na <- data_na %>%
  mutate(low_income = as.numeric(gni_per_cap <= 3995))


lowincome <- data_na %>% filter(low_income == 1)
highincome <- data_na %>% filter(low_income == 0)
lowmodel <- glm(gni_per_cap ~ gdp_growth + population + unem_rate + lf_par_rate + trade_per + inflation, 
                family = gaussian(link = "identity"), data = lowincome)

stargazer(lowmodel, type = "text",
          title = "Summary of Low Income Model",
          align = TRUE,
          out = "model_summary.txt")


highmodel <- glm(gni_per_cap ~ gdp_growth + population + unem_rate + lf_par_rate + trade_per + inflation, 
                family = gaussian(link = "identity"), data = highincome)

stargazer(lowmodel, type = "text",
          title = "Summary of High Income Model",
          align = TRUE,
          out = "model_summary.txt")


#### Save model ####
saveRDS(
  lowmodel,
  file = "other/models/lowmodel.rds"
)

saveRDS(
  highmodel,
  file = "other/models/highmodel.rds"
)



