% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/preprocess_hmd.R
\name{preprocess_hmd}
\alias{preprocess_hmd}
\title{Wrapper of all preprocessing functions and tasks (explained in the report)}
\usage{
preprocess_hmd(data = regPackage1::car_insurance_data)
}
\arguments{
\item{data}{An arbitrary dataframe}
}
\value{
Returns processed dataframes inside a hash function containing both
train and test datasets
}
\description{
Wrapper of all preprocessing functions and tasks (explained in the report)
}
\details{
This function is a wrapper around all functions defined in the preprocessing
stages, which are elaborated on in the report. In summary, the stages are
summarized in the following:
cleaning columns' names, treating categorical variables by converting them to
factors, imputing missing values with median of their corresponding columns,
applyingone-hot-encoding, splitting to train and test, distincting integer and double
column types, normalizing double type columns, applying racog (Rapidly converging Gibbs algorithm)
for oversampling the minority class so as to mitigate classes' imbalance,
removing id column so as to prevent data leakage. Finally store train and test data in a hash
}
