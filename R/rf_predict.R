#' Predict data with results from random forest model
#' @param fit fit object from a randomfForest model
#' @param data An arbitrary dataframe
#' @param target Target column in the data
#' @export
#' @return A hash containing predictions, and prediction probabilities
#' @details
#' This functions allows the user to predict a given dataset using fit object
#' obtained from the randomForest function

rf_predict_hmd <- function(fit,
                           data = regPackage1::insurance_test,
                           target = "outcome"

                           ){
  if(nrow({{data}}) == 0) {
    warning("The returned data frame is empty.")
  }
  df <- data.frame({{data}})

  X_test <- df[, colnames(df)[colnames(df) != {{target}}]]
  y_test <- as.factor(df[[{{target}}]])

  predict_rf <- stats::predict({{fit}}, X_test)
  pred_proba_rf <- stats::predict({{fit}}, X_test, type="prob")
  pred_proba_rf_list <- pred_proba_rf |> as.list() |> utils::tail(nrow(df)) |> unlist()

  h <- hash::hash()
  h[["predict_proba"]] <- pred_proba_rf_list
  h[["predictions"]] <- predict_rf
  return(h)
}
