#' Screen out unused indices
#'
#' @param data A data frame with indices.
#' @param col_index The name of the column of the index name.
#' @param col_score The name of the column of the index score.
#' @return A data frame with screened indices.
#' @export
screen_indices <- function(data,
                           col_index = "index_name",
                           col_score = "score") {
  requireNamespace("bit64")
  data |>
    inner_join(
      data.iquizoo::game_indices,
      join_by("game_id", {{ col_index }} == "index_main")
    ) |>
    mutate(
      score_adj = if_else(
        .data$index_reverse,
        -.data[[col_score]],
        .data[[col_score]]
      )
    )
}
