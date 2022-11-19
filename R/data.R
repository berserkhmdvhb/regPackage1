#' Medical Cost Personal Datasets
#'
#' Individual medical costs billed by health insurance along with properties of individuals
#' @docType data
#' @usage data(insurance_data)
#' @format ## `who`
#' A data frame with 1,338 rows and 7 columns:
#' \describe{
#'   \item{age}{Age of primary beneficiary}
#'   \item{sex}{Insurance contractor gender, female, male}
#'   \item{bmi}{Body mass index, providing an understanding of body, weights that
#'   are relatively high or low relative to height, objective index of body weight $(kg / m ^ 2)$ using the ratio of height to weight, ideally 18.5 to 24.9}
#'   \item{children}{Number of children covered by health insurance / Number of dependents}
#'   \item{smoker}{Individual is smoker or not}
#'   \item{region}{The beneficiary's residential area in the US, northeast, southeast, southwest, northwest.}
#'   \item{charges}{Individual medical costs billed by health insurance}
#'   ...
#' }
#' @source <https://www.kaggle.com/datasets/mirichoi0218/insurance>
"insurance_data"

#data("insurance_data", package="regPackage1")
# always run the following when you change the documentation
# devtools::documnet()
