# nlist

<details>

* Version: 0.1.0
* Source code: https://github.com/cran/nlist
* URL: https://github.com/poissonconsulting/nlist
* BugReports: https://github.com/poissonconsulting/nlist/issues
* Date/Publication: 2020-01-24 17:00:02 UTC
* Number of recursive dependencies: 42

Run `revdep_details(,"nlist")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [90m  5. [39mnlist:::pars.nlist(nlist(x = 1, a = 1:10), terms = TRUE)
      [90m  7. [39mterm:::pars.term(as.term(x), scalar = scalar, terms = terms)
      [90m  8. [39mchk::chk_flag(scalar)
      [90m  9. [39mchk::abort_chk(x_name, " must be a flag (TRUE or FALSE)", x = x)
      [90m 10. [39mchk::err(..., n = n, tidy = tidy, .subclass = "chk_error")
      [90m 11. [39mrlang::exec(abort, msg, .subclass = .subclass, !!!args[named])
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 307 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 3 ]
      1. Error: as.term.nlist (@test-as-term.R#4) 
      2. Error: as.term.nlists (@test-as-term.R#30) 
      3. Error: pars.nlist (@test-pars.R#8) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

