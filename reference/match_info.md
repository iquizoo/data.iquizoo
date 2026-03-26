# Match specific piece of information of games

Match specific piece of information of games

## Usage

``` r
match_info(x, to, from = "game_id", fail_on_missing = TRUE)
```

## Arguments

- x:

  The known information of games.

- to:

  The name of the column of the information to be matched.

- from:

  The name of the column of the known information.

- fail_on_missing:

  Whether to stop if some of the information is not matched.

## Value

The matched information.
