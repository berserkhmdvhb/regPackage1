#' Fitting a generalized linear model by specifying feature names (response variables),
#' target variable, family of distribution
#' @param insurance_data An arbitrary dataframe
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
regressor <- function(insurance_data,
                      features_names,
                      target,
                      normalize=FALSE,
                      normalize_method="std",
                      family="gaussian"){
  # ensure dataframe is not empy
  if(nrow(insurance_data) == 0) {
    warning("The returned data frame is empty.")
  }
  # make a copy of data with different pointer in memory
  df <- data.frame({{insurance_data}})
  # clean names of columns of dataframe
  df <- janitor::clean_names(df)
  # extract feature names
  features_names <- names(df)[names(df) != {{target}}]
  # extract features subset of dadtaframe
  features <- df[,names(df) != {{target}}]

  # normalize data based on user preference
  if (normalize == TRUE){
    numeric_features <- dplyr::select_if(features, is.numeric)
    # standard normalizer
    if (tolower(normalize_method) == tolower("std")){
    df <- df |> dplyr::mutate_at(names(numeric_features), ~(scale(.) %>% as.vector))
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
             family={{family}})
  return(fit)
}




plot_reg <- function(fit){
  #fit <- regressor({{data}},{{target}})
  return(car::avPlots({{fit}}))
}


#dataset:
# https://www.kaggle.com/datasets/mirichoi0218/insurance?resource=download
##reading it:
#readr::read_csv("https://raw.githubusercontent.com/berserkhmdvhb/regPackage1/main/data/insurance.csv",show_col_types=FALSE)
# readr::read_csv("/home/hamed/Documents/R/regPackage1/data/insurance.csv",show_col_types=FALSE)
# execute example
# fit <- regressor(data=datasets::ToothGrowth, target="len")
# data <- plot_reg(fit)

# clear all variables
# rm(list=ls())
