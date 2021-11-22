
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
#>                                game_id           game_name
#> 1 9e14dbf6-8689-4e45-88e6-472f8f3f2663 Conners行为评定量表
#> 2 5b62cb67-dc37-4e3a-b948-ee2f202e3f35    MBTI职业性格测试
#> 3 f393282a-e2b1-4f40-a434-b7f7f345d13b             MINIKID
#> 4 438e859d-8fcb-43c9-aee7-6fee32550134   SAGES图形推理测验
#> 5 ed0a28e4-9a36-402d-b671-3a26abb57581            按图索骥
#> 6 3ebada56-d085-4ec4-807b-62857e1ecb11        贝克焦虑量表
#>             game_name_en game_name_abbr prep_fun_name
#> 1                Conners        Conners      sumscore
#> 2                   MBTI           MBTI      sumscore
#> 3                MINIKID        MINIKID      sumscore
#> 4                  SAGES          SAGES  countcorrect
#> 5 Hidden Object Paradigm            HOP      refframe
#> 6 Beck Anxiety Inventory            BAI      sumscore
```

## Contributing

We develop with the [github
flow](https://docs.github.com/en/get-started/quickstart/github-flow) for
its simplicity of this package.
