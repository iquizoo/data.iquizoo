
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
#> # A tibble: 6 × 6
#>   game_id game_name   game_name_ver game_name_en game_name_abbr game_id_parallel
#>   <int64> <chr>       <chr>         <chr>        <chr>                   <int64>
#> 1    5e14 2-back任务  ""            Two Back CA… Nback2CAMP                NA   
#> 2    3e14 Sandia推理A ""            Sandia Reas… SandiaA                   NA   
#> 3    3e14 Sandia推理B ""            Sandia Reas… SandiaB                    3e14
#> 4    3e14 Sandia推理C ""            Sandia Reas… SandiaC                    3e14
#> 5    3e14 Sandia推理D ""            Sandia Reas… SandiaD                    3e14
#> 6    3e14 Sandia推理E ""            Sandia Reas… SandiaE                    3e14
head(game_indices)
#> # A tibble: 6 × 3
#>   game_id index_main index_reverse
#>   <int64> <chr>      <lgl>        
#> 1    3e14 nc         FALSE        
#> 2    3e14 nc         FALSE        
#> 3    3e14 nc         FALSE        
#> 4    3e14 nc         FALSE        
#> 5    3e14 nc         FALSE        
#> 6    3e14 nc         FALSE
```

Some functions are also provided to help you work with the datasets. For
example:

``` r
library(data.iquizoo)
# some other useful functions
game_id <- bit64::as.integer64(305067065282821)
match_info(game_id, to = "game_name")
#> [1] "Sandia推理A"
match_preproc(data.frame(game_id = game_id))
#>           game_id     prep_fun  tag input extra
#> 1 305067065282821 countcorrect <NA>  NULL  NULL
```

## Contributing

We develop with the [github
flow](https://docs.github.com/en/get-started/quickstart/github-flow) for
its simplicity of this package.
