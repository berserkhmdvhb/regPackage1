#' Plot lambda of CV.GLMNET model
#' @param fit fit object from CV.GLMNET
#' @export
#' @return Returns plot of c
#' @details
#' Plots fit object fit against the log-lambda value and with each curve labeled:

glmnet_cv_plot_hmd <- function(fit){
  return(plot({{fit}}, xvar = "lambda", label = TRUE))
}
