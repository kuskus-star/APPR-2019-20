library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Kulturno Neudeleževanje"),
  
  tabsetPanel(
    tabPanel("Razlogi za Neudeleževanje v Sloveniji",
             sidebarPanel(
               uiOutput("RACL00")
             ),
             mainPanel(plotOutput("razlogi"))),
    
    tabPanel("Neudeleževanje po Svetu",
             sidebarPanel(
               uiOutput("QUANTILE"),
               uiOutput("ACL00")
             ),
             mainPanel(plotOutput("naselja")))
  )
))
