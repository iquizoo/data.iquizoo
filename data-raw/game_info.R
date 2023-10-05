## code to prepare `game_info` dataset goes here
fromJSON_possibly <- purrr::possibly(
  jsonlite::fromJSON,
  otherwise = NULL
)
game_info <- readr::read_csv(
  "data-raw/game_info.csv",
  col_types = readr::cols(game_id = "I")
) |>
  dplyr::mutate(
    dplyr::across(
      c(input, extra),
      ~ purrr::map(., fromJSON_possibly) |>
        purrr::map_chr(rlang::expr_text)
    )
  )
usethis::use_data(game_info, overwrite = TRUE)
