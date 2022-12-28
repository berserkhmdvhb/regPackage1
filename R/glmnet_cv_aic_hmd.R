#' Predict data with results from GLMNET model
#' @param fit fit object from a cv.glmnet model
#' @param lchoice how to choose lambda model. Choices are "min", "1se".
#' for "binomial" or "multinomial" models; for "gaussian" models it gives the fitted values.
#' Type "response" gi
#' @export
#' @return Returns fit object of glmnet function
#' @details
#' This functions allows the user to perform cross-validated eslastic net (which
#' is a generalized
#' linear model) on a given
#' dataframe by specifying feature names (response variables),
#' target variable, family of distribution, and the dataset (in my case, Medical
#' Cost Personal Datasets)

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
