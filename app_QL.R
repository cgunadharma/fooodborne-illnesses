# Load libraries so they are available
library("shiny")
library(plotly)
library(tidyverse)

city_temp <- read.csv("city_temperature.csv")

algiers_ave_temp <- city_temp %>%
  filter(City == "Algiers") 

# Use source() to execute the `app_ui.R` and `app_server.R` files. These will
# define the UI value and server function respectively.
source("app_ui.R")
source("app_server.R")

# You will need to fill in the `app_ui.R` file to create the layout.
# Run the app through this file.

# Create a new `shinyApp()` using the loaded `ui` and `server` variables
shinyApp(ui = ui, server = server)