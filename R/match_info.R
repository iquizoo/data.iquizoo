#' Match specific piece of information of games
#'
#' @param x The known information of games.
#' @param to The name of the column of the information to be matched.
#' @param from The name of the column of the known information.
#' @param fail_on_missing Whether to stop if some of the information is not
#'   matched.
#' @return The matched information.
#' @export
match_info <- function(x, to, from = "game_id", fail_on_missing = TRUE) {
  requireNamespace("bit64")
  matched <- match(x, data.iquizoo::game_info[[from]])
  if (anyNA(matched) && fail_on_missing) {
    stop("Some of the information is not matched.")
  }
  data.iquizoo::game_info[[to]][matched]
}
