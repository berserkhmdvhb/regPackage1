#' GLM Model
#' @param data An arbitrary dataframe
#' @param features_names Name of features. If not specified, takes all columns
#' except the target
#' @param target The target variable aimed for prediction
#' @param normalize If set to TRUE, then the features are normalized either by
#' minmax or std, which is determined by the parameter "normalized_method"
#' @param normalize_method if set to "std", then standard scaler is used for
#' normalization of features, and if set to "minmax", then minmax scaler is used.
#' Default is "std".
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
  # ensure dataframe is not empty
  features_names_main <- {{features_names}}
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
    features_names_main <- names(df)[names(df) != {{target}}]
  }
  else{
  if (length(features_names) == 0)
  {
    warning("List is empty. All columns except target will be selected")
    features_names_main <- names(df)[names(df) != {{target}}]
  }
    else
    {
      if (!(all(features_names_main %in% names(df))))
      {
        warning("A feature from your input list cat_cols is not among
                dataframe columns. All columns will be selected")
        features_names_main <- names(df)[names(df) != {{target}}]
      }
    }
  }


  glm_format <- stats::as.formula(paste({{target}}, "~",
                   paste(features_names_main, collapse = "+"),
                   sep = ""
                  ))
  fit <- stats::glm(glm_format,
             data=df,
             family={{family}}
             )
  return(fit)
}

