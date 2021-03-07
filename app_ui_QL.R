city_temp <- read.csv("city_temperature.csv")

algiers_ave_temp <- city_temp %>%
  filter(City == "Algiers") 

#Get a vector of all column' names:
col_names <- colnames(city_temp)

# Create a variable `x_input` that stores a `selectInput()` for your
# variable to appear on the x axis of your chart.
# Use the vector of column names as possible values, and make sure
# to assign an inputId, label, and selected value
x_input <- selectInput(
  inputId = "x_var", 
  choices = col_names, 
  label = "Choose an X Variable"
)

#Add a `selectInput` for the `y` variable
y_input <- selectInput(
  inputId = "y_var", 
  choices = col_names, 
  label = "Choose an Y Variable"
)

# Create a variable `color_input` as a `selectInput()` that allows users to
# select a color from a list of choices
color_input <- selectInput(
  inputId = "color", 
  choices = c("yellow", "cyan", "blue", "red", "black", "pink"), 
  label = "Choose a color"
)

# Create a variable `size_input` as a `sliderInput()` that allows users to
# select a point size to use in your `geom_point()`
size_input <- sliderInput(
  inputId = "size", 
  label = "Set the size", 
  min = 0.1, 
  max = 10, 
  value = 3
)

chart_a_sidebar_content <- sidebarPanel(
  color_input, 
  size_input,
  x_input,
  y_input
)

chart_a_main_content <- mainPanel(
  plotlyOutput(outputId = "scatter"),
  p("The chart is included to show the average temperature in Algiers city
  over years. From the chart, we see that the range of average temperature of 
    Algiers does not significantly change over years.")
)

chart_a_panel <- tabPanel(
  "Chart A",
  sidebarLayout(
    chart_a_sidebar_content,
    chart_a_main_content
  )
)

ui <- navbarPage(
  "Final Deliverable",
  chart_a_panel
)

