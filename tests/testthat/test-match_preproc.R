test_that("Match correctly", {
  n_slice <- 4
  games <- head(dplyr::select(game_info, game_id), n_slice)
  match_preproc(games, type = "left") |>
    expect_named(c("game_id", "prep_fun", "tag", "input", "extra")) |>
    nrow() |>
    expect_equal(n_slice)
  match_preproc(games, type = "inner") |>
    expect_named(c("game_id", "prep_fun", "tag", "input", "extra")) |>
    nrow() |>
    expect_equal(3)
  match_preproc(games, type = "semi") |>
    expect_named("game_id") |>
    nrow() |>
    expect_equal(3)
})

test_that("`rm_tagged` work correctly", {
  game_preproc |>
    dplyr::filter(!is.na(tag)) |>
    dplyr::slice(1) |>
    dplyr::select(game_id) |>
    match_preproc(type = "left", rm_tagged = TRUE) |>
    expect_named(c("game_id", "prep_fun", "tag", "input", "extra")) |>
    .subset2("prep_fun") |>
    expect_identical(list(NULL))
})
