#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("K-means clustering"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    
    
    sidebarPanel(
        helpText("Create 300 random dataset based on the random seed and cluster 
               with the selected number of groups."),
                 
        numericInput("seed", "Random Seed", 123,
                     min = 1,
                     max = 1000),
        numericInput("cluster", "No. of clustering", 5, 
                     min = 1,
                     max = 9)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
