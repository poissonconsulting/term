# subset.term

    Code
      subset(term, "beta")
    Condition
      Error in `subset.term()`:
      ! `pars` must match 'alpha' or 'sigma', not 'beta'.

---

    Code
      subset(term, "tt")
    Condition
      Error in `subset.term()`:
      ! `pars` must match 'alpha', 'beta' or 'sigma', not 'tt'.

# subset.term_rcrd

    Code
      subset(term_rcrd, "beta")
    Condition
      Error in `subset.term_rcrd()`:
      ! `pars` must match 'alpha' or 'sigma', not 'beta'.

---

    Code
      subset(term_rcrd, "tt")
    Condition
      Error in `subset.term_rcrd()`:
      ! `pars` must match 'alpha', 'beta' or 'sigma', not 'tt'.

# subset.term missing values

    Code
      subset(NA_term_)
    Condition
      Error in `subset.term()`:
      ! `x` must not have any missing values.

---

    Code
      subset(c(NA_term_, new_term("a")))
    Condition
      Error in `subset.term()`:
      ! `x` must not have any missing values.

