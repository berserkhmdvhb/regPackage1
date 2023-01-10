#' Display shiny app
#' @export
#' @return Returns fit object of glmnet function
#' @details
#' This function displays the interactive shiny app in which one can have an intuition about
#' the performanceof two classification models (i.e., Logistic Regression, and Random Forest),
#' which are fitted on the insurance_train data and then predictions are generated
#' by predicting the insurance_test data and then predictions are evaluated comparing
#' them the actual test data values. on the insurance datasets.
#' More details about the datasets, the models used, the general procedure of classification
#' is provided in the package's report. In the interactive plot, there are two options
#' options, i.e., type of model, and type of evaluation plot. For the type of model,
#' the provided options are "Random Forest", and "Logistic Regression". For the type
#' of the evaluation, the provided options are "ROC Curve" and "Confusion Matrix".
#'
#'
shiny_run_hmd <- function() {
  appDir <- system.file("./my_app/", package = "regPackage1")
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `regPackage1`.", call. = FALSE)
  }

  shiny::runApp(appDir, display.mode = "normal")
}
