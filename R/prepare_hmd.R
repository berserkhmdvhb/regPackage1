

prepare_hmd <- function(data=insurance_data,
                    features_names,
                    target,
                    cat_cols,
                    normalize=FALSE,
                    normalize_method="std",
                    family="gaussian"){
  # ensure dataframe is not empy
  if(nrow({{data}}) == 0) {
    warning("The returned data frame is empty.")
  }
  # make a copy of data with different pointer in memory
  df <- data.frame({{data}})
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

