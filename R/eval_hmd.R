#' Evaluation Metrics Computed
#' @param actual The actual data (usually obtained from test data)
#' @param predicted Predictions from an arbitrary model
#' except the target
#' @export
#' @return Returns a hash of all evaluation metrics
#' @details
#' This functions computes various evaluation metrics of classification for a given
#' actual data and a prediction data. The function returns a hash containing the value of metrics

eval_hmd <- function(actual,
                    predicted){
  y_actual <- {{actual}}
  y_predicted <- {{predicted}}
  cm <- caret::confusionMatrix(data = as.factor(y_predicted), reference = as.factor(y_actual))
  acc <- Metrics::accuracy(y_predicted, y_actual)
  prec <- Metrics::precision(y_predicted, y_actual)
  rec <- Metrics::recall(y_predicted, y_actual)
  f1 <- Metrics::f1(y_predicted, y_actual)
  fb <- Metrics::fbeta_score(y_predicted, y_actual)
  h <- hash::hash()
  h[["confusion_matrix"]] <- cm
  h[["accuracy"]] <- acc
  h[["precision"]] <- prec
  h[["recall"]] <- rec
  h[["f1_score"]] <- f1
  h[["fbeta_score"]] <- fb
  return(h)
}

