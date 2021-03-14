library(shiny)
library(dplyr)
library(ggplot2)

city_temp <- read.csv ("city_temperature.csv")

west_coast <- city_temp %>%
    filter(State == "California") %>%
    group_by(Year) %>%
    summarise(California = mean(AvgTemperature))

wa <- city_temp %>%
    filter(State == "Washington") %>%
    group_by(Year) %>%
    summarise(Washington = mean(AvgTemperature))

pdx <- city_temp %>% 
    filter(State == "Oregon") %>%
    group_by(Year) %>%
    summarise(Oregon = mean(AvgTemperature))

west_coast$Washington <- wa$Washington
west_coast$Oregon <- pdx$Oregon

page_two <- tabPanel(
    titlePanel("West Coast Average Temperature over the Years"),
    sidebarLayout(
        sidebarPanel(
            h3("Choose State"),
            selectInput(
                inputId = "state_type",
                label = "choose_state",
                choices = c("Washington", "Oregon", "California"),
            ),
            selectInput(
                inputId = "color_var",
                label = "Color of Points",
                choices = c("darkgray", "blue", "red", "orange",
                            "green", "brown", "purple")
            )
        ),
        ### Main panel displays the scatterplot
        mainPanel(
            h3("Average Temp in West Coast"),
            plotOutput(outputId = "line_data"),
            p("Average temperature in the West Coast over time")
        )
    )
)


ui <- navbarPage(
    "West Coast Analysis",
    page_two
)

