# Match pre-processing parameters

These complex parameters are stored internally, and users must retrieve
them through this function.

## Usage

``` r
merge_preproc(
  games,
  ...,
  filter_only = FALSE,
  rm_tagged = FALSE,
  name_key = "game_id"
)
```

## Arguments

- games:

  A [data.frame](https://rdrr.io/r/base/data.frame.html) contains the
  games to match parameters.

- ...:

  Additional arguments passed to
  [`merge()`](https://rdrr.io/r/base/merge.html).

- filter_only:

  Whether to perform filtering only, i.e., keep only the matched games.

- rm_tagged:

  Whether to remove games with a tagged pre-processing function. Default
  is `FALSE`.

- name_key:

  The name of the column to match the games.

## Value

A [data.frame](https://rdrr.io/r/base/data.frame.html) added
pre-processing parameters. Note if there is no match for a game, the
matched parameters are empty vectors (e.g., `NULL`).
