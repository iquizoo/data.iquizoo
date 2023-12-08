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
    ),
    across(
      starts_with("index"),
      ~ stringr::str_split(.x, ";") |>
        purrr::map(readr::parse_guess)
    )
  )
game_info <- game_config |>
  select(starts_with("game")) |>
  separate_wider_regex(
    game_name_en,
    c(game_name_stem = ".+", parallel = "(?<=\\s)[A-F]$"),
    too_few = "align_start",
    cols_remove = FALSE
  ) |>
  mutate(
    game_id_parallel = if_else(
      n() > 1 & row_number(parallel) > 1,
      game_id[row_number(parallel) == 1],
      bit64::as.integer64(NA)
    ),
    .by = game_name_stem
  ) |>
  select(-game_name_stem, -parallel)

game_indices <- game_config |>
  select(game_id, index_main, index_reverse) |>
  unnest(cols = c(index_main, index_reverse)) |>
  drop_na()
game_preproc <- game_config |>
  select(game_id, prep_fun_name, input, extra) |>
  filter(!is.na(prep_fun_name)) |>
  separate_wider_regex(
    prep_fun_name,
    c(prep_fun_name = ".+", tag = "\\W+"),
    too_few = "align_start"
  ) |>
  mutate(
    prep_fun = syms(prep_fun_name),
    .keep = "unused",
    .after = 1
  )
usethis::use_data(game_info, game_indices, overwrite = TRUE)
usethis::use_data(game_preproc, internal = TRUE, overwrite = TRUE)
