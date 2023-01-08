server <- function(session, input, output) {


  model_selected_reac <- reactive(input$model_selected)
  evaluation_selected_reac <- reactive(input$evaluation_selected)



  observe({
    if (model_selected_reac() == "Logistic Regression"){

        output$evaluation_plots <- renderPlot({
        actual <- insurance_test$outcome
        model_glm <- glmnet_fit_hmd(insurance_train,
                                    target = "outcome",
                                    family = "binomial")
        predictions_glm <- glmnet_predict_hmd(model_glm,
                                       data = insurance_test,
                                       target = "outcome",
                                       type = "response")
        if (evaluation_selected_reac() == "Confusion Matrix")
        {
          eval_glm <- eval_hmd(insurance_test$outcome,
                               predictions_glm$predictions)
          eval_glm$confusion_matrix_plot
        }
        else if (evaluation_selected_reac() == "ROC Curve"){
          pred_proba_glmnet <- get_pred_proba(predictions_glm)
          roc_obj_glmnet <- roc_obj_cal(actual, pred_proba_glmnet)
          plot_roc_curve(roc_obj_glmnet)
        }


        })

      }
    else if (model_selected_reac() == "Random Forest"){

      output$evaluation_plots <- renderPlot({
        model_random_forest <- rf_fit_hmd(insurance_train,
                                          ntree = 300,
                                          mtry = 10,
                                          proximity = TRUE,
                                          importance = FALSE)

        predictions_rf <- rf_predict_hmd(data=insurance_test,
                                         fit=model_random_forest)
        if (evaluation_selected_reac() == "Confusion Matrix")
        {
          eval_rf <- eval_hmd(insurance_test$outcome,
                               predictions_rf$predictions)
          eval_rf$confusion_matrix_plot
        }
        else if (evaluation_selected_reac() == "ROC Curve"){
          pred_proba_rf <- get_pred_proba(predictions_rf)
          roc_obj_rf <- roc_obj_cal(actual, pred_proba_rf)
          plot_roc_curve(roc_obj_rf)
        }


      })

    }



  })
}
