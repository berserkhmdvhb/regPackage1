server <- function(session, input, output) {

  roc <- reactive(
      model <- input$model_selected
      actual <- insurance_test$outcome
      if (model == "Logistic Regression"){
        model_glm <- glmnet_fit_hmd(insurance_train,
                       target = "outcome",
                       family = "binomial")
        predictions_glm <- glmnet_predict_hmd(model_glm,
                           data = insurance_test,
                           target = "outcome",
                           type = "response")
        pred_proba_glmnet <- predictions_glm$predict_proba
        roc_obj_glmnet <- pROC::roc(actual ~ pred_proba, print.auc=FALSE)
      }

  )

  output$roc_curve <- renderPlot({
    pROC::ggroc(roc_obj)(roc())
  })
}
