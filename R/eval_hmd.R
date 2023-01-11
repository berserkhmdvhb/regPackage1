#' Evaluation Metrics Computation for binary class
#' @param actual The actual data (usually obtained from the test data)
#' @param predicted Predictions from an arbitrary model
#' @export
#' @return Returns a hash of all evaluation metrics
#' @details
#' This functions computes various evaluation metrics of classification for a given
#' actual data and a prediction data, both of which should be binary class.
#' The function returns a hash containing the
#' following items: accuracy, precision, recall, F-score, F-beta score, confusion
#' matrix, and plot confusion matrix
eval_hmd <- function(actual,
                    predicted){
  y_actual <- {{actual}}
  y_predicted <- {{predicted}}

  if (is.factor(y_actual)){
    y_actual <- as.numeric(y_actual)
  }

  if (is.factor(y_predicted)){
    y_predicted <- as.numeric(y_predicted)
  }

  if (!(is.numeric(y_actual)) | !(is.numeric(y_predicted))){
    stop("The predicted and actual inputs should both contain at most two classes.
         Please ensure both of their class are either numeric of factor")
  }

  if (!(actual |> unique() |> length() == 2) | !(actual |> unique() |> length() == 2)){
    stop("Both actual and predicted should be binary. Ensure they contain only two classes.")
  }
  cm <- caret::confusionMatrix(data = as.factor(y_predicted),
                               reference = as.factor(y_actual),
                               dnn = c("Prediction", "Reference"))
  acc <- Metrics::accuracy(y_predicted, y_actual)
  prec <- Metrics::precision(y_predicted, y_actual)
  rec <- Metrics::recall(y_predicted, y_actual)
  f1 <- Metrics::f1(y_predicted, y_actual)
  fb <- Metrics::fbeta_score(y_predicted, y_actual)


  plt <- as.data.frame(cm$table)
  plt$Prediction <- factor(plt$Prediction, levels=rev(levels(plt$Prediction)))

  cm_plot <- ggplot2::ggplot(plt, ggplot2::aes(Prediction, Reference, fill=Freq)) +
    ggplot2::geom_tile() + ggplot2::geom_text(ggplot2::aes(label=Freq)) +
    ggplot2::scale_fill_gradient(low="white", high="#009194") +
    ggplot2::labs(x = "Reference", y = "Prediction") +
    ggplot2::scale_x_discrete(labels=c("Class_1","Class_2")) +
    ggplot2::scale_y_discrete(labels=c("Class_2","Class_1"))


  h <- hash::hash()
  h[["confusion_matrix"]] <- cm
  h[["confusion_matrix_plot"]] <- cm_plot
  h[["accuracy"]] <- acc
  h[["precision"]] <- prec
  h[["recall"]] <- rec
  h[["f1_score"]] <- f1
  h[["fbeta_score"]] <- fb
  return(h)
}
