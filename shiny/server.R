library(shiny)

shinyServer(function(input, output) {
  output$druzine <-  renderPlot({
    main <- "Pogostost števila naselij"
    if (!is.null(input$QUANTILE) && input$QUANTILE %in% levels(Neudelezevanje_Sport$QUANTILE)) {
      t <- Neudelezevanje_Sport %>% filter(Neudelezevanje_Sport$QUANTILE == input$QUAINTILE)
      main <- paste(main, "v regiji", input$QUANTILE)
    } else {
      t <- SLi %>% filter(QUANTILE == "Total")
    }
    
  })
  output$QUANTILE <- renderUI(
    selectInput("QUANTILE", label="Izberi pokrajino",
                choices=c( Neudelezevanje_Sport$QUANTILE
                )))
  
  output$naselja <- renderPlot({
    main <- "Pogostost števila naselij"
    if (!is.null(input$QUANTILE) && input$QUANTILE %in% Neudelezevanje_Sport$QUANTILE) {
      temp <- Neudelezevanje_Sport %>% filter(Neudelezevanje_Sport$QUANTILE == input$QUANTILE)
      main <- paste(main, "v regiji", input$QUANTILE)
    } else {
      temp <- Neudelezevanje_Sport %>% filter(QUANTILE == "Total")
    }
    zemljevid_sport <- tm_shape(merge(svet,temp, by.x = "NAME", by.y = "GEO")) + 
      tm_fill(col = "Value", contrast = 1, palette = "YlOrRd", breaks = c(20,30,40,50,60,70,80,90,100), title = "Neudelezevnje", textNA = "Manjkajoči podatki") +
      tm_layout(legend.outside = TRUE)
    zemljevid_sport 
  })
})
