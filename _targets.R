library(janitor)
library(stats)
library(hash)
library(caret)
library(glmnet)
library(car)
library(Metrics)
library(targets)
library(dplyr)
library(ggplot2)
library(pROC)
library(randomForest)
library(regPackage1)



source("./R/functions.R")
source("./R/glmnet_fit_hmd.R")
source("./R/glmnet_predict_hmd.R")
source("./R/rf_fit_hmd.R")
source("./R/rf_predict_hmd.R")
list(
  tar_target(
    insurance_train,
    get_data_train()
  ),
  tar_target(
    insurance_test,
    get_data_test()
  ),
  tar_target(
    actual,
    get_data_actual()
  ),
  tar_target(
    model_glm,
    glmnet_fit_hmd(insurance_train,
                   target = "outcome",
                   family = "binomial")
  ),
  tar_target(
    predictions_glm,
    glmnet_predict_hmd(model_glm,
                    data = insurance_test,
                    target = "outcome",
                    type = "response")
  ),
  tar_target(
    pred_proba_glmnet,
    get_pred_proba(predictions_glm)
  ),
  tar_target(roc_obj_glmnet,
             roc_obj_cal(actual, pred_proba_glmnet)
  ),
  tar_target(plot_glm,
             plot_roc_curve(roc_obj_glmnet)
  ),
  tar_target(model_random_forest,
             rf_fit_hmd(insurance_train,
                        ntree = 300,
                        mtry = 10,
                        proximity = TRUE,
                        importance = FALSE)
  ),
  tar_target(predictions_rf, rf_predict_hmd(data=insurance_test,
                                            fit=model_random_forest)
  ),
  tar_target(
    pred_proba_rf,
    get_pred_proba(predictions_rf)
  ),
  tar_target(roc_obj_rf,
             roc_obj_cal(actual, pred_proba_rf)
  ),
  tar_target(plot_rf,
             plot_roc_curve(roc_obj_rf))
)
