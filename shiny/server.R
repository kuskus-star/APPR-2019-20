library(shiny)

shinyServer(function(input, output) {
  output$RACL00 <- renderUI(
    selectInput("RACL00", label="Izberi Dejavnost",
                choices=c("Cinema","Live performances","Sports events","Cultural sites"
                )))
  
  output$razlogi <-  renderPlot({
    main <- "Pogostost števila naselij"
    razlogi_graf<- filter(Slika,Slika$GEO == "Slovenia",Slika$ACL00 == input$RACL00,QUANTILE != "Total")
    rac<-ggplot(razlogi_graf,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()
    rac
  })
  output$QUANTILE <- renderUI(
    selectInput("QUANTILE", label="Izberi Kvintil",
                choices=c(1,2,3,4,5,"Total"
                )))
  
  output$ACL00 <- renderUI(
    selectInput("ACL00", label="Izberi Dejavnost",
                choices=c("Cinema","Live performances","Sports events","Cultural sites"
                )))
  
  output$naselja <- renderPlot({
    main <- "Pogostost števila naselij"
      temp <- Neudelezevanje_15 %>% filter(Neudelezevanje_15$QUANTILE == input$QUANTILE,Neudelezevanje_15$ACL00 == input$ACL00)
      main <- paste(main, "Delež prebivalstva", input$QUANTILE)
    zemljevid_sport <- tm_shape(merge(svet,temp, by.x = "NAME", by.y = "GEO"),bbox = bb(c(-11,33,36,68))) + 
      tm_fill(col = "Value", contrast = 1, palette = "YlOrRd", breaks = c(15,46,67.1,97), title = "Neudelezevnje", textNA = "Manjkajoči podatki") +
      tm_layout(legend.outside = TRUE)
    zemljevid_sport
  })
})
