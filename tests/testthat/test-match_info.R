test_that("Match existing information", {
  game_id <- bit64::as.integer64(305067065282821)
  match_info(game_id, "game_name_abbr") |>
    expect_identical("SandiaA")
})

test_that("Error if no match", {
  match_info(0) |>
    expect_error("not matched")
})
