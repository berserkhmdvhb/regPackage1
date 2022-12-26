#' Prepare dataframe to bed fed into models
#' target variable, family of distribution
#' @param data An arbitrary dataframe
#' @export
#' @return Returns cleaned dataframe ready to be fed into models
#' @details
#' This functions allows to clean and prepare dataframe by cleaning column names, automatically detecting the
#' categorical columns and then factorizing them, and replace "na" and "Inf" values with NA



prepare_hmd <- function(data=car_insurance_data){
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
  cat_cols = list()
  for (col in colnames(df)){
    if (class(df[[col]]) == "character"){
      cat_cols <- append(cat_cols, col)
    }
    else if (length(unique(df[[col]])) < 10){
      cat_cols <- append(cat_cols, col)
    }
  }
  df[cat_cols] <- lapply(df[cat_cols], factor)

  return(df)
}

