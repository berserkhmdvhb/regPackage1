actual <- regPackage1::insurance_test$outcome
fit <- regPackage1::glmnet_fit_hmd(regPackage1::insurance_train, target="outcome", family="binomial")
h <- regPackage1::glmnet_predict_hmd(fit,
                        data = regPackage1::insurance_test,
                        target = "outcome",
                        type = "response")
pred_glm <- h$predictions
pred_proba_glm <- h$predict_proba
pROC::roc(actual ~ pred_proba_glm, plot = TRUE, print.auc = TRUE)
