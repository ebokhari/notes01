# server file
# STAT 420
# app for correlation

library(MASS)

shinyServer(
     function(input, output) {    
          
          
          # bivariate normal random sample of size 100
          dataSample <- reactive({
               data = data.frame(mvrnorm(100, c(0,0), matrix(c(1, input$rho, input$rho, 1), nrow = 2)))
               colnames(data) = c('X', 'Y')
               return(data)
          })
          
          rSample <- reactive({
               cor(dataSample())[2]
          })
          
          
          # scatterplot
          output$scatter <- renderPlot({
               
               # scatterplot
               scatterplot = 
                    ggplot(dataSample(), aes(x = X, y = Y)) +
                    geom_point(size = 2) +
                    scale_y_continuous(name = expression(Y), breaks = NULL) +
                    scale_x_continuous(name = expression(X), breaks = NULL) +
                    theme(axis.title.x = element_text(size = 17), axis.title.y = element_text(size = 17)) +
                    ggtitle(bquote(atop('Scatterplot of sample data from', 
                                        'bivariate normal distribution with '~rho[XY] ==.(input$rho)))) + 
                    theme(plot.title = element_text(lineheight = .8, face = 'bold', size = 25)) + 
                    geom_smooth(method = 'lm')
              
               print(scatterplot)
               
          })
          
                  
     })
