#' Perform anova
#' @param fit fit object from GLM model
#' @export
#' @return Returns fit object of lm function
#' @details
#' This functions allows the user to perform anova on the fitted model.

anova_hmd <- function(fit){
  return(car::Anova({{fit}}, test.statistic = "LR", type = 3))
}
