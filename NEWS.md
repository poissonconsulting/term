# term 0.2.0

## Breaking changes

- `is_complete_terms()` now requires same number of duplicate copies.
- `chk_term()` and `vld_term()` argument `validate` now defaults to `"complete"`.
- Soft deprecated
    - `pars(x, terms = TRUE)` for `pars_terms(x)`.
    - `terms` argument of `npdims()`.
    - `subset(select = )` for `subset(pars = )`.
    - `is.term()` for `is_term()`.
    - `is.inconsistent_terms()` for `is_inconsistent_terms()`.
    - `is.incomplete_terms()` for `is_incomplete_terms()`.

## Features

- Added `pars(scalar = TRUE)` and `npars(scalar = TRUE)`.
- Added `vld_pars()` to validate parameter names.
- Added `scalar_term()` to test if each term element is scalar.
- Added `pars_terms()`.
- Redefined `term` as a `vtcr` class with
  - `term()` constructor which treats unnamed arguments as term values and named values as parameters with their associated dimensions.
  - `new_term()` to create term vector from character vector without any check.
  - `vec_cast()` to safely cast character.

## Internal

- Use extras from CRAN.
- `ndims()` and `dims()` imported from universals.
- New implementation for `repair_terms()`.


# term 0.1.0

- Added `chk_term()` and `vld_term()`.

# term 0.0.1

- Initial release.
