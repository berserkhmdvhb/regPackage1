#' Wrapper of all preprocessing functions and tasks (explained in the report)
#' @param data An arbitrary dataframe
#' @export
#' @return Returns processed dataframes inside a hash function containing both
#' train and test datasets
#' @details
#' This function is a wrapper around all functions defined in the preprocessing
#' stages, which are elaborated on in the report. In summary, the stages are
#' summarized in the following:
#' cleaning columns' names, treating categorical variables by converting them to
#' factors, impute missing values with median of their corresponding columns,
#' apply one-hot-encoding, split to train and test, convert back numeric columns
#' to their proper types (integer or double), applying racog (Rapidly converging
#' Gibbs algorithm) for oversampling the minority class so as to mitigate classes'
#' imabalance, Remove id column to prevent data leakage,

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
