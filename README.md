# regPackage1
Author: Hamed Vaheb

# Introduction

This R package is dedicated to the workshop of master of data science at university of Luxembourg.
In this package, functions are defined for various stages of a pipeline for prediction of the [Car Insurance Data](https://www.kaggle.com/datasets/sagnik1511/car-insurance-data). The stages includepreprocessing, prediction, evaluation, and plotting.

# Install 

To install this package in an R edtior (e.g., Rstudio), install [`devtools`](https://www.r-project.org/nosvn/pandoc/devtools.html) run the following commands:

```
library(devtools)
install_github("berserkhmdvhb/regPackage1")
```

# Usage
To use this package, first install the [`renv`](https://rstudio.github.io/renv/articles/renv.html) the required packages from [`renv.lock`](https://github.com/berserkhmdvhb/regPackage1/blob/main/renv.lock) file using the following command in Rstudio console:

```
renv::restore()
```

# Report
There are two reports available for this package.

 1. Rmarkdown report for the insurance claims' prediction using functions from the package
[Link of Rmardkown file: ](https://github.com/berserkhmdvhb/regPackage1/blob/main/inst/report.Rmd)
[Link of HTML rendering of the Rmarkdown file: ][package's report](https://htmlpreview.github.io/?https://github.com/berserkhmdvhb/regPackage1/blob/main/inst/report.html)

2. The pipeline's instructions and detailed report of the libraries used for various stages of this package. Here is the general framework for this report:
 - Writing the functions used for different stages of the pipeline (i.e., preprocessing, prediction, evaluation, plotting)
 - Unit Tests for some of the functions
 - Use [`targets`](https://cran.r-project.org/web/packages/targets/index.html) package to create a pipeline for plotting predictions.
 - Use [`shiny`]() to provide an interactive plot of predctions.
