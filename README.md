
<!-- README.md is generated from README.Rmd. Please edit that file -->

# data.iquizoo

<!-- badges: start -->

[![R-CMD-check](https://github.com/psychelzh/data.iquizoo/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/psychelzh/data.iquizoo/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of data.iquizoo is to provide datasets for IQUIZOO workflows.
It originally lived in dataproc.iquizoo package, and then we divided it
into two new packages: data.iquizoo and preproc.iquizoo (see
[psychelzh/dataproc.iquizoo#42](https://github.com/psychelzh/dataproc.iquizoo/issues/42)
for more discussions on this decision).

## Installation

You can install the development version of data.iquizoo from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("psychelzh/data.iquizoo")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(data.iquizoo)
# for long-int identifiers
requireNamespace("bit64")
#> Loading required namespace: bit64
# basic example code
head(game_info)
#>           game_id   game_name game_name_ver       game_name_en game_name_abbr
#> 1 305067065282821 Sandia推理A          <NA> Sandia Reasoning A        SandiaA
#> 2 305067236323525 Sandia推理B          <NA> Sandia Reasoning B        SandiaB
#> 3 306923687555141 Sandia推理C          <NA> Sandia Reasoning C        SandiaC
#> 4 306923906232453 Sandia推理D          <NA> Sandia Reasoning D        SandiaD
#> 5 306924084809861 Sandia推理E          <NA> Sandia Reasoning E        SandiaE
#> 6 306924227293317 Sandia推理F          <NA> Sandia Reasoning F        SandiaF
#>   prep_fun_name input extra
#> 1  countcorrect  NULL  NULL
#> 2  countcorrect  NULL  NULL
#> 3  countcorrect  NULL  NULL
#> 4  countcorrect  NULL  NULL
#> 5  countcorrect  NULL  NULL
#> 6  countcorrect  NULL  NULL
```

## Contributing

We develop with the [github
flow](https://docs.github.com/en/get-started/quickstart/github-flow) for
its simplicity of this package.
