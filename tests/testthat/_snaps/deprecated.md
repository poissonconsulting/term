# deprecated functions error

    Code
      is.term(1)
    Condition
      Error:
      ! `is.term()` was deprecated in term 0.1.0 and is now defunct.
      i Please use `is_term()` instead.

---

    Code
      is.incomplete_terms(term("a[1]"))
    Condition
      Error:
      ! `is.incomplete_terms()` was deprecated in term 0.1.0 and is now defunct.
      i Please use `is_incomplete_terms()` instead.

---

    Code
      is.inconsistent_terms(term("a[1]"))
    Condition
      Error:
      ! `is.inconsistent_terms()` was deprecated in term 0.1.0 and is now defunct.
      i Please use `is_inconsistent_terms()` instead.

---

    Code
      parameters(term("a[1]"))
    Condition
      Error:
      ! `parameters()` was deprecated in term 0.1.0 and is now defunct.
      i Please use `pars()` instead.

---

    Code
      x <- term("a[1]")
      parameters(x) <- "b"
    Condition
      Error:
      ! `parameters<-()` was deprecated in term 0.1.0 and is now defunct.
      i Please use `pars<-()` instead.

---

    Code
      set_parameters(term("a[1]"), "b")
    Condition
      Error:
      ! `set_parameters()` was deprecated in term 0.1.0 and is now defunct.
      i Please use `set_pars()` instead.

---

    Code
      tdims(term("a[1]"))
    Condition
      Error:
      ! `tdims()` was deprecated in term 0.1.0 and is now defunct.
      i Please use `tindex()` instead.

