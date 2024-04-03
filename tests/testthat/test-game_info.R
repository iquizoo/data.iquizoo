test_that("Ensure no duplicated names", {
  expect_identical(
    anyDuplicated(game_info$game_name_en, incomparables = ""),
    0L
  )
  expect_identical(
    anyDuplicated(game_info$game_name_abbr, incomparables = ""),
    0L
  )
})
