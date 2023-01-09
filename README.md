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

### Tree Structure
```bash
└── tests
    ├── testthat
    │   └── test-eval_hmd.R
    └── testthat.R
```

## `targets` Pipeline

After installing the `regPackage1` package (refer to [Install](#Install)), and installing the required packages from the `renv.lock` file (refer to [`renv`](#renv-packages)), use  clone my package's repository, install and load the `targets` library, and the run `tar_make()` to run the pipeline.

```
git clone git@github.com:berserkhmdvhb/regPackage1.git
library(regPackage1)
install.packages("targets")
library(targets)
tar_make()
```
After the pipeline is successfully run, there should be now two plots called `plot_glm` and `plot_rf` (as can bee seen in the figure in [Visualize](#Visualize)). Both of the plots display ROC curve, while the former attributes to the logistic regression (implemented by the glmnet), and the latter attributes to random forest classifier. The two plots are very similar, as the models had very similar performance. Two view the two plots, run the following in the console:

```
tar_read(plot_glm)
tar_read(plot_rf)
```


### Tree Structure

```bash
├── R
│   ├── functions.R
├── run.R
├── run.sh
├── _targets.R
```

### Visualize 

To visalize the components of the pipeline, run the following:

```
tar_visnetwork()
```

The following figure should be displayed:
![`tar_visnetwork`](https://github.com/berserkhmdvhb/regPackage1/blob/main/inst/figures/tar_visnetwork.png)


Evidenced by the visualization, the two datasets used in the pipeline are `insurance_train` and `insurance_test`.
They are datasets processed from the raw `car_insurance_data`, and all the three mentioned datasets are incorporated in the package.
The steps of the pipeline are elaborated on in the following:

1. Access the insurance_train with

## `shiny` App

Although the shiny App could be based on `targets`, since the whole point of this package is not deploying a shiny app, and instead doing a classification project, I separated the `shiny` app and `targerts` pipeline, while they have interesction on the `functions.R`. This can be seen from their tree structure

### Tree Structure

As mentioned, the `functions.R` play role in both `shiny` and `targets`.

```bash
├── my_app
│   ├── global.R
│   ├── server.R
│   └── ui.R
├── R
│   ├── functions.R
```

### Visualize

# Documentation and Report

The documentation of the package can be accessed with the following commands.

```
help(packag = regPackage1)
```

The Rmarkdown report for the insurance claims' classification of the outcomes can be accessed in the following links:

[Link of Rmardkown file](https://github.com/berserkhmdvhb/regPackage1/blob/main/inst/report.Rmd)

[Link of HTML rendering of the Rmarkdown file](https://htmlpreview.github.io/?https://github.com/berserkhmdvhb/regPackage1/blob/main/inst/report.html)

