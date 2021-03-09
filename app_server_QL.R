city_temp <- read.csv("city_temperature.csv")

algiers_ave_temp <- city_temp %>%
  filter(City == "Algiers")

server <- function(input, output) {
  output$scatter <- renderPlotly({
    my_plot <- ggplot(data = algiers_ave_temp) +
      geom_point(mapping = aes_string(x = input$x_var, y = input$y_var), 
                 color = input$color, size = input$size) +
      labs(title = "Average Temperature in Algiers over years")
    ggplotly(my_plot)
  })
}