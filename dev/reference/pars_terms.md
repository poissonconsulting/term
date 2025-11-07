# Term Parameters

Gets the name of each parameter for each term.

## Usage

``` r
pars_terms(x, scalar = NULL, ...)
```

## Arguments

- x:

  A term vector.

- scalar:

  A flag specifying whether to by default return all parameters (NULL),
  or only scalar parameters (TRUE) or only non-scalar parameters
  (FALSE).

- ...:

  These dots are for future extensions and must be empty.

## Value

A character vector of the term parameter names.

## Details

The scalar argument is **\[defunct\]**.

## See also

Other parameters:
[`pars.character()`](https://poissonconsulting.github.io/term/dev/reference/pars.character.md),
[`pars.default()`](https://poissonconsulting.github.io/term/dev/reference/pars.default.md),
[`pars.term()`](https://poissonconsulting.github.io/term/dev/reference/pars.term.md),
[`pars.term_rcrd()`](https://poissonconsulting.github.io/term/dev/reference/pars.term_rcrd.md)

## Examples

``` r
term <- term(
  "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
  "beta[1,2]", "beta[2,2]", "sigma", NA
)
pars_terms(term)
#> [1] "alpha" "alpha" "beta"  "beta"  "beta"  "beta"  "sigma" NA     
```
