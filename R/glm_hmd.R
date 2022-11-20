#' GLM Model
#' @param data An arbitrary dataframe
#' @param features_names Name of features. If not specified, takes all columns
#' except the target
#' @param target The target variable aimed for prediction
#' @param normalize If set to TRUE, then the features are normalized either by
#' minmax or std, which is determined by the parameter "normalized_method"
#' @param normalize_method if set to "std", then standard scaler is used for
#' normalization of features, and if set to "minmax", then minmax scaler is used. Default is "std".
#' @param family specify family of distribution.
#' @export
#' @return Returns fit object of lm function
#' @details
#' This functions allows the user to perform generalized linear model on a given
#' dataframe by specifying feature names (response variables),
#' target variable, family of distribution, and the dataset (in my case, Medical Cost Personal Datasets)

glm_hmd <- function(data=insurance_data,
                      features_names=names({{data}})[names({{data}}) != {{target}}],
                      target="charges",
                      normalize=FALSE,
                      normalize_method="std",
                      family="gaussian"){
  # ensure dataframe is not empy
  if(nrow({{data}}) == 0) {
    warning("The returned data frame is empty.")
  }
  # make a copy of data with different pointer in memory
  df <- data.frame({{data}})
  # extract feature names either from input or dataframe
  if (!(typeof(features_names) %in% c("list","character")))
  {
    warning("Please input cat_cols as either character type, e.g. c(col1,col2,...) or list type list(col1,col2,...)")
    features_names <- names(df)[names(df) != {{target}}]
  }
  else{
  if (length(features_names) == 0)
  {
    features_names <- names(df)[names(df) != {{target}}]
  }
    else
    {
      features_names <- janitor::make_clean_names(features_names)
      for (col in features_names)
      {
        if (!(col %in% names(df)))
        {
          warning("A categorical column from your ipnut list cat_col is not among dataframe's columns.")
          break
        }
      }
    }
  }

  # normalize data based on user preference
  if (normalize == TRUE){

    # extract features subset of dadtaframe
    features <- df[,names(df) != {{target}}]
    numeric_features <- dplyr::select_if(features, is.numeric)
    # standard normalizer
    if (tolower(normalize_method) == tolower("std")){
    df <- df |> dplyr::mutate_at(names(numeric_features), ~(scale(.) |> as.vector))
    }
    # minmax normalizer
    else if (tolower(normalize_method) == tolower("minmax")){
      process <- caret::preProcess(numeric_features, method=c("range"))
      scaled_df <- stats::predict(process, numeric_features)
      for (col in names(numeric_features)){
        df[col] <- scaled_df[col]
      }
    }
  }


  glm_format <- stats::as.formula(paste({{target}}, "~",
                   paste({{features_names}}, collapse = "+"),
                   sep = ""
                  ))
  fit <- stats::glm(glm_format,
             data=df,
             family={{family}}
             )
  return(fit)
}

