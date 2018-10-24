library(shiny)

# First I have to create my dataframe with random data
set.seed(1994)
a1 <- runif(n=200,min=0,max=100)
a2 <- runif(n=200,min=200,max=300)
a3 <- runif(n=200,min=400,max=500)
b1 <- runif(n=200,min=0,max=100)
b2 <- runif(n=200,min=200,max=300)
b3 <- runif(n=200,min=400,max=500)

x <- c(a1,a2,a3,a1,a2,a3,a1,a2,a3)
y <- c(b1,b1,b1,b2,b2,b2,b3,b3,b3)

df <- data.frame(x=x,y=y)

# Then create server code:

shinyServer(
        function(input, output, session) {
   
        kclusters <- reactive({
        kmeans(df, input$nClusters, iter.max=10)
        })
        
        output$plot_clusters <- renderPlot({
                palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
                          "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
                par(mar = c(5.1, 4.1, 0, 1))
                plot(df, col = kclusters()$cluster, pch = 1, cex = 1)
                points(kclusters()$centers, pch = 4, cex = 4, lwd = 4)
        })
        output$table_centers <- renderTable({kclusters()$centers})
                
})
