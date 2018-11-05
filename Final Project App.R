library(tidyverse)
library(shiny)
library(dplyr)
library(knitr)
library(tidytext)
library(rsconnect)
plays.17 <- read_csv("reg_pbp_2017.csv")



ui <- fluidPage(
  titlePanel("2017 Passing Summary"),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "passer_player_name",
                  label = "Passer", 
                  choices = c("E.Manning" = "Eli Manning", 
                              "T.Brady" = "Tom Brady"))
    ), 
      mainPanel(
        plotOutput(outputId = "scatter")
      )
    )
  )
  


server <- function(input, output) {
  output$scatter <- renderPlot({
   
    ggplot(data = plays.17, aes(x = yards_gained, y = pass_location )) + geom_point()
  })
  
}

shinyApp(ui = ui, server = server)