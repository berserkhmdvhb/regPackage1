#' Fitting a generalized linear model by specifying feature names (response variables),
#' target variable, family of distribution
#' @param data An arbitrary dataframe
#' @param cat_cols List of cateogrical columns need to be factored and result in levels
#' @export
#' @return Returns fit object of lm function
#' @details
#' This functions allows the user to perform generalized linear model on a given
#' dataframe, in my case, Medical Cost Personal Datasets



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

