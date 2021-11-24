## code to prepare `config_prep_fun` dataset goes here
config_prep_fun <- jsonlite::read_json(
  "data-raw/config_prep_fun.json",
  simplifyVector = TRUE
)
usethis::use_data(config_prep_fun, overwrite = TRUE)
