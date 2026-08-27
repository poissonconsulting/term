# mcmcr (0.6.2)

* GitHub: <https://github.com/poissonconsulting/mcmcr>
* Email: <mailto:joe@poissonconsulting.ca>
* GitHub mirror: <https://github.com/cran/mcmcr>

Run `revdepcheck::revdep_details(, "mcmcr")` for more info

## Newly broken

*   checking tests ...
     ```
       Running ‘testthat.R’
      ERROR
     Running the tests in ‘tests/testthat.R’ failed.
     Last 13 lines of output:
         2. │ └─testthat::expect_warning(...)
         3. │   └─testthat:::expect_condition_matching_(...)
         4. │     └─testthat:::quasi_capture(...)
         5. │       ├─testthat (local) .capture(...)
         6. │       │ └─base::withCallingHandlers(...)
         7. │       └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
         8. └─term::parameters(mcmcrs)
         9.   └─lifecycle::deprecate_stop("0.1.0", what = "parameters()", with = "pars()")
        10.     └─lifecycle:::deprecate_stop0(msg)
        11.       └─rlang::cnd_signal(...)
       
       [ FAIL 2 | WARN 0 | SKIP 3 | PASS 426 ]
       Error:
       ! Test failures.
       Execution halted
     ```

