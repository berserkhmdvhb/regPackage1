#' Plot results of CV.GLMNET model
#' @param fit fit object from CV.GLMNET
#' @export
#' @return Returns plot of c
#' @details
#' Plot an added-variable plot of the dependent variable and one independent
#' variable from a multiple regression.

plot_glmnet_cv_hmd <- function(fit){
  #fit <- regressor({{data}},{{target}})
  return(plot({{fit}}))
}
