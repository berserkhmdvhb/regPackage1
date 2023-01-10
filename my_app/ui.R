library(shiny)
library(shinycustomloader)

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
        shinycustomloader::withLoader(plotOutput("evaluation_plots"), type="html", loader="loader5")
        #plotOutput("evaluation_plots") |> shinycustomloader::withLoader(plotOutput("distPlot"), type="image", loader="loader1")
      )
    )
  )

}
