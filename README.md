
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
str(config_prep_fun)
#> List of 27
#>  $ bart         :List of 2
#>   ..$ input :List of 2
#>   .. ..$ name_nhit    : chr "nhit"
#>   .. ..$ name_feedback: chr "feedback"
#>   ..$ output: chr [1:3] "mean_pumps" "mean_pumps_raw" "num_explosion"
#>  $ bps          :List of 2
#>   ..$ input :List of 5
#>   .. ..$ name_phase: chr "phase"
#>   .. ..$ name_type : chr "type"
#>   .. ..$ name_resp : chr "resp"
#>   .. ..$ name_acc  : chr "acc"
#>   .. ..$ name_rt   : chr "rt"
#>   ..$ output: chr [1:5] "pc" "p_sim_foil" "p_sim_lure" "p_sim_target" ...
#>  $ complexswitch:List of 2
#>   ..$ input :List of 6
#>   .. ..$ name_block : chr "block"
#>   .. ..$ name_cong  : chr "stimtype"
#>   .. ..$ name_task  : chr [1:2] "task" "sex"
#>   .. ..$ name_switch: chr "tasktype"
#>   .. ..$ name_acc   : chr "acc"
#>   .. ..$ name_rt    : chr "rt"
#>   ..$ output: chr [1:16] "mrt_con" "mrt_inc" "cong_eff_rt" "pc_con" ...
#>  $ congeff      :List of 2
#>   ..$ input :List of 3
#>   .. ..$ name_cong: chr "type"
#>   .. ..$ name_acc : chr "acc"
#>   .. ..$ name_rt  : chr "rt"
#>   ..$ output: chr [1:6] "mrt_inc" "mrt_con" "cong_eff_rt" "pc_inc" ...
#>  $ countcorrect :List of 2
#>   ..$ input :List of 1
#>   .. ..$ name_acc: chr [1:3] "acc" "repetition" "correctness"
#>   ..$ output: chr "nc"
#>  $ countcorrect2:List of 2
#>   ..$ input :List of 2
#>   .. ..$ name_nc: chr "ncorrect"
#>   .. ..$ name_ne: chr "nerror"
#>   ..$ output: chr "nc_cor"
#>  $ cpt          :List of 2
#>   ..$ input :List of 3
#>   .. ..$ name_type: chr [1:3] "type" "stimtype" "cresp"
#>   .. ..$ name_acc : chr "acc"
#>   .. ..$ name_rt  : chr "rt"
#>   ..$ output: chr [1:7] "nc" "mrt" "rtsd" "dprime" ...
#>  $ crt          :List of 2
#>   ..$ input :List of 2
#>   .. ..$ name_acc: chr "acc"
#>   .. ..$ name_rt : chr "rt"
#>   ..$ output: chr [1:3] "mrt" "rtsd" "nc"
#>  $ driving      :List of 2
#>   ..$ input :List of 3
#>   .. ..$ name_yellow_dur : chr "yellowdur"
#>   .. ..$ name_still_dur  : chr "stilldur"
#>   .. ..$ name_still_light: chr "stilllight"
#>   ..$ output: chr "still_ratio"
#>  $ drm          :List of 2
#>   ..$ input :List of 4
#>   .. ..$ name_type: chr "type"
#>   .. ..$ name_acc : chr "acc"
#>   .. ..$ name_rt  : chr "rt"
#>   .. ..$ name_resp: chr "resp"
#>   ..$ output: chr [1:4] "tm_dprime" "tm_bias" "fm_dprime" "fm_bias"
#>  $ igt          :List of 2
#>   ..$ input :List of 2
#>   .. ..$ name_pool   : chr "poolid"
#>   .. ..$ name_outcome: chr "outcome"
#>   ..$ output: chr [1:2] "sum_outcome" "perc_good"
#>  $ jlo          :List of 2
#>   ..$ input :List of 3
#>   .. ..$ name_angle: chr "angle"
#>   .. ..$ name_resp : chr "resp"
#>   .. ..$ name_acc  : chr "acc"
#>   ..$ output: chr [1:3] "nc" "mean_ang_err" "mean_log_err"
#>  $ locmem       :List of 2
#>   ..$ input :List of 1
#>   .. ..$ name_dist: chr "resplocdist"
#>   ..$ output: chr [1:3] "nc_loc" "mean_dist_err" "mean_log_err"
#>  $ locmem2      :List of 2
#>   ..$ input :List of 2
#>   .. ..$ name_acc_order: chr "respaccorder"
#>   .. ..$ name_dist     : chr "resplocdist"
#>   ..$ output: chr [1:4] "nc_loc" "mean_dist_err" "mean_log_err" "nc_order"
#>  $ london       :List of 2
#>   ..$ input :List of 4
#>   .. ..$ name_level  : chr "level"
#>   .. ..$ name_score  : chr "score"
#>   .. ..$ name_outcome: chr "outcome"
#>   .. ..$ name_steps  : chr "stepsused"
#>   ..$ output: chr [1:3] "total_score" "mean_level" "level_score"
#>  $ multisense   :List of 2
#>   ..$ input :List of 2
#>   .. ..$ name_type: chr "type"
#>   .. ..$ name_rt  : chr "rt"
#>   ..$ output: chr [1:4] "mrt_image" "mrt_sound" "mrt_mixed" "mrt_mixadv"
#>  $ nback        :List of 2
#>   ..$ input :List of 3
#>   .. ..$ name_type: chr "type"
#>   .. ..$ name_acc : chr "acc"
#>   .. ..$ name_rt  : chr "rt"
#>   ..$ output: chr [1:4] "pc" "mrt" "dprime" "c"
#>  $ nle          :List of 2
#>   ..$ input :List of 2
#>   .. ..$ name_number: chr "number"
#>   .. ..$ name_resp  : chr "resp"
#>   ..$ output: chr [1:2] "mean_abs_err" "mean_log_err"
#>  $ nsymncmp     :List of 2
#>   ..$ input :List of 4
#>   .. ..$ name_big  : chr "bigsetcount"
#>   .. ..$ name_small: chr "smallsetcount"
#>   .. ..$ name_acc  : chr "acc"
#>   .. ..$ name_rt   : chr "rt"
#>   ..$ output: chr [1:3] "pc" "mrt" "w"
#>  $ refframe     :List of 2
#>   ..$ input :List of 2
#>   .. ..$ name_type: chr "type"
#>   .. ..$ name_dist: chr "dist"
#>   ..$ output: chr [1:6] "mean_dist_err_allo" "mean_log_err_allo" "mean_dist_err_ego" "mean_log_err_ego" ...
#>  $ span         :List of 2
#>   ..$ input :List of 2
#>   .. ..$ name_slen   : chr [1:2] "numtarget" "slen"
#>   .. ..$ name_outcome: chr "outcome"
#>   ..$ output: chr [1:3] "nc" "max_span" "mean_span"
#>  $ srt          :List of 2
#>   ..$ input :List of 1
#>   .. ..$ name_rt: chr "rt"
#>   ..$ output: chr [1:2] "mrt" "rtsd"
#>  $ stopsignal   :List of 2
#>   ..$ input :List of 4
#>   .. ..$ name_type: chr "type"
#>   .. ..$ name_ssd : chr "ssd"
#>   .. ..$ name_acc : chr "acc"
#>   .. ..$ name_rt  : chr "rt"
#>   ..$ output: chr [1:4] "pc_all" "pc_go" "medrt_go" "ssrt"
#>  $ sumweighted  :List of 2
#>   ..$ input :List of 2
#>   .. ..$ name_weight: chr "nstim"
#>   .. ..$ name_acc   : chr "acc"
#>   ..$ output: chr "nc_weighted"
#>  $ sumscore     :List of 2
#>   ..$ input :List of 1
#>   .. ..$ name_score: chr "score"
#>   ..$ output: chr "nc_score"
#>  $ switchcost   :List of 2
#>   ..$ input :List of 5
#>   .. ..$ name_block : chr "block"
#>   .. ..$ name_task  : chr "task"
#>   .. ..$ name_switch: chr "type"
#>   .. ..$ name_acc   : chr "acc"
#>   .. ..$ name_rt    : chr "rt"
#>   ..$ output: chr [1:10] "mrt_pure" "mrt_repeat" "mrt_switch" "switch_cost_rt_gen" ...
#>  $ symncmp      :List of 2
#>   ..$ input :List of 4
#>   .. ..$ name_big  : chr "big"
#>   .. ..$ name_small: chr "small"
#>   .. ..$ name_acc  : chr "acc"
#>   .. ..$ name_rt   : chr "rt"
#>   ..$ output: chr [1:3] "pc" "mrt" "dist_eff"
```

## Contributing

We develop with the [github
flow](https://docs.github.com/en/get-started/quickstart/github-flow) for
its simplicity of this package.
