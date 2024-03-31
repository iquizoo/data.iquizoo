test_that("Merge correctly", {
  n_slice <- 4
  games <- head(game_info["game_id"], n_slice)
  merge_preproc(games) |>
    expect_named(c("game_id", "prep_fun", "tag", "input", "extra")) |>
    nrow() |>
    expect_equal(n_slice)
  merge_preproc(games, filter_only = TRUE) |>
    expect_named("game_id") |>
    nrow() |>
    expect_equal(3)
})

test_that("`rm_tagged` work correctly", {
  matched <- merge_preproc(
    game_preproc[!is.na(game_preproc$tag), ][1, "game_id", drop = FALSE],
    rm_tagged = TRUE
  )
  expect_named(matched, c("game_id", "prep_fun", "tag", "input", "extra"))
  expect_true(is.na(matched$prep_fun[[1]]))
})
