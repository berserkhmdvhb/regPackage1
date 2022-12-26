#' Prepare dataframe to bed fed into models
#' target variable, family of distribution
#' @param data An arbitrary dataframe
#' @export
#' @return Returns cleaned dataframe ready to be fed into models
#' @details
#' This functions allows to clean and prepare dataframe by cleaning column names, automatically detecting the
#' categorical columns and then factorizing them, and replace "na" and "Inf" values with NA



prepare_hmd <- function(data=regPackage1::car_insurance_data){
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
    else if (length(unique(df[[col]])) < 10){
      num_cols <- append(num_cols, col)
    }
  }
  cat_cols = c(char_cols, num_cols)

  print(paste0("List of categorical columns containing characters: ", char_cols))
  print(paste0("List of categorical columns containing numbers: ", num_cols))
  df[cat_cols] <- lapply(df[cat_cols], factor)
  return(df)
}

