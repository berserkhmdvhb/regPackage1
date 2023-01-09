# regPackage1
Author: Hamed Vaheb

# Introduction

This R package is dedicated to a project for the workshop of master of data science at university of Luxembourg.
In this package, functions are defined for various stages of classification of the outcomes of the [Car Insurance Data](https://www.kaggle.com/datasets/sagnik1511/car-insurance-data).
The raw dataset along with the processed train and test datasets (prpared to be fed in models) are incorporated in the package.
A report is provided in the package that elaborated on all the stages from loading the data, preprocessing steps, applying logistic regression and random forest, and then evaluating and plotting the results.
Details of the package's documentation, and the link to report of the classification project is elaborated on [Documentation-and-Report](#Documentation-and-Report).
Moreover, a pipeline including main stages of the classification (refer to [`targets` Pipeline](#targets-Pipeline)), and a shiny interactive app (refer to [`shiny` App](#shiny-App)) visualizing evaluation plots are included in the package.

# Install

To install this package in an R edtior (e.g., Rstudio), install [`devtools`](https://www.r-project.org/nosvn/pandoc/devtools.html) library and then install my package. Please follow the following commands:

```
install.packages("devtools")
library(devtools)
install_github("berserkhmdvhb/regPackage1")
```



# Usage

## `renv` packages
Install the [`renv`](https://rstudio.github.io/renv/articles/renv.html) library, load its and then use the [`renv.lock`](https://github.com/berserkhmdvhb/regPackage1/blob/main/renv.lock) file to install the requied packages. Please follow the following commands in a R editor console:

```
install.packages("renv")
library(renv)
renv::restore()
```

To view the documentation my package, how to use its functions, and to read the report for a machine learning project that I did using this package, refer to [Documentation](#Documentation).

## Unit Tests
TO DO


## `targets` Pipeline

After installing my package (refer to [Install](#Install)), and installing the required packages  from the `renv.lock` file (refer to [`renv`](#renv-packages), clone my package's repository, install and load the `targets` library, and the run `tar_make()` to run the pipeline.


and then use `tar_make()` to create the pipeline.

```
install.packages("targets")
library(targets)
tar_make()
```


## `shiny` App


# Documentation and Report


There are two reports available for this package.

 1. Rmarkdown report for the insurance claims' prediction using functions from the package

[Link of Rmardkown file](https://github.com/berserkhmdvhb/regPackage1/blob/main/inst/report.Rmd)

[Link of HTML rendering of the Rmarkdown file](https://htmlpreview.github.io/?https://github.com/berserkhmdvhb/regPackage1/blob/main/inst/report.html)

2. The pipeline's instructions and detailed report of the libraries used for various stages of this package. Here is the general framework for this report:
 - Writing the functions used for different stages of the pipeline (i.e., preprocessing, prediction, evaluation, plotting)
 - Unit Tests for some of the functions
 - Use [`targets`](https://cran.r-project.org/web/packages/targets/index.html) package to create a pipeline for plotting predictions (or their evaluation).
 - Use [`shiny`](https://shiny.rstudio.com/) to provide an interactive plot of predctions.

The third and fourth tasks of the framework is remained to be done.
