#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    dataInput <- reactive({
        # generate random data from selected seed
        set.seed(input$seed)
        x <- c(rnorm(100, 0, 1), rnorm(100, 1, 3), rnorm(100, -1, 4))
        y <- c(rnorm(100, -1, 2), rnorm(100, 0, 5), rnorm(100, 1, 1))
        data <- data.frame(x, y)    
    })
    
    dataCluster <- reactive({
        clusters <- kmeans(dataInput(), input$cluster)
    })
    
    output$distPlot <- renderPlot({
    
        palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
                  "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
        
        par(mar = c(5.1, 4.1, 0, 1))
        plot(dataInput(),
             col = dataCluster()$cluster,
             pch = 20, cex = 2)
        points(dataCluster()$centers, pch = 4, cex = 1.5, lwd = 4)
        
  })
  
})
