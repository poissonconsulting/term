# pars.term deprecated terms

    Code
      pars(term("a[1]"), terms = TRUE)
    Condition
      Error:
      ! The `terms` argument of `pars()` was deprecated in term 0.2.0 and is now defunct.

---

    Code
      pars(term("a[1]"), terms = FALSE)
    Condition
      Error:
      ! The `terms` argument of `pars()` was deprecated in term 0.2.0 and is now defunct.

# pars defunct terms reports the same for every input type

    Code
      pars(c("a[1]"), terms = TRUE)
    Condition
      Error:
      ! The `terms` argument of `pars()` was deprecated in term 0.2.0 and is now defunct.

---

    Code
      pars(as_term_rcrd(term("a[1]")), terms = TRUE)
    Condition
      Error:
      ! The `terms` argument of `pars()` was deprecated in term 0.2.0 and is now defunct.

---

    Code
      pars(matrix(1:4, nrow = 2), terms = TRUE)
    Condition
      Error:
      ! The `terms` argument of `pars()` was deprecated in term 0.2.0 and is now defunct.

# pars still rejects other unused arguments

    Code
      pars(c("a[1]"), nope = TRUE)
    Condition
      Error in `pars.character()`:
      ! `...` must be unused.

---

    Code
      pars(as_term_rcrd(term("a[1]")), nope = TRUE)
    Condition
      Error in `pars.term_rcrd()`:
      ! `...` must be unused.

