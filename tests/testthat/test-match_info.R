test_that("Match existing information", {
  match_info("SandiaA") |>
    expect_identical(bit64::as.integer64(305067065282821))
  match_info("SandiaA", to = "game_name_en") |>
    expect_identical("Sandia Reasoning A")
})

test_that("Error if no match", {
  match_info("Unknown") |>
    expect_error("not matched")
})
