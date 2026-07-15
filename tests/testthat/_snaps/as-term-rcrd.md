# as_term_rcrd.character

    Code
      as_term_rcrd("a", "b")
    Condition
      Error in `as_term.character()`:
      ! `repair` must be a flag (TRUE or FALSE).

# as_term_rcrd others

    Code
      as_term_rcrd(factor(1))
    Condition
      Error in `as_term_rcrd()`:
      ! Can't convert `x` <factor<de3a9>> to <term_rcrd>.

---

    Code
      as_term_rcrd(data.frame(x = 1))
    Condition
      Error in `as_term_rcrd()`:
      ! Can't convert `x` <data.frame> to <term_rcrd>.

---

    Code
      as_term_rcrd(TRUE)
    Condition
      Error in `as_term_rcrd()`:
      ! Can't convert `x` <logical> to <term_rcrd>.

