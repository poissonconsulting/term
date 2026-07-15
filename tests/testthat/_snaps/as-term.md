# as_term.character

    Code
      as_term("a", "b")
    Condition
      Error in `as_term.character()`:
      ! `repair` must be a flag (TRUE or FALSE).

# as_term others

    Code
      as_term(factor(1))
    Condition
      Error in `as_term()`:
      ! Can't convert `x` <factor<de3a9>> to <term>.

---

    Code
      as_term(data.frame(x = 1))
    Condition
      Error in `as_term()`:
      ! Can't convert `x` <data.frame> to <term>.

---

    Code
      as_term(TRUE)
    Condition
      Error in `vec_restore_dispatch()`:
      ! Can't convert <logical> to <term>.

