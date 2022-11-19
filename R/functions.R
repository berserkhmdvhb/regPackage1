regressor <- function(data=datasets::ToothGrowth, target){
  features <- data[,names(data) != target]
  fit <- lm(data.target ~ features)
}
