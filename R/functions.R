get_data_raw <- function(){
  regPackage1::car_insurance_data
}

get_data_train <- function(){
  regPackage1::insurance_train
}

get_data_test <- function(){
  regPackage1::insurance_test
}

get_data_actual <- function(){
  regPackage1::insurance_test$outcome
}

plot_roc_curve <- function(actual, pred_proba){
  pROC::roc(actual, pred_proba, plot=TRUE, print.auc = TRUE)
}
