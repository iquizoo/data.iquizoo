#' Match pre-processing parameters
#'
#' These complex parameters are stored internally, and users must retrieve them
#' through this function.
#'
#' @param games A [data.frame] contains the games to match parameters.
#' @param ... Additional arguments passed to [merge()].
#' @param filter_only Whether to perform filtering only, i.e., keep only the
#'   matched games.
#' @param rm_tagged Whether to remove games with a tagged pre-processing
#'   function. Default is `FALSE`.
#' @param name_key The name of the column to match the games.
#' @return A [data.frame] added pre-processing parameters. Note if there is no
#'   match for a game, the matched parameters are empty vectors (e.g., `NULL`).
#' @export
merge_preproc <- function(games, ...,
                          filter_only = FALSE,
                          rm_tagged = FALSE,
                          name_key = "game_id") {
  requireNamespace("bit64")
  if (rm_tagged) {
    game_preproc <- game_preproc[is.na(game_preproc$tag), ]
  }
  if (filter_only) {
    games[games[[name_key]] %in% game_preproc[["game_id"]], , drop = FALSE]
  } else {
    merge(games, game_preproc, by.x = name_key, by.y = "game_id", ...)
  }
}
