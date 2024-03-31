test_that("Default option works", {
  head(game_info["game_id"], 4) |>
    merge_preproc() |>
    expect_named(c("game_id", "prep_fun", "tag", "input", "extra")) |>
    nrow() |>
    expect_equal(3)
})

test_that("Filter only works correctly", {
  head(game_info["game_id"], 4) |>
    merge_preproc(filter_only = TRUE) |>
    expect_named("game_id") |>
    nrow() |>
    expect_equal(3)
})

test_that("Change merge options", {
  head(game_info["game_id"], 4) |>
    merge_preproc(all.x = TRUE) |>
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
