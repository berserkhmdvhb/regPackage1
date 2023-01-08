server <- function(session, input, output) {

  roc_obj <- reactive(
    actual <- insurance_test$outcome
    if (input$model_selected == "Logistic Regression"){
      model_glm <- glmnet_fit_hmd(insurance_train,
                                  target = "outcome",
                                  family = "binomial")
      predictions_glm <- glmnet_predict_hmd(model_glm,
                                            data = insurance_test,
                                            target = "outcome",
                                            type = "response")
      pred_proba_glmnet <- predictions_glm$predict_proba
      roc_obj_glmnet <- pROC::roc(actual ~ pred_proba_glmnet,
                                  print.auc=FALSE)
      roc_obj_glmnet
    }
    else if (input$model_selected == "Random Forest"){
      model_random_forest <- rf_fit_hmd(insurance_train,
                                        ntree = 300,
                                        mtry = 10,
                                        proximity = TRUE,
                                        importance = FALSE)
      predictions_rf <- rf_predict_hmd(data=insurance_test,
                                       fit=model_random_forest)
      pred_proba_rf <- predictions_rf
      roc_obj_glmnet <- pROC::roc(actual ~ pred_proba_rf,
                                  print.auc=FALSE)
    }
  )

  output$roc_curve <- renderPlot({
    pROC::ggroc(roc_obj())
  })
}
