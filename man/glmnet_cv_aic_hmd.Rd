% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/glmnet_cv_aic_hmd.R
\name{glmnet_cv_aic_hmd}
\alias{glmnet_cv_aic_hmd}
\title{Predict data with results from GLMNET model}
\usage{
glmnet_cv_aic_hmd(fit, lchoice = "min")
}
\arguments{
\item{fit}{Fit object from a cv.glmnet model}

\item{lchoice}{How to choose lambda model. Choices are "min", "1se".}
}
\value{
AIC and BIC from a glm fit object
}
\description{
Predict data with results from GLMNET model
}
\details{
This function allows the user to extract AIC and BIC from a cv.glmnet fit object.
}
