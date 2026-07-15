# npdims.term

    Code
      npdims(new_term(c("alpha[1]", "alpha[3]", "beta[1,1]", "beta[2,1]")), terms = TRUE)
    Condition
      Error in `npdims.term()`:
      ! `...` must be unused.

---

    Code
      npdims(NA_term_)
    Condition
      Error in `npdims.term()`:
      ! `x` must not have any missing values.

