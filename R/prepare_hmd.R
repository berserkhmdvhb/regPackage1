#' Prepare dataframe to bed fed into models
#' target variable, family of distribution
#' @param data An arbitrary dataframe
#' @export
#' @return Returns cleaned dataframe ready to be fed into models
#' @details
#' This functions allows to clean and prepare dataframe by factorizing the
#' specified cateogrical columns, cleaning column names, replace "na" and "Inf"
#' values with NA



prepare_hmd <- function(data=insurance_data,
                    cat_cols=list()
                    ){
  # ensure dataframe is not empy
  if(nrow({{data}}) == 0) {
    warning("The returned data frame is empty.")
  }
  # make a copy of data with different pointer in memory
  df <- data.frame({{data}})
  # clean names of columns of dataframe
  df <- janitor::clean_names(df)
  cat_cols <- janitor::make_clean_names(cat_cols)
  # replace "Inf" and na values with NA
  # this is needed when appplying
  df[is.na(df) | df=="Inf"] = NA


  if (!(typeof(cat_cols) %in% c("list","character")))
  {
    warning("Please input cat_cols as either character type, e.g. c(col1,col2,...) or list type list(col1,col2,...)")
  }
  else
  {
    if (length(cat_cols) == 0)
    {
      return(df)
    }
    else
    {

      for (col in cat_cols)
      {
          if (!(col %in% names(df)))
          {
            warning("A categorical column from your input list cat_cols is not among dataframe's columns.")
            break
          }
          df[col] = as.factor(df[col])
      }
    }
  }
  return(df)
}

