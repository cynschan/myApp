#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#

library(shiny)

# Define UI for application that calculates sample size for reproducibility study
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Sample Size Calculator"),
  
  # # User inputs for parameters needed
  sidebarLayout(
      sidebarPanel(
        h5("Calculate the number of individuals required to estimate the ICC with a desired confidence interval"),
        numericInput("estICC","Expected ICC (Between 0 and 1)", value=0.5,min=0,max=1,step=.01),
        numericInput("w","Width of CI (Between 0 and 1)", value=0.2,min=0.01,max=0.99,step=.01),
        numericInput("k","N measurements or replicates (Minimum 2)",value=2,min=2,max=20000,step=1),
        selectInput("alpha","Alpha level for estimating confidence interval", selected="0.05",choices=c("0.01","0.05","0.1")),
        submitButton("Submit")
      ),
      mainPanel(
        h4("This sample size calculator can be used to determine the required number of subjects for a reproducibility study
            of a quantitative outcome, as assessed by the intraclass correlation coefficient (ICC).  The sample size calculation
            is aimed at achieving sufficient precision of the estimated ICC with regards to the expected width of the 
            confidence interval (CI) of the ICC."),
        br(),
        div(h3("SAMPLE SIZE NEEDED:"), style="color:blue"),
        div(textOutput("answer"), style="color:blue"),
        br(),
        em("Sample size needed for double the input CI width:"),
        textOutput("text1"),
        br(),
        em("Sample size needed for half the input CI width:"),
        textOutput("text2"),
        br(),
        h5("******************************************************************************************"),
        h4("Parameters"),
        strong("Expected ICC:"), h5("The predicted or expected intraclass correlation coefficient of the measure. ICC ranges from 0.0 (poor agreement) to 1.0 (excellent agreement)."),
        strong("Width of CI:"), h5("The desired width of the confidence interval around the ICC estimate."),
        strong("N measurements:"), h5("The number of measurements per individual or group."),
        strong("Alpha level:"), h5("The alpha level to use for estimating the confidence interval."),
        br(),
        em("Source:  M.E. Wolak, D.J. Fairbairn, Y.R. Paulsen (2012) Guidelines for Estimating Repeatability. 
          Methods in Ecology and Evolution 3(1):129-137.")
    )
  )
))
