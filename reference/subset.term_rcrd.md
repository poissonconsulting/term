# Subset Term Record

Subsets a term_rcrd.

## Usage

``` r
# S3 method for class 'term_rcrd'
subset(x, pars = NULL, ...)
```

## Arguments

- x:

  The object.

- pars:

  A character vector of parameter names.

- ...:

  These dots are for future extensions and must be empty.

## Value

The modified term vector.

## See also

[`term_rcrd_object()`](https://poissonconsulting.github.io/term/reference/term_rcrd.md)

## Examples

``` r
term_rcrd <- term_rcrd(
  "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
  "beta[1,2]", "beta[2,2]", "sigma"
)
if (FALSE) { # \dontrun{
subset(term_rcrd, "beta")
subset(term_rcrd, c("alpha", "sigma"))
} # }
```
