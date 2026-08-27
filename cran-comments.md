term 0.4.0

## Cran Repository Policy

- [x] Reviewed CRP last edited 2026-07-27.

## Test environments

- local macOS 26.5.1, R 4.6.1
- GitHub Actions: macOS (release), Windows (release), Ubuntu (devel, release, oldrel-1)
- win-builder (devel)

## R CMD check results

0 errors | 0 warnings | 0 notes

## Reverse dependencies

`revdepcheck::revdep_check()` was run against both reverse dependencies on
CRAN: nlist 0.4.0 and mcmcr 0.6.2.

- nlist 0.4.0: OK
- mcmcr 0.6.2: 1 newly broken

mcmcr 0.6.2 tests `term::parameters()`, which this release makes defunct.
Those tests have been removed upstream and mcmcr will be submitted to CRAN
before this release.

## Notes

This is a minor release that makes previously deprecated functions and
arguments defunct.  `parameters()`, `parameters<-()`, `set_parameters()`,
`is.term()`, `is.incomplete_terms()`, `is.inconsistent_terms()` and `tdims()`
have warned since 0.1.0 (2020-01-15) and the `terms` argument of `pars()` has
warned since 0.2.1.  They now error via `lifecycle::deprecate_stop()`.
