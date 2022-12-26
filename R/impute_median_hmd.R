#' Imputes missing values with median
#' @param data An arbitrary dataframe
#' @param cols_list List of numerical columns intended to be imputed
#' @export
#' @return Returns dataframe with its categorical columns factorised
#' @details
#' This function receives a dataframe and a list of columns to be imputed with median.
#' Then it replaces NA values of each column from the given list with median of that column.


impute_median_hmd <- function(data=regPackage1::car_insurance_data,
                              cols_list =list()){
  # ensure dataframe is not empy
  if(nrow({{data}}) == 0) {
    warning("The returned data frame is empty.")
  }


  #ensure user inputs a proper object for cat_cols
  if (!(typeof({{cols_list}}) %in% c("list","character")))
  {
    warning("Please input cat_cols as either character type, e.g. c(col1,col2,...) or list type list(col1,col2,...)")
  }
  else
  {
    #ensure use doesn't input an empty list for cat_cols
    if (length({{cols_list}}) == 0)
    {
      warning("No column is selected. No columns will be modified.")
      return(df)
    }
    else
    {
      df <- data.frame({{data}})
      if (!(all({{cols_list}} %in% names(df))))
      {
        warning("A categorical column from your input list cat_cols is not among dataframe columns.")
      }
      else{
        for (col in {{cols_list}}){
          if (!(is.numeric(df[[col]])))
          {
            warning("A categorical column from your input list cat_cols is not among dataframe columns.")
            break
          }
          print(col)
          df[[col]][is.na(df[[col]])] <- stats::median(df[[col]], na.rm = T)

        }
      }

    }
  }
  return(df)
}

