# Changelog

## term 0.3.6.9002

### Continuous integration

- Fix reviewdog and add commenting workflow
  ([\#83](https://github.com/poissonconsulting/term/issues/83)).

## term 0.3.6.9001

### Chore

- Auto-update from GitHub Actions.

  Run:
  <https://github.com/poissonconsulting/term/actions/runs/17450799800>

### Continuous integration

- Use workflows for fledge
  ([\#82](https://github.com/poissonconsulting/term/issues/82)).

- Sync ([\#81](https://github.com/poissonconsulting/term/issues/81)).

- Use reviewdog for external PRs
  ([\#80](https://github.com/poissonconsulting/term/issues/80)).

- Cleanup and fix macOS
  ([\#79](https://github.com/poissonconsulting/term/issues/79)).

- Format with air, check detritus, better handling of `extra-packages`
  ([\#78](https://github.com/poissonconsulting/term/issues/78)).

- Enhance permissions for workflow
  ([\#77](https://github.com/poissonconsulting/term/issues/77)).

- Permissions, better tests for missing suggests, lints
  ([\#76](https://github.com/poissonconsulting/term/issues/76)).

- Only fail covr builds if token is given
  ([\#75](https://github.com/poissonconsulting/term/issues/75)).

- Always use `_R_CHECK_FORCE_SUGGESTS_=false`
  ([\#74](https://github.com/poissonconsulting/term/issues/74)).

- Correct installation of xml2
  ([\#73](https://github.com/poissonconsulting/term/issues/73)).

- Explain ([\#72](https://github.com/poissonconsulting/term/issues/72)).

- Add xml2 for covr, print testthat results
  ([\#71](https://github.com/poissonconsulting/term/issues/71)).

- Fix ([\#70](https://github.com/poissonconsulting/term/issues/70)).

- Sync ([\#69](https://github.com/poissonconsulting/term/issues/69)).

## term 0.3.6.9000

### fledge

- CRAN release v0.3.6
  ([\#68](https://github.com/poissonconsulting/term/issues/68)).

## term 0.3.6

CRAN release: 2025-01-21

- Require R (\>= 4.0).
- Fixed `chk_s3_class()` reference in documentation that was causing
  CRAN NOTE.

## term 0.3.5

CRAN release: 2022-09-29

- Require R (\>= 3.5).
- Moved following from soft to warn deprecated
- [`is.term()`](https://poissonconsulting.github.io/term/dev/reference/deprecated.md)
- [`is.incomplete_terms()`](https://poissonconsulting.github.io/term/dev/reference/deprecated.md)
- [`is.inconsistent_terms()`](https://poissonconsulting.github.io/term/dev/reference/deprecated.md)
- [`parameters()`](https://poissonconsulting.github.io/term/dev/reference/deprecated.md)
- `parameters<-()`
- [`set_parameters()`](https://poissonconsulting.github.io/term/dev/reference/deprecated.md)
- [`tdims()`](https://poissonconsulting.github.io/term/dev/reference/deprecated.md)

## term 0.3.4

CRAN release: 2022-03-03

- Removed deprecated
  [`default.stringsAsFactors()`](https://rdrr.io/r/base/base-defunct.html)
  from `as.data.frame.term_rcrd`

## term 0.3.3

CRAN release: 2021-09-28

- Switched order of equality and condition expectations in internal
  tests.

## term 0.3.2

CRAN release: 2021-09-06

- Internally replaced
  [`chk::chkor()`](https://poissonconsulting.github.io/chk/reference/chkor.html)
  with
  [`chk::chkor_vld()`](https://poissonconsulting.github.io/chk/reference/chkor_vld.html).

## term 0.3.1

CRAN release: 2021-02-06

- Updated internals for `lifecycle` 1.0.0.

## term 0.3.0

CRAN release: 2020-09-25

### Breaking changes

- Stop deprecated `terms` argument to
  [`npdims.term()`](https://poissonconsulting.github.io/term/dev/reference/npdims.term.md).
- Warn deprecated `terms` argument to `pars.terms()`.
- [`nterms()`](https://poissonconsulting.github.io/universals/reference/nterms.html)
  now returns total number of terms not just number of unique
  non-missing terms.
- `is_inconsistent_term()` now returns TRUE if includes missing or
  invalid terms.

### Features

#### Major

- Added `term_rcrd` class to store vector as underlying data frame and
  implemented some functions.

#### Minor

- Added
  - [`unique()`](https://rdrr.io/r/base/unique.html).
  - [`summary()`](https://rdrr.io/r/base/summary.html).
  - [`anyDuplicated()`](https://rdrr.io/r/base/duplicated.html).
  - [`scalar_term()`](https://poissonconsulting.github.io/term/dev/reference/scalar_term.md)
    to test whether each element in a term vector is scalar.
  - [`normalize_terms()`](https://poissonconsulting.github.io/term/dev/reference/normalize_terms.md).
  - `normalize` argument to
    [`as_term.character()`](https://poissonconsulting.github.io/term/dev/reference/as_term.md).

### Bug Fixes

- Fix
  [`as.term()`](https://poissonconsulting.github.io/term/dev/reference/as_term.md)
  so issues deprecation warning.

## term 0.2.0

CRAN release: 2020-06-20

### Breaking changes

- `is_complete_terms()` now requires same number of duplicate copies.
- [`chk_term()`](https://poissonconsulting.github.io/term/dev/reference/chk_term.md)
  and
  [`vld_term()`](https://poissonconsulting.github.io/term/dev/reference/vld_term.md)
  argument `validate` now defaults to `"complete"` and `class` value is
  soft-deprecated.
- Soft deprecated
  - [`as.term()`](https://poissonconsulting.github.io/term/dev/reference/as_term.md)
    for
    [`as_term()`](https://poissonconsulting.github.io/term/dev/reference/as_term.md).
  - [`is.term()`](https://poissonconsulting.github.io/term/dev/reference/deprecated.md)
    for
    [`is_term()`](https://poissonconsulting.github.io/term/dev/reference/is_term.md).
  - [`is.incomplete_terms()`](https://poissonconsulting.github.io/term/dev/reference/deprecated.md)
    for
    [`is_incomplete_terms()`](https://poissonconsulting.github.io/term/dev/reference/is_incomplete_terms.md).
  - [`is.inconsistent_terms()`](https://poissonconsulting.github.io/term/dev/reference/deprecated.md)
    for
    [`is_inconsistent_terms()`](https://poissonconsulting.github.io/term/dev/reference/is_inconsistent_terms.md).
  - `pars(x, terms = TRUE)` for `pars_terms(x)`.
  - `subset(select = )` for `subset(pars = )`.
  - `terms` argument of
    [`npdims()`](https://poissonconsulting.github.io/universals/reference/npdims.html).

### Features

- Redefined `term` as a `vtcr` class with
  - [`term()`](https://poissonconsulting.github.io/term/dev/reference/term.md)
    constructor which treats unnamed arguments as term values and named
    values as parameters with their associated dimensions.
  - [`new_term()`](https://poissonconsulting.github.io/term/dev/reference/new_term.md)
    to create term vector from character vector without any check.
  - [`vec_cast()`](https://vctrs.r-lib.org/reference/vec_cast.html) to
    safely cast character.
- Added `pars(scalar = TRUE)` and `npars(scalar = TRUE)`.
- Added
  [`pars_terms()`](https://poissonconsulting.github.io/term/dev/reference/pars_terms.md).
- Added
  [`scalar_term()`](https://poissonconsulting.github.io/term/dev/reference/scalar_term.md)
  to test if each term element is scalar.

### Internal

- Use extras from CRAN.
- [`ndims()`](https://poissonconsulting.github.io/universals/reference/ndims.html)
  and
  [`dims()`](https://poissonconsulting.github.io/universals/reference/dims.html)
  imported from universals and reexported.
- New implementation for
  [`repair_terms()`](https://poissonconsulting.github.io/term/dev/reference/repair_terms.md).

## term 0.1.0

CRAN release: 2020-01-15

- Added
  [`chk_term()`](https://poissonconsulting.github.io/term/dev/reference/chk_term.md)
  and
  [`vld_term()`](https://poissonconsulting.github.io/term/dev/reference/vld_term.md).

## term 0.0.1

CRAN release: 2019-12-15

- Initial release.
