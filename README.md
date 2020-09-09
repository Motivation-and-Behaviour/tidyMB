
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tidyMB

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/tidyMB)](https://CRAN.R-project.org/package=tidyMB)
<!-- badges: end -->

The goal of tidyMB is to provide opinionated table, figure, and .Rmd
templates and styles used in the Motivation and Behaviour program at
Institute for Positive Psychology and Education, Australian Catholic
University.

## Installation

The development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Motivation-and-Behaviour/tidyMB")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(magrittr)
library(gt)
library(tidyMB)
iris %>%
  head() %>%
  gt() %>%
  apa_style(title = 'Table 1', subtitle = "_Isis Database_") %>%
  gtsave(filename = 'fig1.png',path = "fig")
```

<img src="man/figures/README-example-1.png" width="100%" />
