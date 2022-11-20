#' Plot avPlots of GLM model
#' @param fit fit object from GLM
#' @param cat_cols List of categorical columns need to be factored and result in
#'  levels
#' @export
#' @return Returns avPlot object from the car package
#' @details
#' Plot an added-variable plot of the dependent variable and one independent
#' variable from a multiple regression.

plot_hmd <- function(fit){
  #fit <- regressor({{data}},{{target}})
  return(car::avPlots({{fit}}))
}
