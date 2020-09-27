library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Kulturno Neudeleževanje"),
  
  tabsetPanel(
    tabPanel("Neudeleževanje po razlogih",
             sidebarPanel(
               uiOutput("RACL00")
             ),
             mainPanel(plotOutput("razlogi"))),
    
    tabPanel("Neudeleževanje po Premoženju",
             sidebarPanel(
               uiOutput("QUANTILE"),
               uiOutput("ACL00")
             ),
             mainPanel(plotOutput("naselja")))
  )
))
