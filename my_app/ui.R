library(shiny)
library(shinycssloaders)

ui <- function(request){
  fluidPage(

    titlePanel("Model Evaluation for the Car Insurance Data"),

    sidebarLayout(

      sidebarPanel(
        selectInput("model_selected", "Select Model:",
                       choices=c("Logistic Regression", "Random Forest"),
                       multiple = FALSE

        ),
        hr(),
        selectInput("evaluation_selected", "Select type of plot:",
                    choices = c("ROC Curve", "Confusion Matrix"),
                    #selected = "ROC Curve",
                    multiple = FALSE
        ),
        hr(),
        helpText("Car Iinsurance data from the package")
      ),

      mainPanel(
        plotOutput("evaluation_plots") |> withSpinner()
      )
    )
  )

}
