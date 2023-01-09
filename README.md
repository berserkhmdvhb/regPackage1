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

Please run the commands of this section in a console of an R editor (e.g., Rstudio)

## `renv` packages
Install the [`renv`](https://rstudio.github.io/renv/articles/renv.html) library, load its and then use the [`renv.lock`](https://github.com/berserkhmdvhb/regPackage1/blob/main/renv.lock) file to install the requied packages. Please follow the following commands in the console:

```
install.packages("renv")
library(renv)
renv::restore()
```

To view the documentation my package, how to use its functions, and to read the report for a machine learning project that I did using this package, refer to [Documentation](#Documentation).

## Unit Tests
TO DO

```bash
└── tests
    ├── testthat
    │   └── test-eval_hmd.R
    └── testthat.R
```

## `targets` Pipeline

After installing the ```diff regPackage1``` package (refer to [Install](#Install)), and installing the required packages from the `renv.lock` file (refer to [`renv`](#renv-packages)), clone my package's repository, install and load the `targets` library, and the run `tar_make()` to run the pipeline.

```
install.packages("targets")
library(targets)
tar_make()
```

Explanations:

First look at tree structure
outcomes.

```bash
├── R
│   ├── functions.R
├── run.R
├── run.sh
├── _targets.R
└── tests
    ├── testthat
    │   └── test-eval_hmd.R
    └── testthat.R
```

47 directories, 88 files


## `shiny` App

```bash
├── my_app
│   ├── global.R
│   ├── server.R
│   └── ui.R
├── R
│   ├── functions.R
```

# Documentation and Report

The documentation of the package can be accessed with the following commands.

```
help(packag = regPackage1)
```

The Rmarkdown report for the insurance claims' classification of the outcomes can be accessed in the following links:

[Link of Rmardkown file](https://github.com/berserkhmdvhb/regPackage1/blob/main/inst/report.Rmd)

[Link of HTML rendering of the Rmarkdown file](https://htmlpreview.github.io/?https://github.com/berserkhmdvhb/regPackage1/blob/main/inst/report.html)

