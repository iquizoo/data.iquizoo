## code to prepare `game_info` and `game_indices` dataset goes here
library(dplyr)
library(tidyr)
game_config <- readr::read_csv(
  "data-raw/game_config.csv",
  col_types = readr::cols(game_id = "I")
) |>
  mutate(
    across(
      c(input, extra),
      ~ purrr::map(
        .x,
        ~ if (!is.na(.x)) rlang::parse_expr(.x)
      )
    )
  )
game_info <- game_config |>
  select(starts_with("game"))
game_indices <- game_config |>
  select(game_id, index_main, index_reverse) |>
  drop_na()
game_preproc <- game_config |>
  select(game_id, prep_fun_name, input, extra) |>
  filter(!is.na(prep_fun_name)) |>
  mutate(
    prep_fun = syms(prep_fun_name),
    .keep = "unused",
    .after = 1
  )
usethis::use_data(game_info, game_indices, overwrite = TRUE)
usethis::use_data(game_preproc, internal = TRUE, overwrite = TRUE)
