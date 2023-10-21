#' Match pre-processing parameters
#'
#' These complex parameters are stored internally, and users must retrieve them
#' through this function.
#'
#' @param games A [data.frame] contains the games to match parameters.
#' @return A [data.frame] added pre-processing parameters. Note if there is no
#'   match for a game, the matched parameters are empty vectors (e.g., `NULL`).
#' @export
match_preproc <- function(games) {
  if (!requireNamespace("bit64", quietly = TRUE)) {
    stop("`bit64` package must be installed to continue.")
  }
  name_key <- "game_id"
  if (!utils::hasName(games, name_key)) {
    stop("`game_id` column must be present.")
  }
  dplyr::left_join(
    games,
    game_preproc,
    by = name_key
  )
}
