## code to prepare `game_info` dataset goes here
game_info <- readr::read_csv(
  "data-raw/game_info.csv",
  col_types = readr::cols(.default = readr::col_character()),
  lazy = FALSE
)
usethis::use_data(game_info, overwrite = TRUE)
