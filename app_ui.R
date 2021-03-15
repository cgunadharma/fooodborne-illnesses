library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(shiny)

source("app_server.R")

#Analysis/Re-Shaping dataset

city_temp <- read.csv("city_temperature.csv")

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


algiers_ave_temp <- city_temp %>%
  filter(City == "Algiers") 

col_names <- colnames(city_temp)

# Define Pages 
page_one <-   page_one <- tabPanel(
  "Introduction",
  mainPanel(
    p("About this project:"),
    p(p("**Climate change** has a major impact on every person's life regardless of ethnicity, race, nationality, age, gender, job etc. 
      In order to prepare for the future, there is a dire need right now for a sense of acknowledgement within populations. 
      Climate change has a lot of moving parts to it and can be daunting to understand so we believe that manipulating data 
      may make it easier for us and others to absorb the individual impact it has on everyone's lives.The data set, 
      ([Daily Temperatures of Major Cities](https://www.kaggle.com/sudalairajkumar/daily-temperature-of-major-cities)), 
      was found on Kaggle and was collected by a data scientist at H2O.ai, an open source software company in Silicon Valley.  
      There are 1,048,575 observations in this data set with eight features: region, country, start, city, month, day, year, and average temperature. 
      This data set will go a long way in determining where the highest changes in temperature occurred and will allow us to measure multiple climate change variables. 
      We will be able to  answer questions such as: Based on current temperature patterns, which cities will be heavily impacted by climate change and global warming in the near future? 
      Have specific countries experienced no or little climate change?"),
      h3("About Us:"),
      p("Group Members: Clarissa Gunadharma, Quynh Le, Brenden Lasola" )
  )
 )
)

page_two <- tabPanel(
  "Algiers Temperature over the Years",
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "x_var", 
        choices = col_names, 
        label = "Choose an X Variable",
      ),
      selectInput(
        inputId = "y_var", 
        choices = col_names, 
        label = "Choose an Y Variable"
      ),
      selectInput(
        inputId = "color", 
        choices = c("yellow", "cyan", "blue", "red", "black", "pink"), 
        label = "Choose a color"
      ),
      sliderInput(
        inputId = "size", 
        label = "Set the size", 
        min = 0.1, 
        max = 10, 
        value = 3
      )
    ),
    ### Main panel displays the scatterplot
    mainPanel(
      "Average temp in Algiers",
      plotOutput(outputId = "scatter"),
      p("The chart is included to show the average temperature in Algiers city
        over years. From the chart, we see that the range of average temperature of 
        Algiers does not significantly change over years.")
    )
  )
)

page_three <- tabPanel(
  "West Coast Average Temperature over the Years",
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
      "Average Temp in West Coast",
      plotOutput(outputId = "line_data"),
      p("Average temperature in the West Coast over time")
    )
  )
)

page_four <- tabPanel(
  "Summary Analysis",
  mainPanel(
    h2("Major Takeaways"),
    p("Based on the specific climate change data we analyzed, we were able to learn some key takeaways about climate change variables based on average temperatures in certain cities and countries throughout decades, years and months. 
      Although the overall global temperatures may be rising over time, 
      specific countries like Algiers does not experience a significant amount of temperature change even though global warming is occurring. 
      Additionally, when honing into temperature trends in Seattle over the years (e.g from 1995 and 2019), temperatures had more variation in 2019 than it did in 1995. Although the data we’ve analyzed has been focused on temperature, 
      there is a strong correlation that variation in temperatures are aligned with climate change.")
  )
)

# Define UI 
ui <- navbarPage(
  "Final Deliverable: Climate Change Analysis", 
  page_one,
  page_two, 
  page_three, 
  page_four
)

shinyApp(ui, server)