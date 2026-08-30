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

`revdepcheck::revdep_check()` was re-run on 2026-08-30 against both reverse
dependencies, nlist 0.5.0 and mcmcr 0.7.0: 0 new problems, 0 packages failed
to check.

mcmcr 0.6.2, the version previously on CRAN, tested `term::parameters()`,
which this release makes defunct.  Those tests were removed in mcmcr 0.7.0,
which was submitted to CRAN on 2026-08-30.  This release is submitted only
after mcmcr 0.7.0 is accepted, so no reverse dependency is broken.

## Notes

This is a minor release that makes previously deprecated functions and
arguments defunct.  `parameters()`, `parameters<-()`, `set_parameters()`,
`is.term()`, `is.incomplete_terms()`, `is.inconsistent_terms()` and `tdims()`
have warned since 0.1.0 (2020-01-15) and the `terms` argument of `pars()` has
warned since 0.2.0.  They now error via `lifecycle::deprecate_stop()`.
