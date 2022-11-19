#' Fitting a generalized linear model by specifying feature names (response variables),
#' target variable, family of distribution
#' @param data An arbitrary dataframe
#' @param feature_names Name of features. If not specified, takes all columns
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
#' This functions allows the user to perform regression of a given
#' dataframe, using
regressor <- function(insurance_data,
                      features_names,
                      target,
                      normalize=FALSE,
                      normalize_method="std",
                      family="gaussian"){
  # ensure dataframe is not empy
  if(nrow(result) == 0) {
    warning("The returned data frame is empty.")
  }

  df <- data.table::copy({{insurance_data}})
  # clean names of columns of dataframe
  df <- janitor::clean_names(df)
  # extract feature names
  features_names <- names(df)[names(df) != {{target}}]
  # extract features subset of dadtaframe
  features <- data[,names(df) != {{target}}]

  # normalize data based on user preference
  if (normalize == TRUE){
    numeric_features <- select_if(features, is.numeric)
    # standard normalizer
    if (tolower(normalize_method) == tolower("std")){
    df <- df |> mutate_at(names(numeric_features), ~(scale(.) %>% as.vector))
    }
    # minmax normalizer
    else if (tolower(normalize_method) == tolower("minmax")){
      process <- preProcess(numeric_features, method=c("range"))
      scaled_df <- predict(process, numeric_features)
      for (col in names(numeric_features)){
        df[col] <- scaled_df[col]
      }
    }
  }

  glm_format <- as.formula(paste({{target}}, "~",
                   paste({{features_names}}, collapse = "+"),
                   sep = ""
                  ))
  fit <- glm(glm_format,
             data=df,
             family={{family}})
  return(fit)
}

plot_reg <- function(fit){
  #fit <- regressor({{data}},{{target}})
  return(avPlots({{fit}}))
}


#dataset:
# https://www.kaggle.com/datasets/mirichoi0218/insurance?resource=download
# execute example
# fit <- regressor(data=datasets::ToothGrowth, target="len")
# data <- plot_reg(fit)

# clear all variables
# rm(list=ls())
