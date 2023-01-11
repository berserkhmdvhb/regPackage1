#' Normalizing Train and Test Data
#' @param train Training Data
#' @param test Test Data
#' @param normalize_method If set to "std", then standard scaler is used, and if
#' set to "minmax", minmax is applied. Default is "minmax".
#' @export
#' @return Returns normalized dataframe
#' @details
#' This functions allows the user to normalize given train and test data based on the method
#' user prefers



normalizer_hmd <- function(train, test,
                           normalize_method="minmax"){
  # ensure dataframe is not empty
  if(nrow({{train}}) == 0) {
    warning("The inputted train data frame is empty.")
  }
  if(nrow({{test}}) == 0) {
    warning("The inputted test data frame is empty.")
  }
  # make a copy of data with different pointer in memory
  df_train <- data.frame({{train}})
  df_test <- data.frame({{test}})
  train_numeric <- dplyr::select_if(df_train, is.numeric)
  test_numeric <- dplyr::select_if(df_test, is.numeric)

  if(tolower({{normalize_method}}) == "minmax"){
    method <- c("range")
  }
  else if (tolower({{normalize_method}}) == "std"){
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
    if (col == "id"){
      next
    }
    #if (all.equal(df_train[[col]], as.integer(df_train[[col]])) == TRUE)
    if (is.integer(df_train[[col]]== TRUE))
    {
      next
    }
    df_train[col] <- train_norm[col]
    df_test[col] <- test_norm[col]
  }
  h <- hash::hash()
  h[["train_norm"]] <- df_train
  h[["test_norm"]] <- df_test
  return(h)
}

