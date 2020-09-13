library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Kulturno Neudeleževanje"),
  
  tabsetPanel(
    tabPanel("po premoženju",
             DT::dataTableOutput("druzine")),
    
    tabPanel("Število naselij",
             sidebarPanel(
               uiOutput("QUANTILE")
             ),
             mainPanel(plotOutput("naselja")))
  )
))
