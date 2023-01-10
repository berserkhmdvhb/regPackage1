server <- function(session, input, output) {
  preds <- reactive({
    if (input$model_selected == "Logistic Regression"){
      actual <- insurance_test$outcome
      model_glm <- glmnet_fit_hmd(insurance_train,
                                  target = "outcome",
                                  family = "binomial")
      glmnet_predict_hmd(model_glm,
                         data = insurance_test,
                         target = "outcome",
                         type = "response")
    }
    else if (input$model_selected == "Random Forest"){
      model_random_forest <- rf_fit_hmd(insurance_train,
                                        ntree = 300,
                                        mtry = 10,
                                        proximity = TRUE,
                                        importance = FALSE)

      rf_predict_hmd(data=insurance_test,
                     fit=model_random_forest)
    }
  }) |> bindCache(input$model_selected) |> bindEvent(input$run_plot)


  plot_eval <- reactive({
    actual <- insurance_test$outcome
    if (input$evaluation_selected == "ROC Curve"){
      pred_proba <- get_pred_proba(preds())
      roc_obj <- roc_obj_cal(actual, pred_proba)
      plot_roc_curve(roc_obj)
    }
    else if (input$evaluation_selected == "Confusion Matrix"){
      eval_glm <- eval_hmd(insurance_test$outcome,
                           preds()$predictions)
      eval_glm
      eval_glm$confusion_matrix_plot
    }

  })  |> bindCache(input$evaluation_selected) |> bindEvent(input$run_plot)


  output$evaluation_plots <- renderPlot({
    plot_eval()
  })





}
