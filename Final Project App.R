library(tidyverse)
library(shiny)
library(dplyr)
library(knitr)
library(tidytext)
plays.16 <- read_csv("play_by_play_data/regular_season/reg_pbp_2016.csv")



ui <- fluidPage(
  titlePanel("2016 Passing Summary"),
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
    plays.16 <- read_csv("play_by_play_data/regular_season/reg_pbp_2016.csv") %>% 
      filter(posteam =="NYG" | posteam =="NE")
    ggplot(data = plays.16, aes(x = yards_gained, y = pass_location )) + geom_point()
  })
  
}

shinyApp(ui = ui, server = server)