library(shiny)
library(shinycustomloader)

ui <- function(request){
  fluidPage(


    sidebarLayout(

      sidebarPanel(
        selectInput("model_selected", "Select Model:",
                       choices=c("Logistic Regression", "Random Forest"),
                       multiple = FALSE

        ),
        hr(),
        selectInput("evaluation_selected", "Select type of plot:",
                    choices = c("ROC Curve", "Confusion Matrix"),
                    multiple = FALSE
        ),
        hr(),
        actionButton(inputId = "run_plot",
                     label = "Click here to plot the selected evaluation"),
        helpText("Classification is perforemd on the outcome column")
      ),

      mainPanel(
        titlePanel("Model Evaluation for the Car Insurance Data"),
        shinycustomloader::withLoader(plotOutput("evaluation_plots"), type="html", loader="loader5")
      )
    )
  )

}
