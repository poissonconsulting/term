# npars.term invalid elements

    Code
      out <- npars(new_term(c("a[2]", "b c")))
    Condition
      Warning in `lapply()`:
      NAs introduced by coercion

# npars.term scalar invalid elements

    Code
      out <- npars(new_term(c("a[2]", "b c")), scalar = TRUE)
    Condition
      Warning in `lapply()`:
      NAs introduced by coercion

