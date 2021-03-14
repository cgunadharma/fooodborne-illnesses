library(shiny)
library(dplyr)
library(ggplot2)

source("ui.R")

server <- function(input, output) {
    
    output$line_data <- renderPlot({
        
        colnames(west_coast) <- c( "Year", "California", "Washington", "Oregon")
        
        west_plot <- ggplot(west_coast) +
            geom_line(aes(x = `Year`,
                          y = west_coast[[input$state_type]]),
                      col = input$color_var) +
            labs(title = "Average Temp in West Coast",
                 x = "Year", y = input$state_type)
        
        west_plot
    })
}


