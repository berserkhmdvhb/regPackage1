#' CV GLMNET model
#' @param data An arbitrary dataframe
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

glmnet_cv_fit_hmd <- function(data=regPackage1::insurance_train,
                          target="outcome",
                          family="binomial"){
  # ensure dataframe is not empty
  features_names <- names({{data}})[names({{data}}) != {{target}}]
  if(nrow({{data}}) == 0) {
    warning("The returned data frame is empty.")
  }
  # make a copy of data with different pointer in memory
  df <- data.frame({{data}})
  # extract feature names either from input or dataframe

  features <- data.matrix(df[features_names])
  target_col <- as.numeric(unlist(df[{{target}}]))
  fit <- glmnet::cv.glmnet(features,
                           target_col,
                           family={{family}}
                           )
  return(fit)
}
