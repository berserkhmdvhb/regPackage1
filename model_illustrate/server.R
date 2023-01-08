server <- function(session, input, output) {

  filtered_data <- reactive(
    insurance_test %>%
      filter(place_name %in% input$place_name_selected)
  )

  output$unemp_plot <- renderPlot({

    ggplot(data = filtered_data()) +
      theme_minimal() +
      geom_line(aes(year, unemployment_rate_in_percent, color = place_name)) +
      labs(title = paste("Unemployment in", paste(input$place_name_selected, collapse = ", ")))
  })
}
