# data.iquizoo 2024.03.31-1

* Removed `screen_indices()` function.
* Now dplyr is not required in the package.

# data.iquizoo 2024.03.31

* Let missing values in `game_name_ver` column of `game_info` be empty strings (`""`).

# data.iquizoo 2024.03.29-1

* Add `fail_on_missing` to `match_info()` to control whether to fail when found unmatched ids.

# data.iquizoo 2024.03.29

* Use `memory_score` index for DRM task.

# data.iquizoo 2024.03.28

* Added recent new games without any further names.

# data.iquizoo 2024.02.23

* Enhanced parameters for `match_info()`.

# data.iquizoo 2024.02.03-1

* Fixed pre-processing functions for one newly added game.

# data.iquizoo 2024.02.03

* Added tasks used in recent training.

# data.iquizoo 2024.01.23

* Added `screen_indices()` to screen out unused indices.

# data.iquizoo 2024.01.22

* Added `match_info()` to extract different pieces of game information.

# data.iquizoo 2023.12.08

* Support tagging specific pre-processing functions. When a pre-processing function is tagged, it signals that it is experimental and may not work as expected. This is useful for newly developed pre-processing functions.
* Add `rm_tagged` argument in `match_preproc()` to remove tagged pre-processing functions.

# data.iquizoo 2023.11.04

* Support `type` argument in `match_preproc()` to specify which type of join to use.

# data.iquizoo 2023.11.03

* Added `game_id_parallel` to track parallel forms of games.

# data.iquizoo 2023.10.29

* Added preprocessing function for creativity related tasks.
* Added preprocessing function for category retrieval fluency tasks.
* Supported multiple main indices.

# data.iquizoo 2023.10.22

* Moved `prep_fun` column just after the `game_id` in the results calling `match_preproc()`.

# data.iquizoo 2023.10.22

## Breaking Changes

* Removed `prep_fun_name`, `input` and `extra` columns from `game_info` table.
* Added `match_preproc()` function to match pre-processing parameters for games.

# data.iquizoo 2023.10.06

* Split `game_info` into two tables: `game_info` and `game_indices`.

# data.iquizoo 2023.10.05-1

* Correct the name and type of last added column.

# data.iquizoo 2023.10.05

* Added a new column to indicate whether the main index is reversed or not.

# data.iquizoo 2023.10.04

* Added a new column to set the name of the one main index for each task.

# data.iquizoo 2023.10.03

* Fix `prep_fun_name` for QA version of Face Name task. Now it uses `preproc.iquizoo::countcorrect()`.

# data.iquizoo 2023.07.19

* Fixed wrong names for Stroop and Birds tasks.

# data.iquizoo 2023.07.18

* Supported short version tasks.

# data.iquizoo 2023.05.09

* Added mainly `"Remote Association Test"` task.
* Added some other movie related tasks.
* Added other miscellanous tasks.

# data.iquizoo 2023.03.29

* Added `"Sleepiness"` task.

# data.iquizoo 2023.03.25

* Corrected several info after online updating.
* Used `preproc.iquizoo::capacity()` for visual arrays tasks.

# data.iquizoo 2023.03.14

* Added back visual memory study.

# data.iquizoo 2023.03.04

* Fixed broken raw data for several games.
* Correct name for "Reading" task.

# data.iquizoo 2023.03.03

* Removed one game for there will be no data storage for it.
* Added preprocessing function name to several newly added games.

# data.iquizoo 2023.02.27

* Changed version to `YYYY.MM.DD` format. This will make the version number more informative about the release date.
* Added more recently developed games.

# data.iquizoo 0.3.1

* Changed version name to `game_name_ver`.

# data.iquizoo 0.3.0

* Support `VersionName` update with a new column named `"version_name"` in `game_info` table.

# data.iquizoo 0.2.1

* Added more games.

# data.iquizoo 0.2.0

## Breaking Changes

* Changed `game_id` class to `bit64::integer64`. This is the default class of the values fetched from database for these values.

## Misc

* Updated `game_info` to the newest version.

# data.iquizoo 0.1.2

* Update `prep_fun_name` for two games: RAPM and AntiSac.
* Fix `extra` for all n-back games.

# data.iquizoo 0.1.1

* Store `input` and `extra` as strings by `rlang::expr_text()`.

# data.iquizoo 0.1.0

## Breaking Changes

* Remove obsolete data `config_prep_fun` and merged its info to `game_info`. Basically, `input` and `extra` can be configured there.

# data.iquizoo 0.0.14

* add a temporary game SchulteGrid(research)

# data.iquizoo 0.0.13

* Updated `game_id` column in `game_info` data to numeric values only.

# data.iquizoo 0.0.12

* Use `reinf()` for reinforcement learning tests.
* Added more tests.

# data.iquizoo 0.0.11

* Modified the english names of some tests to reduce conflicts.

# data.iquizoo 0.0.10

* Use `preproc.iquizoo::span()` for location memory.

# data.iquizoo 0.0.9

* Use `preproc.iquizoo::countcorrect2()` for directed search.

# data.iquizoo 0.0.8

* Mapped to new pre-processing functions for newly developed tests.

# data.iquizoo 0.0.7

* Corrected a game name typo.

# data.iquizoo 0.0.6

* Rename "Dual 1-back" to "Dual 2-back" for the design change.

# data.iquizoo 0.0.5

* Added the latest completed games.

# data.iquizoo 0.0.4

* Corrected abbreviated name for multiple object tracking game.

# data.iquizoo 0.0.3

* Added `config_prep_fun` as a default and example configuration of pre-processing functions.

# data.iquizoo 0.0.2

* Updated `game_info` to keep up with the latest development.

# data.iquizoo 0.0.1

# data.iquizoo 0.0.0.9000

* Added a `NEWS.md` file to track changes to the package.
* Added `game_info` dataset to store correponding pre-processing functions for games.
