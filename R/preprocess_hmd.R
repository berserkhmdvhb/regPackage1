#' Wrapper of all preprocessing functions and tasks (explained in the report)
#' @param data An arbitrary dataframe
#' @export
#' @return Returns cleaned dataframe ready to be fed into models
#' @details
#' This function is a wrapper around all functions defined in the preprocessing stage.
#' It allows the user to use the raw original data and using this function receive a data
#' ready to be fed into models. This function applies the following functions on the given dataframe:
#' janitor::clean_names, regPackage1::categoricals_hmd, regPackage1::impute_median_hmd

preprocess_hmd <- function(data=regPackage1::car_insurance_data){
  # ensure dataframe is not empy
  if(nrow({{data}}) == 0) {
    warning("The inputted data frame is empty.")
  }
  # make a copy of data with different pointer in memory
  df <- data.frame({{data}})
  # clean names of columns of dataframe
  df <- janitor::clean_names(df)
  df <- categoricals_hmd(df)
  df <- impute_median_hmd(df)
  dummy <- caret::dummyVars(" ~ .", data=df)
  df_enc <- data.frame(stats::predict(dummy, newdata = df))
  df_dict <- train_test_splitter_hmd(df_enc,
                                     proportion=0.8)
  train <- df_dict$train
  test <- df_dict$test

  for (col in names(train)){
    if (col %in% c("annual_mileage", "postal_code", "credit_score"))
    {
      next
    }
    train[[col]] <- as.integer(train[[col]])
    test[[col]] <- as.integer(test[[col]])
  }
  df_dict_norm <- normalizer_hmd(train,test)


  train <- df_dict_norm$train_norm
  test <- df_dict_norm$test_norm

  train$id <- as.double(train$id)
  test$id <- as.double(test$id)

  train_racog <- imbalance::racog(train,
                       numInstances = 3000,
                       burnin = 100,
                       lag = 20,
                       classAttr = "outcome")
  insurance_train <- base::rbind(train , train_racog)
  insurance_test <- test
  insurance_train <- within(insurance_train, rm("id"))
  insurance_test <- within(insurance_test, rm("id"))

  h <- hash::hash()
  h[["train_norm"]] <- insurance_train
  h[["test_norm"]] <- insurance_test
  return(h)
}
