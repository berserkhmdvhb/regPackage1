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

get_data_actual <- function(){
  regPackage1::insurance_test$outcome
}

get_pred_proba <- function(h)
{
  h$predict_proba
}


roc_obj_cal <- function(actual, pred_proba){
  pROC::roc(actual ~ pred_proba, print.auc=FALSE)
}


plot_roc_curve <- function(roc_obj){
  pROC::ggroc(roc_obj)
}

