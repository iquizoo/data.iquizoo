## code to prepare `game_info` and `game_indices` dataset goes here
library(tidyverse)
games <- tarflow.iquizoo::fetch_iquizoo(read_file("data-raw/contents.sql"))
game_config_existed <- read_csv(
  "data-raw/game_config.csv",
  col_types = cols(game_id = "I"),
  na = "NA"
)
games_exclude <- read_csv(
  "data-raw/games_exclude.csv",
  col_types = cols(game_id = "I"),
  na = "NA"
)
games |>
  filter(game_type %in% c(1, 3)) |>
  anti_join(games_exclude, by = "game_id") |>
  distinct(game_id, game_name, game_name_ver) |>
  full_join(
    game_config_existed,
    by = join_by(game_id, game_name, game_name_ver)
  ) |>
  write_excel_csv("data-raw/game_config.csv", quote = "needed", na = "")
game_config <- readr::read_csv(
  "data-raw/game_config.csv",
  col_types = readr::cols(game_id = "I"),
  na = "NA"
) |>
  mutate(
    across(
      c(input, extra),
      ~ purrr::map(
        .x,
        ~ if (.x != "") rlang::parse_expr(.x)
      )
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

game_preproc <- game_config |>
  select(game_id, prep_fun_name, input, extra) |>
  filter(prep_fun_name != "") |>
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
usethis::use_data(game_info, overwrite = TRUE)
usethis::use_data(game_preproc, internal = TRUE, overwrite = TRUE)
