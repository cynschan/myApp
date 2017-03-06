#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ICC)

# Define server logic required to calculate sample sizes
shinyServer(function(input, output) {

  est <- reactive ({
  getEst <- Nest(est.type="h", w=input$w, ICC=input$estICC,k=input$k,alpha=as.numeric(input$alpha))
  })
  
  output$answer <- renderText({
     est()[1,1]
   })
  
  est1 <- reactive ({
    getEst1 <- Nest(est.type="h", w=input$w*2, ICC=input$estICC,k=input$k,alpha=as.numeric(input$alpha))
  })
  
  est2 <- reactive ({
    getEst2 <- Nest(est.type="h", w=input$w/2, ICC=input$estICC,k=input$k,alpha=as.numeric(input$alpha))
  })
  
  output$text1 <- renderText({paste(est1()[1,1]," (for CI width = ", input$w*2,")")})

  output$text2 <- renderText({paste(est2()[1,1], " (for CI width = ", input$w/2,")")})
  
})
  
