#' Predict data with results from CV.GLMNET model
#' @param fit fit object from a cv.glmnet model
#' @param data An arbitrary dataframe
#' @param target Target column in the data
#' @param lchoice how to choose lambda model. Choices are "min", "1se".
#' @param type Type of prediction required. Type "link" gives the linear predictors
#' for "binomial" or "multinomial" models; for "gaussian" models it gives the fitted values.
#' Type "response" gi
#' @param target Target column in the data
#' @export
#' @return Returns prediction of the cv.glmnet function
#' @details
#' This functions allows the user to predict a given dataset using fit object
#' obtained from the cv.glmnet function

glmnet_cv_predict_hmd <- function(fit,
                                  data = regPackage1::insurance_test,
                                  target = "outcome",
                                  lchoice="min",
                                  type="binomial"
                          ){
  if(nrow({{data}}) == 0) {
    warning("The returned data frame is empty.")
  }
  features_names=names({{data}})[names({{data}}) != {{target}}]

  # make a copy of data with different pointer in memory
  df <- data.frame({{data}})
  # extract feature names either from input or dataframe

  features <- data.matrix(df[features_names])
  target_col <- as.numeric(unlist(df[{{target}}]))

  lambda <- paste("lambda.",{{lchoice}},sep = "")
  coef <- coef({{fit}}, s=lambda)
  if ({{type}} == "response")
  {
    predict_proba <- stats::predict({{fit}}, features, s=lambda, type="response")
  }
  else{
    predict_proba <- stats::predict({{fit}}, features, s=lambda)
  }
  predict <- ifelse(predict_proba > 0.5, 1, 0)
  h <- hash::hash()
  h[["coef"]] <- coef
  h[["predict_proba"]] <- predict_proba
  h[["predictions"]] <- predict
  return(h)
}
