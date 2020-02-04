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
