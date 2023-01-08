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
        pred_glm <- glmnet_predict_hmd(model_glm,
                                       data = insurance_test,
                                       target = "outcome",
                                       type = "response")
        if (evaluation_selected_reac() == "Confusion Matrix")
        {
          eval_glm <- eval_hmd(insurance_test$outcome,
                               pred_glm$predictions)
          eval_glm$confusion_matrix_plot
        }


        })

      }
    else if (model_selected_reac() == "Random Forest"){
      actual <- insurance_test$outcome
      model_rf <- rf_fit_hmd(insurance_train,
                             ntree = 300,
                             mtry = 10,
                             proximity = TRUE,
                             importance = FALSE)
      pred_rf <- rf_predict_hmd(data=insurance_test,
                                fit=model_rf)
      eval_rf <- eval_hmd(insurance_test$outcome,
                          pred_rf$predictions)
      eval_rf$confusion_matrix_plot
    }

  })
}
