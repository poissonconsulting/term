# Parameter Names

Gets the parameter names.

## Usage

``` r
# S3 method for class 'character'
pars(x, scalar = NULL, ...)
```

## Arguments

- x:

  An object.

- scalar:

  A flag specifying whether to by default return all parameters (NULL),
  or only scalar parameters (TRUE) or only non-scalar parameters
  (FALSE).

- ...:

  Other arguments passed to methods.

## Value

A character vector of the names of the parameters.

## See also

[universals::pars](https://poissonconsulting.github.io/universals/reference/pars.html)

Other parameters:
[`pars.default()`](https://poissonconsulting.github.io/term/dev/reference/pars.default.md),
[`pars.term()`](https://poissonconsulting.github.io/term/dev/reference/pars.term.md),
[`pars.term_rcrd()`](https://poissonconsulting.github.io/term/dev/reference/pars.term_rcrd.md),
[`pars_terms()`](https://poissonconsulting.github.io/term/dev/reference/pars_terms.md)

## Examples

``` r
pars(c("a", "b[1]", "a[3]"))
#> [1] "a" "b"
```
