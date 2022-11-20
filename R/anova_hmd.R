
#' Fitting a generalized linear model by specifying feature names (response variables),
#' target variable, family of distribution
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
#' dataframe, in my case, Medical Cost Personal Datasets

anova_hmd <- function(fit){
  return(car::Anova({{fit}}, test.statistic = "LR", type = 3))
}
