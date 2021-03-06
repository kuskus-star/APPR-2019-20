library(shiny)

shinyServer(function(input, output) {
  output$RACL00 <- renderUI(
    selectInput("RACL00", label="Izberi Dejavnost",
                choices=c("Kino","Muzeji in galerije","Športni dogodki","Nastopi v živo"
                )))
  
  output$razlogi <-  renderPlot({
    main <- "Pogostost števila naselij"
    razlogi_graf<- filter(Slika,Slika$GEO == input$drzava,Slika$ACL00 == input$RACL00,QUANTILE != "Celotna populacija")
    for (i in c("Finančni razlogi", "Ni zanimanja","Ni v okolici","Ostalo")){
      if (!(i %in% input$razlog)) {
        razlogi_graf<-filter(razlogi_graf,razlogi_graf$REASON != i)
        axis(2,at=seq(0,80,10))
      }
    } 
    rac<-ggplot(razlogi_graf,aes(x=QUANTILE,y = TVALUE,fill = REASON,)) + geom_col()
    rac
  })
  output$QUANTILE <- renderUI(
    selectInput("QUANTILE", label="Izberi Kvintil",
                choices=c("1.","2.","3.","4.","5.","Celotna populacija"
                )))
  output$drzava <- renderUI(
    selectInput("drzava", label="Izberi Državo",
                choices=Slika$GEO
                ))
  
  output$razlog <- renderUI(
    checkboxGroupInput("razlog", label="Prikaži razloge",selected = c("Finančni razlogi", "Ni zanimanja","Ni v okolici","Ostalo"),
                       choiceNames=c("Finančni razlogi", "Ni zanimanja","Ni v okolici","Ostalo"
                       ), choiceValues=c("Finančni razlogi", "Ni zanimanja","Ni v okolici","Ostalo"
                )))
  
  output$ACL00 <- renderUI(
    selectInput("ACL00", label="Izberi Dejavnost",
                choices=c("Kino","Muzeji in galerije","Športni dogodki","Nastopi v živo"
                )))
  
  output$RAZZ <- renderUI(
    selectInput("RAZZ", label="Prikaži razloge",selected = c("Finančni razlogi", "Ni zanimanja","Ni v okolici","Ostalo"),
                       choices=c("Finančni razlogi", "Ni zanimanja","Ni v okolici","Ostalo"
                       )))
  
  output$dejavnost <- renderUI(
    selectInput("dejavnost", label="Izberi Dejavnost",
                choices=c("Kino","Muzeji in galerije","Športni dogodki","Nastopi v živo"
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
  
  output$skatle <- renderPlot({
    main <- "Škatlice"
    tmp_data <- filter(Slika,Slika$REASON==input$RAZZ,Slika$ACL00==input$dejavnost,Slika$QUANTILE != "Celotna populacija")
    zemljevid_brki<-ggplot(tmp_data,aes(x = QUANTILE,y=TVALUE),col="orange")+
    geom_boxplot()
    zemljevid_brki
  })
})
