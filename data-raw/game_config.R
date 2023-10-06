## code to prepare `game_info` and `game_indices` dataset goes here
library(dplyr)
library(tidyr)
fromJSON_possibly <- purrr::possibly(
  jsonlite::fromJSON,
  otherwise = NULL
)
game_config <- readr::read_csv(
  "data-raw/game_config.csv",
  col_types = readr::cols(game_id = "I")
) |>
  mutate(
    across(
      c(input, extra),
      ~ purrr::map(., fromJSON_possibly) |>
        purrr::map_chr(rlang::expr_text)
    )
  )
game_info <- game_config |>
  dplyr::select(-contains("index"))
game_indices <- game_config |>
  select(game_id, index_main, index_reverse) |>
  drop_na()
usethis::use_data(game_info, game_indices, overwrite = TRUE)
