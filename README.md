
<!-- README.md is generated from README.Rmd. Please edit that file -->

# data.iquizoo

<!-- badges: start -->

[![R-CMD-check](https://github.com/psychelzh/data.iquizoo/workflows/R-CMD-check/badge.svg)](https://github.com/psychelzh/data.iquizoo/actions)
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
## basic example code
head(game_info)
#>           game_id           game_name           game_name_en game_name_abbr
#> 1 268008982659184 Conners行为评定量表                Conners        Conners
#> 2 268008982650982    MBTI职业性格测试                   MBTI           MBTI
#> 3 268008982671435             MINIKID                MINIKID        MINIKID
#> 4 268008982646905   SAGES图形推理测验                  SAGES          SAGES
#> 5 268008982667388            按图索骥 Hidden Object Paradigm            HOP
#> 6 268008982646896        贝克焦虑量表 Beck Anxiety Inventory            BAI
#>   prep_fun_name input extra
#> 1      sumscore  NULL  NULL
#> 2      sumscore  NULL  NULL
#> 3      sumscore  NULL  NULL
#> 4  countcorrect  NULL  NULL
#> 5      refframe  NULL  NULL
#> 6      sumscore  NULL  NULL
```

## Contributing

We develop with the [github
flow](https://docs.github.com/en/get-started/quickstart/github-flow) for
its simplicity of this package.
