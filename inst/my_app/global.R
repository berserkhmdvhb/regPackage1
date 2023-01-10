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
library(cachem)


source("../../R/glmnet_fit_hmd.R")
source("../../R/glmnet_predict_hmd.R")
source("../../R/rf_fit_hmd.R")
source("../../R/rf_predict_hmd.R")
source("../../R/functions.R")

shinyOptions(cache = cachem::cache_disk("./app-cache",
                                        max_age = Inf,
                                        max_size = 2048 * 2048^2))