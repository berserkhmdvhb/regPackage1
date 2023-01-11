#' Predict data with results from GLMNET model
#' @param fit Fit object from a cv.glmnet model
#' @param lchoice How to choose lambda model. Choices are "min", "1se".
#' @export
#' @return AIC and BIC from a glm fit object
#' @details
#' This function allows the user to extract AIC and BIC from a cv.glmnet fit object.

glmnet_cv_aic_hmd <- function(fit,
                              lchoice="min"
){
  lambda <- paste("lambda.", {{lchoice}},sep = "")

  whlm <- which({{fit}}$lambda == {{fit}}[[lambda]])
  with({{fit}}$glmnet.fit,
       {
         tLL <- nulldev - nulldev * (1 - dev.ratio)[whlm]
         k <- df[whlm]
         n <- nobs
         return(list('AICc' = - tLL + 2 * k + 2 * k * (k + 1) / (n - k - 1),
                     'BIC' = log(n) * k - tLL))
       })
}
