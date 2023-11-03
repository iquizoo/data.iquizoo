#' Match pre-processing parameters
#'
#' These complex parameters are stored internally, and users must retrieve them
#' through this function.
#'
#' @param games A [data.frame] contains the games to match parameters.
#' @param type The matching type. Mimicking the names of [dplyr::join], so the
#'   name will match the same type of join. Note the `"semi"` option will also
#'   call [dplyr::semi_join()] will just keep those matched rows without data
#'   combing.
#' @return A [data.frame] added pre-processing parameters. Note if there is no
#'   match for a game, the matched parameters are empty vectors (e.g., `NULL`).
#' @export
match_preproc <- function(games, type = c("left", "inner", "semi")) {
  if (!requireNamespace("bit64", quietly = TRUE)) {
    stop("`bit64` package must be installed to continue.")
  }
  if (!requireNamespace("dplyr", quietly = TRUE)) {
    stop("`dplyr` package must be installed to continue.")
  }
  type <- match.arg(type)
  join <- utils::getFromNamespace(paste0(type, "_join"), "dplyr")
  name_key <- "game_id"
  if (!utils::hasName(games, name_key)) {
    stop("`game_id` column must be present.")
  }
  join(
    games,
    game_preproc,
    by = name_key
  )
}
