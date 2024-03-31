test_that("Default option works", {
  n_slice <- 4
  games <- head(game_info["game_id"], n_slice)
  # default is inner merge
  merge_preproc(games) |>
    expect_named(c("game_id", "prep_fun", "tag", "input", "extra")) |>
    nrow() |>
    expect_equal(3)
})

test_that("Filter only works correctly", {
  n_slice <- 4
  games <- head(game_info["game_id"], n_slice)
  # filter only
  merge_preproc(games, filter_only = TRUE) |>
    expect_named("game_id") |>
    nrow() |>
    expect_equal(3)
})

test_that("Change merge options", {
  n_slice <- 4
  games <- head(game_info["game_id"], n_slice)
  # change merge options
  merge_preproc(games, all.x = TRUE) |>
    expect_named(c("game_id", "prep_fun", "tag", "input", "extra")) |>
    nrow() |>
    expect_equal(4)
})

test_that("`rm_tagged` work correctly", {
  matched <- merge_preproc(
    game_preproc[!is.na(game_preproc$tag), ][1, "game_id", drop = FALSE],
    all.x = TRUE, # ensure all games are returned
    rm_tagged = TRUE
  )
  expect_named(matched, c("game_id", "prep_fun", "tag", "input", "extra"))
  expect_true(is.na(matched$prep_fun[[1]]))
})
