# Game information

The alternative names for all the games supported by IQUIZOO.COM.

## Usage

``` r
game_info
```

## Format

A data frame with 350 rows of the following variables:

- game_id:

  Game id, a 64-bit integer.

- game_name:

  Game name in Chinese, matching that in the database.

- game_name_ver:

  Game version name, matching that in the database.

- game_name_en:

  English game name, added by researchers (esp. by me).

- game_name_abbr:

  English game name abbreviated, added by researchers (esp. by me).

- game_id_parallel:

  Parallel form game id. If no parallel form, this will be `NA`.
