# Parameter Names

Gets the parameter names.

## Usage

``` r
# S3 method for class 'term'
pars(x, scalar = NULL, terms = FALSE, ...)
```

## Arguments

- x:

  An object.

- scalar:

  A flag specifying whether to by default return all parameters (NULL),
  or only scalar parameters (TRUE) or only non-scalar parameters
  (FALSE).

- terms:

  A flag specifying whether to return the parameter name for each term
  element.

- ...:

  Other arguments passed to methods.

## Value

A character vector of the names of the parameters.

## See also

[universals::pars](https://poissonconsulting.github.io/universals/reference/pars.html)

Other parameters:
[`pars.character()`](https://poissonconsulting.github.io/term/reference/pars.character.md),
[`pars.default()`](https://poissonconsulting.github.io/term/reference/pars.default.md),
[`pars.term_rcrd()`](https://poissonconsulting.github.io/term/reference/pars.term_rcrd.md),
[`pars_terms()`](https://poissonconsulting.github.io/term/reference/pars_terms.md)

## Examples

``` r
term <- term(
  "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
  "beta[1,2]", "beta[2,2]", "sigma", NA
)
pars(term)
#> [1] "alpha" "beta"  "sigma" NA     
pars(term, scalar = TRUE)
#> [1] "sigma" NA     
pars(term, scalar = FALSE)
#> [1] "alpha" "beta"  NA     
```
