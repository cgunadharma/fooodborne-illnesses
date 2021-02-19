city_temp <- read.csv("city_temperature.csv")

max_temp_year <- city_temp %>%
  filter(State == "Washington" | State == "Oregon" | State == "California") %>%
  group_by(City) %>%
  filter(AvgTemperature == max(AvgTemperature)) %>%
  group_by(Year) %>%
  test <- count(Year)

ggplot(data = max_temp_year) +
  geom_col(
    mapping = aes(x = Year, y = test),
    color = "yellow"
  ) + 
  scale_x_discrete() +
  scale_y_continuous() +
  labs (
    title = "Tempature in Seattle, WA in June, 2016",
    x = "Day",
    y = "Average Temperature (F)"
  )
  


    