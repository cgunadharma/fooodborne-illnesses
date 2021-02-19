city_temp <- read.csv("city_temperature.csv")

max_temp_year <- city_temp %>%
  filter(State == "Washington" | State == "Oregon" | State == "California") %>%
  group_by(City) %>%
  filter(AvgTemperature == max(AvgTemperature)) %>%
  group_by(Year) 
  
ggplot(max_temp_year, aes(x=max_temp_year$Year)) +
  geom_bar() +
  labs(
    title = "Box Plot of Hottest Year in West Coast Cities",
    x = "Year",
    y = "# of cities that had their hottest day"
  )
  

  


    