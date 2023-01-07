actual <- regPackage1::insurance_test$outcome
X_train <- regPackage1::insurance_train[, colnames(regPackage1::insurance_train)[colnames(regPackage1::insurance_train) != "outcome"]]
X_test <- regPackage1::insurance_test[, colnames(regPackage1::insurance_test)[colnames(regPackage1::insurance_test) != "outcome"]]
y_train <- as.factor(regPackage1::insurance_train[["outcome"]])
y_test <- as.factor(regPackage1::insurance_test[["outcome"]])
rf <- randomForest::randomForest(x = X_train,
                                 y = y_train,
                                 ntree = 300,
                                 mtry = 10,
                                 proximity = TRUE,
                                 importance = TRUE)
predict_rf <- stats::predict(rf, X_test)
pred_proba_rf <- stats::predict(rf, X_test, type="prob")
pred_proba_rf_list <- pred_proba_rf |> as.list() |> tail(nrow(regPackage1::insurance_test)) |> unlist()
pROC::roc(actual ~ pred_proba_rf_list, plot = TRUE, print.auc = TRUE)
