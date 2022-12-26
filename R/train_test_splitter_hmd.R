#' Splitting and Normalizind Data
#' @param data An arbitrary dataframe
#' @param proportion Proportion of train to test. Default is 0.7, which results
#' @export
#' @return Returns a dictionary containing train and test data
#' @details
#' This functions allows the user to split data into train and test



train_test_splitter_hmd <- function(data=regPackage1::car_insurance_data,
                              proportion=0.7
                              ){
  # ensure dataframe is not empty
  if(nrow({{data}}) == 0) {
    warning("The returned data frame is empty.")
  }
  # make a copy of data with different pointer in memory
  df <- data.frame({{data}})
  train <- df |> dplyr::sample_frac({{proportion}})
  test  <- dplyr::anti_join(df, train, by = 'id')
  d <- c("train"=train, "test" =test)
  return(d)
}

