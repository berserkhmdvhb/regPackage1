#' Plot lambda of CV.GLMNET model
#' @param fit fit object from CV.GLMNET
#' @export
#' @return Returns plot of c
#' @details
#' Plots fit object fit against the log-lambda value and with each curve labeled:

plot_glmnet_cv_hmd_2 <- function(fit){

  return(plot({{fit}}, xvar = "lambda", label = TRUE))
}
