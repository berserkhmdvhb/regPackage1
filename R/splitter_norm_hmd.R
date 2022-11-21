#' Splitting and Normalizind Data
#' @param data An arbitrary dataframe
#' @param replace If set to TRUE, the split will be replaced samples
#' @param proportion Proportion of train to test. Default is 0.7, which results
#' in 935 rows for train and 403 rows for test in case of using insurance_data.
#' @param normalize If set to TRUE, then the features are normalized either by
#' minmax or std, which is determined by the parameter "normalize_method"
#' @param normalize_method if set to "std", then standard scaler is used, and if
#' set to "minmax", minmax is applied.
#' normalization of features, and if set to "minmax", then minmax scaler is used. Default is "std".
#' @export
#' @return Returns a list of containing train and test data (both normalized if user requests)
#' @details
#' This functions allows the user to split data into train and test, and then
#' if the user sets normalize to TRUE, it normalizes data based on the moethod
#' user prefers
splitter_norm_hmd <- function(data=insurance_data,
                    replace=TRUE,
                    proportion=0.7,
                    normalize=FALSE,
                    normalize_method="minmax"){
  # ensure dataframe is not empty
  if(nrow({{data}}) == 0) {
    warning("The returned data frame is empty.")
  }
  # make a copy of data with different pointer in memory
  df <- data.frame({{data}})
  # for reproducability purpose
  set.seed(1)


  #use 70% of dataset as training set and 30% as test set
  sample <- sample(c(TRUE, FALSE), nrow(df),
                   replace={{replace}}, prob=c({{proportion}},1-{{proportion}}))
  train  <- df[sample, ]
  test   <- df[!sample, ]




  # normalize data based on user preference
  if (normalize == TRUE){
    train_numeric <- dplyr::select_if(train, is.numeric)
    test_numeric <- dplyr::select_if(test, is.numeric)
    if(tolower(normalize_method) == "minmax"){
      method <- c("range")
    }
    else if (tolower(normalize_method) == "std"){
      method <- c("center", "scale")
    }
    else{
      warning("Method is not defined, minmax will be used")
    }
    # normalizer

    process <- caret::preProcess(train_numeric, method=c("range"))
    train_norm <- stats::predict(process, train_numeric)
    test_norm <- stats::predict(process, test_numeric)
    for (col in names(train_numeric)){
      train[col] <- train_norm[col]
      test[col] <- test_norm[col]
    }
  }

  l <- list(train,test)
  return(l)
}

#train,test = l[[1]],l[[2]]
