

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


shinyUI(pageWithSidebar(
        headerPanel("k-means clustering example"),
        sidebarPanel(sliderInput('nClusters', 'Cluster count',value = 3, step = 1,
                                  min = 1, max = 9),
                     HTML("Choose the number of clusters (1 to 9)<br><br><br>"),
                     HTML("<B>Values of Cluster's Centers</B>"),
                     tableOutput("table_centers")
        ),
        mainPanel(plotOutput('plot_clusters'))
))
