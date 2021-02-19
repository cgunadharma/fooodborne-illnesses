# Summary Information Script: Climate Change Project

# Load data and packages-------------------------------------------------------
getwd()
data <- read.csv("city_temperature.csv")

library(tidyverse)

# Explore data----------------------------------------------------------------
# Make a list:
summary_info <- list()

# What is maximum average temperature? `max_ave_temp`
summary_info$max_ave_temp <- data %>%
  filter(AvgTemperature == max(AvgTemperature, na.rm = T)) %>%
  pull(AvgTemperature)

# When is the maximum average temperature? `date_max_temp`
summary_info$date_max_temp <- data %>%
  filter(AvgTemperature == max(AvgTemperature, na.rm = T)) %>%
  select(Month, Day, Year)

# Which place is the max average temperature found? `place_max_temp`
summary_info$place_max_temp <- data %>%
  filter(AvgTemperature == max(AvgTemperature, na.rm = T)) %>%
  select(Region, Country, State, City)

# What is the most recent highest average temperature? `recent_highest_ave_temp`
summary_info$recent_highest_ave_temp <- data %>%
  filter(Year == max(Year, na.rm = T)) %>%
  filter(Month == max(Month, na.rm = T)) %>%
  filter(Day == max(Day, na.rm = T)) %>%
  filter(AvgTemperature == max(AvgTemperature, na.rm = T)) %>%
  pull(AvgTemperature)

# Where is the most recent highest average temperature found? `place_recent_highest`
summary_info$place_recent_highest <- data %>%
  filter(Year == max(Year, na.rm = T)) %>%
  filter(Month == max(Month, na.rm = T)) %>%
  filter(Day == max(Day, na.rm = T)) %>%
  filter(AvgTemperature == max(AvgTemperature, na.rm = T)) %>%
  select(Region, Country, State, City)
