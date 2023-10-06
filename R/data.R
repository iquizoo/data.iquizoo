#' Game information
#'
#' The basic configurations for all the games supported by IQUIZOO.COM.
#'
#' @format A data frame with 350 rows of the following variables:
#' \describe{
#'
#'   \item{game_id}{Game id, a 64-bit integer.}
#'
#'   \item{game_name}{Game name in Chinese, matching that in the database.}
#'
#'   \item{game_name_ver}{Game version name.}
#'
#'   \item{game_name_en}{English game name.}
#'
#'   \item{game_name_abbr}{English game name abbreviated.}
#'
#'   \item{prep_fun_name}{Name of the preprocessing function.}
#'
#'   \item{input}{Configure input variable names in the raw data.}
#'
#'   \item{extra}{Configure extra special values in the raw data.}
#' }
"game_info"

#' Game indices configuration
#'
#' The recommended indices for all the games supported by IQUIZOO.COM. Note that
#' only one index is recommended for each game and some games are not included
#' with recommended indices.
#'
#' @format A data frame with 260 rows of the following variables:
#' \describe{
#'
#'   \item{game_id}{Game id, a 64-bit integer.}
#'
#'   \item{index_main}{Configure the main index in the raw data.}
#'
#'   \item{index_reverse}{Indicate if the main index score is reversed or not.}
#' }
"game_indices"
