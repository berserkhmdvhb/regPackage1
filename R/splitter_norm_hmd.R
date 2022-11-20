#' Splitting and Normalizind Data
#' @param data An arbitrary dataframe
#' @param features_names Name of features. If not specified, takes all columns
#' except the target
#' @param target The target variable aimed for prediction
#' @param normalize If set to TRUE, then the features are normalized either by
#' minmax or std, which is determined by the parameter "normalized_method"
#' @param normalize_method if set to "std", then standard scaler is used for
#' normalization of features, and if set to "minmax", then minmax scaler is used. Default is "std".
#' @export
#' @return Returns a list of containing train and test data (both normalized if user requests)
#' @details
#' This functions allows the user to split data into train and test, and then
#' if the user sets normalize to TRUE, it normalizes data based on the moethod
#' user prefers
splitter_norm_hmd <- function(data=insurance_data,
                    features_names=names({{data}})[names({{data}}) != {{target}}],
                    target="charges",
                    normalize=FALSE,
                    normalize_method="std"){
  # ensure dataframe is not empty
  feature_names_main <- feature_names
  if(nrow({{data}}) == 0) {
    warning("The returned data frame is empty.")
  }
  # make a copy of data with different pointer in memory
  df <- data.frame({{data}})
  # extract feature names either from input or dataframe
  if (!(typeof(features_names) %in% c("list","character")))
  {
    warning("Please input cat_cols as either character type,
            e.g. c(col1,col2,...) or list type list(col1,col2,...)")
    feature_names_main <- names(df)[names(df) != {{target}}]
  }
  else{
    if (length(feature_names) == 0)
    {
      warning("List is empty. All columns except target will be selected")
      feature_names_main <- names(df)[names(df) != {{target}}]
    }
    else
    {
      if (!(all(feature_names_main %in% names(df))))
      {
        warning("A feature from your input list cat_cols is not among
                dataframe columns. Will select all columns instead")
        feature_names_main <- names(df)[names(df) != {{target}}]
      }
    }
  }


  return(df)
}

