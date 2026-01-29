# Changelog

## term 0.3.7

- Fix overly zealous check that now fails on R-devel
  ([\#91](https://github.com/poissonconsulting/term/issues/91),
  [\#92](https://github.com/poissonconsulting/term/issues/92)).
- R (\>= 4.1).
- Removed defunct `terms` argument from
  [`npdims()`](https://poissonconsulting.github.io/universals/reference/npdims.html).
- Moved following from soft to warn deprecated.
  - [`as.term()`](https://poissonconsulting.github.io/term/reference/as_term.md)
  - `term::pars_terms(scalar =)`
  - `term::subset(select =)`
  - `term::term(x =)`

## term 0.3.6

CRAN release: 2025-01-21

- Require R (\>= 4.0).
- Fixed `chk_s3_class()` reference in documentation that was causing
  CRAN NOTE.

## term 0.3.5

CRAN release: 2022-09-29

- Require R (\>= 3.5).
- Moved following from soft to warn deprecated
- [`is.term()`](https://poissonconsulting.github.io/term/reference/deprecated.md)
- [`is.incomplete_terms()`](https://poissonconsulting.github.io/term/reference/deprecated.md)
- [`is.inconsistent_terms()`](https://poissonconsulting.github.io/term/reference/deprecated.md)
- [`parameters()`](https://poissonconsulting.github.io/term/reference/deprecated.md)
- `parameters<-()`
- [`set_parameters()`](https://poissonconsulting.github.io/term/reference/deprecated.md)
- [`tdims()`](https://poissonconsulting.github.io/term/reference/deprecated.md)

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
  [`npdims.term()`](https://poissonconsulting.github.io/term/reference/npdims.term.md).
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
  - [`scalar_term()`](https://poissonconsulting.github.io/term/reference/scalar_term.md)
    to test whether each element in a term vector is scalar.
  - [`normalize_terms()`](https://poissonconsulting.github.io/term/reference/normalize_terms.md).
  - `normalize` argument to
    [`as_term.character()`](https://poissonconsulting.github.io/term/reference/as_term.md).

### Bug Fixes

- Fix
  [`as.term()`](https://poissonconsulting.github.io/term/reference/as_term.md)
  so issues deprecation warning.

## term 0.2.0

CRAN release: 2020-06-20

### Breaking changes

- `is_complete_terms()` now requires same number of duplicate copies.
- [`chk_term()`](https://poissonconsulting.github.io/term/reference/chk_term.md)
  and
  [`vld_term()`](https://poissonconsulting.github.io/term/reference/vld_term.md)
  argument `validate` now defaults to `"complete"` and `class` value is
  soft-deprecated.
- Soft deprecated
  - [`as.term()`](https://poissonconsulting.github.io/term/reference/as_term.md)
    for
    [`as_term()`](https://poissonconsulting.github.io/term/reference/as_term.md).
  - [`is.term()`](https://poissonconsulting.github.io/term/reference/deprecated.md)
    for
    [`is_term()`](https://poissonconsulting.github.io/term/reference/is_term.md).
  - [`is.incomplete_terms()`](https://poissonconsulting.github.io/term/reference/deprecated.md)
    for
    [`is_incomplete_terms()`](https://poissonconsulting.github.io/term/reference/is_incomplete_terms.md).
  - [`is.inconsistent_terms()`](https://poissonconsulting.github.io/term/reference/deprecated.md)
    for
    [`is_inconsistent_terms()`](https://poissonconsulting.github.io/term/reference/is_inconsistent_terms.md).
  - `pars(x, terms = TRUE)` for `pars_terms(x)`.
  - `subset(select = )` for `subset(pars = )`.
  - `terms` argument of
    [`npdims()`](https://poissonconsulting.github.io/universals/reference/npdims.html).

### Features

- Redefined `term` as a `vtcr` class with
  - [`term()`](https://poissonconsulting.github.io/term/reference/term.md)
    constructor which treats unnamed arguments as term values and named
    values as parameters with their associated dimensions.
  - [`new_term()`](https://poissonconsulting.github.io/term/reference/new_term.md)
    to create term vector from character vector without any check.
  - [`vec_cast()`](https://vctrs.r-lib.org/reference/vec_cast.html) to
    safely cast character.
- Added `pars(scalar = TRUE)` and `npars(scalar = TRUE)`.
- Added
  [`pars_terms()`](https://poissonconsulting.github.io/term/reference/pars_terms.md).
- Added
  [`scalar_term()`](https://poissonconsulting.github.io/term/reference/scalar_term.md)
  to test if each term element is scalar.

### Internal

- Use extras from CRAN.
- [`ndims()`](https://poissonconsulting.github.io/universals/reference/ndims.html)
  and
  [`dims()`](https://poissonconsulting.github.io/universals/reference/dims.html)
  imported from universals and reexported.
- New implementation for
  [`repair_terms()`](https://poissonconsulting.github.io/term/reference/repair_terms.md).

## term 0.1.0

CRAN release: 2020-01-15

- Added
  [`chk_term()`](https://poissonconsulting.github.io/term/reference/chk_term.md)
  and
  [`vld_term()`](https://poissonconsulting.github.io/term/reference/vld_term.md).

## term 0.0.1

CRAN release: 2019-12-15

- Initial release.
