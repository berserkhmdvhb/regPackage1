#' Predict data with results from CV GLMNET model
#' @param fit fit object from a cv.glmnet model
#' @param data An arbitrary dataframe
#' @param lchoice how to choose lambda model. Choices are "min", "1se".
#' @param type Type of prediction required. Type "link" gives the linear predictors
#' for "binomial" or "multinomial" models; for "gaussian" models it gives the fitted values.
#' Type "response" gi
#' @param target Target column in the data
#' @export
#' @return Returns fit object of glmnet function
#' @details
#' This functions allows the user to perform cross-validated eslastic net (which
#' is a generalized
#' linear model) on a given
#' dataframe by specifying feature names (response variables),
#' target variable, family of distribution, and the dataset (in my case, Medical
#' Cost Personal Datasets)

glmnet_cv_predict_hmd <- function(fit,
                                  data = regPackage1::insurance_test,
                                  target = "outcome",
                                  lchoice="min",
                                  type="link"
                          ){
  features_names=names({{data}})[names({{data}}) != {{target}}]
  if(nrow({{data}}) == 0) {
    warning("The returned data frame is empty.")
  }
  # make a copy of data with different pointer in memory
  df <- data.frame({{data}})
  # extract feature names either from input or dataframe

  features <- data.matrix(df[features_names])
  target_col <- as.numeric(unlist(df[{{target}}]))

  lambda <- paste("lambda.",{{lchoice}},sep = "")
  coef <- coef({{fit}}, s=lambda)
  if ({{type}} == "link")
  {
    predict <- predict({{fit}}, features, s=lambda, type="link")
  }
  else{
    predict <- predict({{fit}}, features, s=lambda)
  }
  return(list(coef,predict))
}