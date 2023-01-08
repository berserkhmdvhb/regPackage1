library(shiny)
ui <- function(request){
  fluidPage(

    titlePanel("Model Evaluation for the Car Insurance Data"),

    sidebarLayout(

      sidebarPanel(
        selectizeInput("model_selected", "Select Model:",
                       choices=c("Logistic Regression", "Random Forest"),
                       multiple = TRUE,
                       selected = c("Logistic Regression"),
                       options = list(
                         plugins = list("remove_button"),
                         create = TRUE,
                         persist = FALSE # keep created choices in dropdown
                       )
        ),
        hr(),
        helpText("Car Iinsurance data from the package")
      ),

      mainPanel(
        plotOutput("roc_curve")
      )
    )
  )

}
