#' Treat categorical columns
#' @param data An arbitrary dataframe
#' @export
#' @return Returns dataframe with its categorical columns factorised
#' @details
#' This functions treats the categorical columns by first detecting them and then
#' convert those including characters to factors. To detect categorical columns, the function selects a column
#' as categorical if either its class is "character", or if number of unique values
#' the column has is less than 5.



categoricals_hmd <- function(data=regPackage1::car_insurance_data){
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
  char_cols = list()
  num_cols = list()
  cat_cols = list()
  for (col in colnames(df)){
    if (is.character(df[[col]])){
      char_cols <- append(char_cols, col)
    }
    else if (length(unique(df[[col]])) < 5){
      num_cols <- append(num_cols, col)
    }
  }
  cat_cols = append(char_cols, num_cols)
  char_cols <- unlist(char_cols, use.names=FALSE)
  num_cols <- unlist(num_cols, use.names=FALSE)
  cat_cols <- unlist(cat_cols, use.names=FALSE)
  df[char_cols] <- lapply(df[char_cols], factor)
  return(df)
}
