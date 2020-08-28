# term 0.2.0.9004

- Added `is.na.term_rcrd()`.


# term 0.2.0.9003

- Added `complete_terms.term_rcrd()`.
- Added `dims.term_rcrd()`
- Added `term_rcrd` class.
- Added `summary()` for term object.
- Added `anyDuplicated()` for term and term_rcrd objects.


# term 0.2.0.9002

- `nterms()` now returns total number of terms not just number of unique non-missing terms.
- Added `unique()` for term and term_rcrd object.
- Just deprecate `pars(terms=)`.
- Added `rep.term_rcrd()`.
- `is_inconsistent_term()` returns TRUE if includes missing or invalid terms and add pdims.term_rcrd().
- Added `nterms.term_rcrd()` and `anyNA.term_rcrd()`.
- Defunct terms argument to `npdims.term()`.
- `consistent_term()` now also does `term_rcrd` objects.
- Added `pars()` for `term_rcrd` object.
- Added `scalar_term()` to identify scalar terms.
- Added `subset.term_rcrd()`.
- `pars_terms()` now handles `term_rcrd` objects.
- Deprecated scalar argument.
- Implement `tindex()` for `term_rcrd` as well as `term` objects.
- Added `term_rcrd()`.
- Added normalize argument to `as_term()`.
- Added `normalize_terms()`.
- Added `as_term_rcrd()` and `is_term_rcrd()`.


# term 0.2.0.9001

- Support `rbind()` for data frames with term objects (#40).
- Fix `as.term()` so issues deprecated warning.


# term 0.2.0.9000

- Same as previous version.


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
