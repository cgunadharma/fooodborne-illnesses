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
    
    output$scatter <- renderPlotly({
        
        algiers_ave_temp <- city_temp %>%
            filter(City == "Algiers") 
    
        col_names <- colnames(city_temp)

        my_plot <- ggplot(data = algiers_ave_temp) +
            geom_point(mapping = aes_string(x = input$x_var, y = input$y_var), 
                       color = input$color, size = input$size) +
            labs(title = "Average Temperature in Algiers over years")
        
        ggplotly(my_plot)
    })
}

