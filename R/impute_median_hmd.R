#' Imputes missing values with median
#' @param data An arbitrary dataframe
#' @export
#' @return Returns dataframe with its categorical columns factorised
#' @details
#' This function receives a dataframe, finds columns containing NA values, and then
#' replaces NA values of each founded column with median of that column.


impute_median_hmd <- function(data=regPackage1::car_insurance_data){
  # ensure dataframe is not empy
  if(nrow({{data}}) == 0) {
    warning("The inputted data frame is empty.")
  }
  cols_list = which(colSums(is.na(df))>0)
  if (length({{cols_list}}) == 0)
  {
    warning("No column has NA value. No columns will be modified.")
    return(df)
  }
  for (col in {{cols_list}}){
    df[, col][is.na(df[, col])] <- stats::median(df[, col], na.rm = T)
  }
  return(df)
}

