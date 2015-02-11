# ui file
# STAT 420
# app for correlation

shinyUI(
     fluidPage(
          title = 'Stat 420: Correlation and Simple Linear Regression',
          
          sidebarPanel(
               
               # For LaTeX
               tags$head(tags$script(src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS_HTML-full", type = 'text/javascript'),
                         tags$script("MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});", type='text/x-mathjax-config')),
               # message
               h3('Demonstration of correlation and simple linear regression', align = 'center'),
               br(), 
               p('A random sample of size 100 is drawn from a bivariate normal distribution with specified population correlation.
                 A scatterplot of the data is given along with the estimated correlation coefficient and the least squares regression
                 line.'),
               
               br(), 
               
               # explanatory variable
               sliderInput('rho', h5(HTML('$\\rho_{_{XY}}$')), value = .5, 
                           min = -.99, max = .99, step = .01)
               
               
               
          ),
          
          mainPanel(
               
               plotOutput('scatter')
               
               )
          
     )
)
