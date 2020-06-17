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
      [34mℹ[39m See <https://vctrs.r-lib.org/reference/faq-error-incompatible-attributes.html>.
      [1mBacktrace:[22m
      [90m  1. [39mtestthat::expect_identical(...)
      [90m 11. [39mvctrs::vec_default_ptype2(...)
      [90m 12. [39mvctrs::stop_incompatible_type(...)
      [90m 13. [39mvctrs:::stop_incompatible(...)
      [90m 14. [39mvctrs:::stop_vctrs(...)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      [ OK: 308 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 2 ]
      1. Error: as.term.nlist (@test-as-term.R#4) 
      2. Error: as.term.nlists (@test-as-term.R#30) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

