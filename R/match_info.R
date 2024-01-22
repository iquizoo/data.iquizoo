#' Match specific piece of information of games
#'
#' @param x The known information of games.
#' @param from The name of the column of the known information.
#' @param to The name of the column of the information to be matched.
#' @return The matched information.
#' @export
match_info <- function(x, from = "game_name_abbr", to = "game_id") {
  requireNamespace("bit64")
  matched <- match(x, data.iquizoo::game_info[[from]])
  if (anyNA(matched)) {
    stop("Some of the information is not matched.")
  }
  data.iquizoo::game_info[[to]][matched]
}
