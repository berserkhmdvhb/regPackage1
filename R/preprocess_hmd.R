#' Prepare dataframe to be fed into models
#' @param data An arbitrary dataframe
#' @export
#' @return Returns cleaned dataframe ready to be fed into models
#' @details
#' This function is a wrapper around all functions defined in the preprocessing stage.
#' It allows the user to use the raw original data and using this function receive a data
#' ready to be fed into models. This function applies the following functions on the given dataframe:
#' janitor::clean_names, regPackage1::categoricals_hmd, regPackage1::impute_median_hmd

preprocess <- function(data=regPackage1::car_insurance_data){
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
  return(df)
}
