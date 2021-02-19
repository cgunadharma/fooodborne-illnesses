library(dplyr)
library(tidyverse)
city_temperature <- read.csv("city_temperature.csv",header = TRUE) 


monthly_temp_2019 <- city_temperature %>%
  filter(City == "Seattle", Year == "2019") %>%
  group_by(Month) %>%
  summarize (mean_temp = round(mean(AvgTemperature),1))

monthly_temp_1995 <- city_temperature %>%
  filter(City == "Seattle", Year == "1995") %>%
  group_by(Month) %>%
  summarize(Mean_Temp = round(mean(AvgTemperature),1))

max_1995 <- city_temperature %>%
  filter(City == "Seattle", Year == "1995") %>%
  group_by(Month) %>%
  summarize(max_temp = round(max(AvgTemperature),1))

max_2019 <- city_temperature %>%
  filter(City == "Seattle", Year == "2019") %>%
  group_by(Month) %>%
  summarize(max_temp = round(max(AvgTemperature),1))


months <- c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")
mean_temp_1995 <-monthly_temp_1995$Mean_Temp
mean_temp_2019 <-monthly_temp_2019$mean_temp
max_temp_1995 <- max_1995$max_temp
max_temp_2019 <- max_2019$max_temp

summary_table <- data.frame(months, mean_temp_1995,mean_temp_2019,max_temp_1995,max_temp_2019)

