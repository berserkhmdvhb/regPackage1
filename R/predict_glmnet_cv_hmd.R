#' Predict data with results from CV GLMNET model
#' @param fit fit object from a cv.glmnet model
#' @param data An arbitrary dataframe
#' @param lchoice how to choose lambda model. Choices are "min", "1se".
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
                                  type="response"
                          ){
  lambda <- paste("lambda.",{{lchoice}},sep = "")
  coef <- coef({{fit}}, s=lambda)
  if ({{type}} == "response")
  {
    predict <- predict({{fit}}, data, s=lambda, type="response")
  }
  else{
    predict <- predict({{fit}}, data, s=lambda)
  }
  return(list(coef,predict))
}
