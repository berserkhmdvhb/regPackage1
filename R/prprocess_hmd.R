#' Prepare dataframe to bed fed into models
#' @param data An arbitrary dataframe
#' @export
#' @return Returns cleaned dataframe ready to be fed into models
#' @details
#' This functions allows to clean and prepare dataframe by cleaning column names, automatically detecting the
#' categorical columns and then factorizing them, and replace "na" and "Inf" values with NA



preprocess <- function(data=regPackage1::car_insurance_data){
  # ensure dataframe is not empy
  if(nrow({{data}}) == 0) {
    warning("The returned data frame is empty.")
  }
  # make a copy of data with different pointer in memory
  df <- data.frame({{data}})
  # clean names of columns of dataframe
  df <- janitor::clean_names(df)

  # replace "Inf" and na values with NA
  # this is needed when applying models
  df[is.na(df) | df=="Inf"] = NA
  return(df)
}
