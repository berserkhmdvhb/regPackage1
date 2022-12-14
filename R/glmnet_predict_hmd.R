#' Predict data with results from GLMNET model
#' @param fit fit object from a cv.glmnet model
#' @param data An arbitrary dataframe
#' @param target An arbitrary dataframe
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

glmnet_predict_hmd <- function(fit,
                               data = regPackage1::insurance_test,
                               target ="outcome",
                               type="binomial"
                          ){
  if(nrow({{data}}) == 0) {
    warning("The returned data frame is empty.")
  }
  features_names=names({{data}})[names({{data}}) != {{target}}]

  # make a copy of data with different pointer in memory
  df <- data.frame({{data}})
  # extract feature names either from input or dataframe

  features <- df[, colnames(df)[colnames(df) != {{target}}]]
  coef <- coef({{fit}})
  if ({{type}} == "response")
  {
    predict_proba <- stats::predict({{fit}}, features, type="response")
  }
  else{
    predict_proba <- stats::predict({{fit}}, features)
  }
  predict <- ifelse(predict_proba >0.5, 1, 0)
  h <- hash::hash()
  h[["coef"]] <- coef
  h[["predict_proba"]] <- predict_proba
  h[["predictions"]] <- predict
  return(h)
}
