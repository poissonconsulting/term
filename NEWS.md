# term 0.2.0

- Same as previous version.


# term 0.1.0.9007

- Use extras from CRAN.

# term 0.1.0.9006

- Replace `pars_scalar()` and `npars_scalar()` with `pars(scalar = TRUE)` and `npars(scalar = TRUE)`.
- `is_complete_terms()` now requires same number of duplicate copies.
- Added `pars_scalar()`.
- Added `vld_pars()` to validate parameter names.
- Soft deprecated `subset(select = )` for `subset(pars = )`.
- Soft deprecated `is.term()` or `is_term()`.
- `chk_term()` and `vld_term()` argument `validate` now 'complete'.
- Added `scalar_term()` to test if each term element is scalar.
- Added `pars_terms()`.

# term 0.1.0.9005

- Redefined `term` as a `vtcr` class with
  - `term()` constructor which treats unnamed arguments as term values and named values as parameters with their associated dimensions.
  - `new_term()` to create term vector from character vector without any check.
  - `vec_cast()` to safely cast character.
- Modified
    - `repair_terms()` 
    - `is_complete_terms()` so now requires same number of duplicate copies.
- Added 
  - `pars_scalar()`
  - `npars_scalar()`.
- Soft deprecated
    - `pars(x, terms = TRUE)` for `pars_terms(x)`.
    - `terms` argument of `npdims()`.
    - `pars(scalar =)`  for `pars_scalar()`. 
    - `npars(scalar =)` for `npars_scalar()`.
    - `subset(select = )` for `subset(pars = )`.
    - `is.term()` for `is_term()`.
    - `is.inconsistent_terms()` for `is_inconsistent_terms()`.
    - `is.incomplete_terms()` for `is_incomplete_terms()`.
    - `validate = 'class'` for `chk_term()` and `vld_term()` for `validate = 'complete'`.
- Migrated
    - `ndims()` to extras package.
    - `dims()` to extras package.  

# term 0.1.0

- Added `chk_term()` and `vld_term()`.

# term 0.0.1

- Initial release.
