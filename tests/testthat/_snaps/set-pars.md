# set_pars

    Code
      set_pars(new_term("a"), c("b", "a"))
    Condition
      Error:
      ! `value` must be length 1, not 2.

---

    Code
      set_pars(new_term(c("a", "a")), c("b", "a", "c"))
    Condition
      Error:
      ! `value` must be length 1, not 3.

---

    Code
      set_pars(new_term("a"), "")
    Condition
      Error in `chk_pars()`:
      ! `value` must match regular expression '^[[:alpha:]][[:alnum:]._]*$'.

---

    Code
      set_pars(new_term("a"), "1")
    Condition
      Error in `chk_pars()`:
      ! `value` must match regular expression '^[[:alpha:]][[:alnum:]._]*$'.

---

    Code
      set_pars(new_term(rep("a", 7)), value = c("gamma", "theta", "rho"))
    Condition
      Error:
      ! `value` must be length 1, not 3.

# set_pars missing values

    Code
      set_pars(new_term(c("a [ 1]", "b")), c("b", NA))
    Condition
      Error in `set_pars.term()`:
      ! `value` must not have any missing values.

---

    Code
      set_pars(NA_term_, "a")
    Condition
      Error in `set_pars.term()`:
      ! `x` must not have any missing values.

---

    Code
      set_pars(new_term(c("c c", "b")), "a")
    Condition
      Error in `set_pars.term()`:
      ! All elements of term vector `x` must be valid.

# set_pars no values

    Code
      set_pars(term, "c")
    Condition
      Error:
      ! `value` must be length 0, not 1.

