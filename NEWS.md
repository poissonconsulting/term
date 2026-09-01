<!-- NEWS.md is maintained by https://fledge.cynkra.com, contributors should not edit this file -->

# term 0.4.0.9001

- Internal changes only.


# term 0.4.0.9000

- Switching to development version.


# term 0.4.0

## Breaking changes

* The following functions, deprecated since 0.1.0, are now defunct and error
  when called (#103).

  * `is.term()`, replaced by `is_term()`.
  * `is.incomplete_terms()`, replaced by `is_incomplete_terms()`.
  * `is.inconsistent_terms()`, replaced by `is_inconsistent_terms()`.
  * `parameters()` and `` `parameters<-`() ``, replaced by `pars()` and
    `` `pars<-`() ``.
  * `set_parameters()`, replaced by `set_pars()`.
  * `tdims()`, replaced by `tindex()`.

* The `terms` argument of `pars()`, deprecated since 0.2.0, is now defunct
  (#106). Use `pars_terms(as_term(x))` in place of `pars(x, terms = TRUE)` and
  `pars(x)` in place of `pars(x, terms = FALSE)`.

## New features

* `set_pars()` and `summary()` gain `term_rcrd` methods (#90).

## Bug fixes

* `format()` now escapes backticks embedded in term names so that printed terms
  are unambiguous (#90).

## Minor improvements

* vctrs (>= 0.4.0) is now the declared minimum, as `levels()` is implemented for
  vctrs vectors and the `levels.term()` and `levels.term_rcrd()` workarounds are
  no longer required (#90).

* The purrr dependency is dropped (#103).

* The `pars(scalar = NA)` compatibility hack for nlist 0.1.0 and 0.1.1 is
  removed (#90).

* `as_list()` is imported from extras instead of being copied locally (#90).

* The `complete_terms()` examples for `term_rcrd` objects now run (#90).


# term 0.3.7

- Fix overly zealous check that now fails on R-devel (#91, #92).
- R (\>= 4.1).
- Removed defunct `terms` argument from `npdims()`.
- Moved following from soft to warn deprecated.
  - `as.term()`
  - `term::pars_terms(scalar =)`
  - `term::subset(select =)`
  - `term::term(x =)`


# term 0.3.6

- Require R (\>= 4.0).
- Fixed `chk_s3_class()` reference in documentation that was causing CRAN NOTE.


# term 0.3.5

- Require R (>= 3.5).
- Moved following from soft to warn deprecated
 - `is.term()`
 - `is.incomplete_terms()`
 - `is.inconsistent_terms()`
 - `parameters()`
 - `parameters<-()`
 - `set_parameters()`
 - `tdims()`

# term 0.3.4

- Removed deprecated `default.stringsAsFactors()` from `as.data.frame.term_rcrd`


# term 0.3.3

- Switched order of equality and condition expectations in internal tests.


# term 0.3.2

- Internally replaced `chk::chkor()` with `chk::chkor_vld()`.


# term 0.3.1

- Updated internals for `lifecycle` 1.0.0.


# term 0.3.0

## Breaking changes

- Stop deprecated `terms` argument to `npdims.term()`.
- Warn deprecated `terms` argument to `pars.terms()`.
- `nterms()` now returns total number of terms not just number of unique non-missing terms.
- `is_inconsistent_term()` now returns TRUE if includes missing or invalid terms.

## Features

### Major

- Added `term_rcrd` class to store vector as underlying data frame and implemented some functions.

### Minor 

- Added
  - `unique()`.
  - `summary()`.
  - `anyDuplicated()`.
  - `scalar_term()` to test whether each element in a term vector is scalar.
  - `normalize_terms()`.
  - `normalize` argument to `as_term.character()`.

## Bug Fixes

- Fix `as.term()` so issues deprecation warning.


# term 0.2.0

## Breaking changes

- `is_complete_terms()` now requires same number of duplicate copies.
- `chk_term()` and `vld_term()` argument `validate` now defaults to `"complete"` and `class` value is soft-deprecated.
- Soft deprecated
    - `as.term()` for `as_term()`.
    - `is.term()` for `is_term()`.
    - `is.incomplete_terms()` for `is_incomplete_terms()`.
    - `is.inconsistent_terms()` for `is_inconsistent_terms()`.
    - `pars(x, terms = TRUE)` for `pars_terms(x)`.
    - `subset(select = )` for `subset(pars = )`.
    - `terms` argument of `npdims()`.

## Features

- Redefined `term` as a `vtcr` class with
  - `term()` constructor which treats unnamed arguments as term values and named values as parameters with their associated dimensions.
  - `new_term()` to create term vector from character vector without any check.
  - `vec_cast()` to safely cast character.
- Added `pars(scalar = TRUE)` and `npars(scalar = TRUE)`.
- Added `pars_terms()`.
- Added `scalar_term()` to test if each term element is scalar.

## Internal

- Use extras from CRAN.
- `ndims()` and `dims()` imported from universals and reexported.
- New implementation for `repair_terms()`.


# term 0.1.0

- Added `chk_term()` and `vld_term()`.


# term 0.0.1

- Initial release.
