#' Game information
#'
#' The alternative names for all the games supported by IQUIZOO.COM.
#'
#' @format A data frame with 350 rows of the following variables:
#' \describe{
#'
#'   \item{game_id}{Game id, a 64-bit integer.}
#'
#'   \item{game_name}{Game name in Chinese, matching that in the database.}
#'
#'   \item{game_name_ver}{Game version name, matching that in the database.}
#'
#'   \item{game_name_en}{English game name, added by researchers (esp. by me).}
#'
#'   \item{game_name_abbr}{English game name abbreviated, added by researchers
#'     (esp. by me).}
#'
#'   \item{game_id_parallel}{Parallel form game id. If no parallel form, this
#'     will be `NA`.}
#' }
"game_info"
