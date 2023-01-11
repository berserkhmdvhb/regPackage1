test_that("check value ranges", {
  actual <- regPackage1::insurance_test$outcome
  model_glm <- regPackage1::glmnet_fit_hmd(regPackage1::insurance_train,
                                           target = "outcome",
                                           family = "binomial")
  pred_obj <- regPackage1::glmnet_predict_hmd(model_glm,
                                              data = regPackage1::insurance_test,
                                              target = "outcome",
                                              type = "binomial")
  predicted <- pred_obj$predictions
  h <- regPackage1::eval_hmd(actual, predicted)
  expect_true(h$accuracy |> dplyr::between(0,1))
  expect_true(h$precision |> dplyr::between(0,1))
  expect_true(h$recall |> dplyr::between(0,1))
  expect_true(h$fbeta_score |> dplyr::between(0,1))
  expect_true(h$f1_score |> dplyr::between(0,1))
})

test_that("check output class", {
  actual <- regPackage1::insurance_test$outcome
  model_glm <- regPackage1::glmnet_fit_hmd(regPackage1::insurance_train,
                                           target = "outcome",
                                           family = "binomial")
  pred_obj <- regPackage1::glmnet_predict_hmd(model_glm,
                                               data = regPackage1::insurance_test,
                                               target = "outcome",
                                               type = "binomial")
  predicted <- pred_obj$predictions
  h <- regPackage1::eval_hmd(actual, predicted)
  expect_true(class(h) == "hash")
})



