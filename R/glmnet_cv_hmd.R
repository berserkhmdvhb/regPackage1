#' CV GLMNET model
#' @param data An arbitrary dataframe
#' @param features_names Name of features. If not specified, takes all columns
#' except the target
#' @param target The target variable aimed for prediction
#' @param family specify family of distribution.
#' @export
#' @return Returns fit object of glmnet function
#' @details
#' This functions allows the user to perform cross-validated eslastic net (which is a generalized
#' linear model) on a given
#' dataframe by specifying feature names (response variables),
#' target variable, family of distribution, and the dataset (in my case, Medical Cost Personal Datasets)

glmnet_cv_hmd <- function(data=insurance_data,
                       features_names=names({{data}})[names({{data}}) != {{target}}],
                       target="charges",
                       family="gaussian"){
  # ensure dataframe is not empty
  features_names_main <- {{features_names}}
  if(nrow({{data}}) == 0) {
    warning("The returned data frame is empty.")
  }
  # make a copy of data with different pointer in memory
  df <- data.frame({{data}})
  df <- prepare_hmd(df)
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

  features <- data.matrix(df[features_names_main])
  target_col <- as.numeric(unlist(df[{{target}}]))
  fit <- glmnet::cv.glmnet(features,
                        target_col,
                        family={{family}}
  )
  return(fit)
}
