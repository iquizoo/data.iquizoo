
<!-- README.md is generated from README.Rmd. Please edit that file -->

# data.iquizoo

<!-- badges: start -->

[![R-CMD-check](https://github.com/psychelzh/data.iquizoo/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/psychelzh/data.iquizoo/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/psychelzh/data.iquizoo/branch/main/graph/badge.svg)](https://app.codecov.io/gh/psychelzh/data.iquizoo?branch=main)
<!-- badges: end -->

The goal of data.iquizoo is to provide datasets for IQUIZOO workflows.

## Installation

You can install the development version of data.iquizoo from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("psychelzh/data.iquizoo")
```

Or you can install from [r-universe](https://psychelzh.r-universe.dev/)
with:

``` r
install.packages("data.iquizoo", repos = c(getOption("repos"), "https://psychelzh.r-universe.dev"))
```

## Example

The main parts of the package are two datasets: `game_info` and
`game_indices`. The former contains information about games, and the
latter contains information about the indices of games. Here is a simple
example:

``` r
library(data.iquizoo)
# for long-int identifiers
requireNamespace("bit64", quietly = TRUE)
# show the first few rows of the data
head(game_info)
#>           game_id   game_name game_name_ver       game_name_en game_name_abbr
#> 1 576947514081349  2-back任务                    Two Back CAMP     Nback2CAMP
#> 2 305067065282821 Sandia推理A               Sandia Reasoning A        SandiaA
#> 3 305067236323525 Sandia推理B               Sandia Reasoning B        SandiaB
#> 4 306923687555141 Sandia推理C               Sandia Reasoning C        SandiaC
#> 5 306923906232453 Sandia推理D               Sandia Reasoning D        SandiaD
#> 6 306924084809861 Sandia推理E               Sandia Reasoning E        SandiaE
#>   game_id_parallel
#> 1             <NA>
#> 2             <NA>
#> 3  305067065282821
#> 4  305067065282821
#> 5  305067065282821
#> 6  305067065282821
head(game_indices)
#>           game_id index_main index_reverse
#> 1 305067065282821         nc         FALSE
#> 2 305067236323525         nc         FALSE
#> 3 306923687555141         nc         FALSE
#> 4 306923906232453         nc         FALSE
#> 5 306924084809861         nc         FALSE
#> 6 306924227293317         nc         FALSE
```

Some functions are also provided to help you work with the datasets. For
example:

``` r
library(data.iquizoo)
# some other useful functions
game_id <- bit64::as.integer64(305067065282821)
match_info(game_id, to = "game_name")
#> [1] "Sandia推理A"
merge_preproc(data.frame(game_id = game_id))
#>           game_id     prep_fun  tag input extra
#> 1 305067065282821 countcorrect <NA>  NULL  NULL
```

## Contributing

We develop with the [github
flow](https://docs.github.com/en/get-started/quickstart/github-flow) for
its simplicity of this package.
