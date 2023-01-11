#' @title Processed training dataset from car insurance data
#' @description
#' This dataset is the training dataset obtained by processing the car insurance data.
#' The processing steps are described in the report as well as documentation of function preprocess_hmd.
#' @docType data
#' @usage data(insurance_train)
#' @format A data frame with 10000 rows and 19 columns:
#' \describe{
#'   \item{age.16.25}{Age of the beneficiary}
#'   \item{age.26.39}{Age of the beneficiary}
#'   \item{age.40.64}{Age of the beneficiary}
#'   \item{age.65.}{Age of the beneficiary}
#'   \item{gender.female}{Gender of the beneficiary}
#'   \item{gender.male}{Gender of the beneficiary}
#'   \item{race.majority}{Rage of beneficiary}
#'   \item{race.minority}{Rage of beneficiary}
#'   \item{driving_experience.0.9y}{Duration of the beneficiary's experience in driving}
#'   \item{driving_experience.10.19y}{Duration of the beneficiary's experience in driving}
#'   \item{driving_experience.20.29y}{Duration of the beneficiary's experience in driving}
#'   \item{driving_experience.30y.}{Duration of the beneficiary's experience in driving}
#'   \item{education.high.school}{Education level of the beneficiary}
#'   \item{education.none}{Education level of the beneficiary}
#'   \item{education.university}{Education level of the beneficiary}
#'   \item{income.middle.class}{Income cass of the beneficiary}
#'   \item{income.poverty}{Income cass of the beneficiary}
#'   \item{income.upper.class}{Income cass of the beneficiary}
#'   \item{income.working.class}{Income cass of the beneficiary}
#'   \item{credit_score}{Credit score of beneficiary}
#'   \item{vehicle_ownership}{Whether the beneficiary owns the vehicle or not.}
#'   \item{vehicle_year.after.2015}{The year vehicle was built}
#'   \item{vehicle_year.before.2015}{The year vehicle was built}
#'   \item{married}{Whether the beneficiary is married or not}
#'   \item{children}{Whether the beneficiary has children or not}
#'   \item{postal_code}{Postal code of the beneficiary}
#'   \item{annual_mileage}{Annual mileage of the vehicle of the beneficiary.}
#'   \item{vehicle_type.sedan}{The type of the vehicle of the beneficiary.}
#'   \item{vehicle_type.sports.car}{The type of the vehicle of the beneficiary}
#'   \item{speeding_violations}{Number of speeing violations recorded for beneficiary}
#'   \item{duis}{Number of times beneficiary did driving under the influence (DUI)}
#'   \item{past_accidents}{Number of beneficiary's past driving accidents}
#'   \item{outcome}{Indicates 1 if a customer has claimed his/her loan else 0}
#' }
"insurance_train"
