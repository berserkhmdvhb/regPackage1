#' Predict data with results from CV GLMNET model
#' @param fit Fit object from a cv.glmnet model
#' @param data An arbitrary dataframe
#' @param lchoice How to choose lambda model. Choices are "min", "1se"
#' @param type Type of prediction required. Type "link" gives the linear
#' predictors for "binomial" or "multinomial" models;
#' for "gaussian" models it gives the fitted values. Type "response" gi.
#' @export
#' @return Returns fit object of glmnet function
#' @details
#' This functions allows the user to perform cross-validated eslastic net (which
#' is a generalized
#' linear model) on a given
#' dataframe by specifying feature names (response variables),
#' target variable, family of distribution, and the dataset (in my case, Medical
#' Cost Personal Datasets)

predict_glmnet_cv_hmd <- function(fit,
                                  data,
                                  lchoice="min",
                                  type="link"
                          ){
  lambda <- paste("lambda.",{{lchoice}},sep = "")
  coef <- coef({{fit}}, s=lambda)
  if ({{type}} == "link")
  {
    predict <- predict({{fit}}, data, s=lambda, type="link")
  }
  else{
    predict <- predict({{fit}}, data, s=lambda)
  }
  return(list(coef,predict))
}
