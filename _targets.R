library(janitor)
library(stats)
library(hash)
library(caret)
library(glmnet)
library(car)
library(Metrics)
library(targets)
library(regPackage1)
library(dplyr)
library(ggplot2)
library(pROC)
library(randomForest)



source("./R/functions.R")
source("./R/glmnet_fit_hmd.R")
source("./R/glmnet_predict_hmd.R")
source("./R/rf_fit_hmd.R")
source("./R/rf_predict_hmd.R")
list(
  tar_target(
    car_insurance_data,
    get_data_raw()
  ),
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
    predict_obj,
    glmnet_predict_hmd(model_glm,
                    data = insurance_test,
                    target = "outcome",
                    type = "response")
  ),
  tar_target(
    pred_proba,
    get_pred_proba(predict_obj)
  ),
  tar_target(roc_obj,
             roc_obj_cal(actual, pred_proba)
  ),
  tar_target(plot,
             plot_roc_curve(roc_obj)
  ),
  tar_target(model_random_forest,
             rf_fit_hmd()
  ),
)
