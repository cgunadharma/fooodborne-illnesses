city_temp <- read.csv("city_temperature.csv")

seattle <- city_temp %>%
  filter(
    City == "Seattle",
    Month == 6,
    Year == 2016) %>%
  select(Day, AvgTemperature)

ggplot(data = seattle) +
  geom_line(
    mapping = aes(x = Day, y = AvgTemperature),
    color = "blue"
    ) + 
  scale_x_continuous() +
  scale_y_continuous(limits = c(0, 100)) +
  labs (
    title = "Tempature in Seattle, WA in June, 2016",
    x = "Day",
    y = "Average Temperature (F)"
  )

