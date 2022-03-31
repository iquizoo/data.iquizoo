## code to prepare `game_info` dataset goes here
fromJSON_possibly <- purrr::possibly(
  jsonlite::fromJSON,
  otherwise = NULL
)
game_info <- readr::read_csv(
  "data-raw/game_info.csv",
  col_types = readr::cols(.default = readr::col_character()),
  lazy = FALSE
) |>
  dplyr::mutate(
    dplyr::across(
      c(input, extra),
      ~ map(., fromJSON_possibly)
    )
  )
usethis::use_data(game_info, overwrite = TRUE)
