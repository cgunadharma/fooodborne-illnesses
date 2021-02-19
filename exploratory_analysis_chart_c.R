city_temp <- read.csv("city_temperature.csv")

city_comparison <- city_temp %>%
  filter(
    State == "Washington" | State == "Oregon" | State == "California",
    Year == 2015,
    Month == 3,
    Day == 7
  ) %>%
  select(City, AvgTemperature)

ggplot(data = city_comparison) +
  geom_col(
    mapping = aes(x = City, y = AvgTemperature),
    color = "red"
  ) + 
  scale_x_discrete() +
  scale_y_continuous() +
  labs (
    title = "Temperature in Washington, Oregon, and California on March 7th, 2015",
    x = "City",
    y = "Average Temperature (F)"
  )