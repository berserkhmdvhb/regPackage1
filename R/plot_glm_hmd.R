#' Plot avPlots of GLM model
#' @param fit fit object from GLM
#' @export
#' @return Returns avPlot object from the car package
#' @details
#' Plot an added-variable plot of the dependent variable and one independent
#' variable from a multiple regression.

plot_glm_hmd <- function(fit){
  #fit <- regressor({{data}},{{target}})
  return(car::avPlots({{fit}}))
}
