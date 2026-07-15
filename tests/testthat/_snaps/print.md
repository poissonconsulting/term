# print term

    Code
      term()
    Output
      <term[0]>
    Code
      term(alpha = 2, beta = c(2, 2), "sigma")
    Output
      <term[7]>
      [1] alpha[1]  alpha[2]  beta[1,1] beta[2,1] beta[1,2] beta[2,2] sigma    
    Code
      term("alpha[1]", "sigma", "alpha[2]", "beta[1,1]", "beta[2,1]", "beta[1,2]",
        "beta[2,2]")
    Output
      <term[7]>
      [1] alpha[1]  sigma     alpha[2]  beta[1,1] beta[2,1] beta[1,2] beta[2,2]
    Code
      new_term(c("with space", ""))
    Output
      <term[2]>
      [1] `with space` ``          
    Code
      term("r  [ 1  ,2  ]")
    Output
      <term[1]>
      [1] r[1,2]

---

    Code
      term("r[")
    Condition
      Error in `term_impl()`:
      ! All elements of term vector `string_args_term` must be valid.

# print term_rcrd

    Code
      new_term_rcrd()
    Output
      <term_rcrd[0]>
    Code
      as_term_rcrd(term(alpha = 2, beta = c(2, 2), "sigma"))
    Output
      <term_rcrd[7]>
      [1] alpha[1]  alpha[2]  beta[1,1] beta[2,1] beta[1,2] beta[2,2] sigma    

