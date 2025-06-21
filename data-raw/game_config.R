## code to prepare `game_info` and `game_indices` dataset goes here
library(tidyverse)
games_current <- read_file("data-raw/contents.sql") |>
  tarflow.iquizoo::fetch_iquizoo()
games_existed <- read_csv(
  "data-raw/game_config.csv",
  col_types = cols(game_id = "I"),
  na = "NA"
)

# updating information for existed games
match_vars <- intersect(names(games_current), names(games_existed))
games_existed <- games_existed |>
  semi_join(games_current, by = "game_id") |>
  select(!setdiff(match_vars, "game_id")) |>
  left_join(
    games_current |> select(all_of(match_vars)),
    by = "game_id"
  ) |>
  select(all_of(names(games_existed)))

pat_exclude <- c(
  "^[\\d\\.]*测试[\\d\\.]*$", # exclude test games
  "^[\\d\\.]+$" # exclude games with only digits and dots
)
games_current |>
  filter(game_type %in% c(1, 3)) |>
  anti_join(
    read_csv(
      "data-raw/games_exclude.csv",
      col_types = cols(game_id = "I"),
      na = "NA"
    ),
    by = "game_id"
  ) |>
  filter(!str_detect(game_name, str_c(pat_exclude, collapse = "|"))) |>
  distinct(game_id, game_name, game_name_ver) |>
  full_join(
    games_existed,
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
