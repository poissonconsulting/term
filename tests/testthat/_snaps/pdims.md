# pdims

    Code
      pdims(new_term(c("alpha[3]", "beta[2,1]", "alpha[10,]")))
    Condition
      Error:
      ! `x` must have terms with consistent parameter dimensions.

# pdims missing value

    Code
      pdims(NA_term_)
    Condition
      Error:
      ! `x` must not have any missing values.

---

    Code
      pdims(new_term(c("alpha[3]", "beta[2,1]", NA)))
    Condition
      Error:
      ! `x` must not have any missing values.

# pdims inconsistent

    Code
      pdims(new_term(c("alpha[1]", "alpha[1,1]")))
    Condition
      Error:
      ! `x` must have terms with consistent parameter dimensions.

