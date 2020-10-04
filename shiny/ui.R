library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Kulturno Neudeleževanje"),
  
  tabsetPanel(
    tabPanel("Razlogi za Neudeleževanje v Sloveniji",
             sidebarPanel(
               uiOutput("RACL00"),
               uiOutput("razlog"),
               uiOutput("drzava")
             ),
             mainPanel(plotOutput("razlogi"))),
    
    tabPanel("Neudeleževanje po Svetu",
             sidebarPanel(
               uiOutput("QUANTILE"),
               uiOutput("ACL00")
             ),
             mainPanel(plotOutput("naselja"))),
    tabPanel("Škatle z brki",
             sidebarPanel(
               uiOutput("dejavnost"),
               uiOutput("RAZZ")
             ),
             mainPanel(plotOutput("skatle")))
  )
))
