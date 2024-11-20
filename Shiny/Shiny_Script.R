#Homework: Shiny ###
#Created by: Jobel Y. Villafane ###

# Load libraries
library(shiny)
library(ggplot2)
library(palmerpenguins)
library(dplyr)
library(rsconnect)



# Define the UI
ui <- fluidPage(
  titlePanel("Palmer Penguins: Dynamic Scatterplot"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("xvar", "Select X-axis Variable:", 
                  choices = names(penguins)[sapply(penguins, is.numeric)], 
                  selected = "bill_length_mm"),
      selectInput("yvar", "Select Y-axis Variable:", 
                  choices = names(penguins)[sapply(penguins, is.numeric)], 
                  selected = "bill_depth_mm"),
      selectInput("colorvar", "Color By:", 
                  choices = c("species", "island", "sex"), 
                  selected = "species")
    ),
    
    mainPanel(
      plotOutput("scatterplot")
    )
  )
)

# Define server
server <- function(input, output) {
  
  output$scatterplot <- renderPlot({
    # Remove rows with missing data
    filtered_data <- penguins %>% na.omit()
    
    ggplot(filtered_data, aes_string(x = input$xvar, y = input$yvar, color = input$colorvar)) +
      geom_point(size = 3, alpha = 0.8) +
      theme_minimal() +
      labs(title = "Dynamic Scatterplot of Palmer Penguins",
           x = input$xvar, y = input$yvar, color = input$colorvar) +
      theme(plot.title = element_text(hjust = 0.5, size = 16))
  })
}

# Run the application
shinyApp(ui = ui, server = server)

