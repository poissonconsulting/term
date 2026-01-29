# Consistent Terms

Test whether the number of dimensions of terms in the same parameter are
consistent.

## Usage

``` r
consistent_term(x)
```

## Arguments

- x:

  The object.

## Value

A logical vector indicating whether the number of dimensions is
consistent.

## See also

[`term-vector()`](https://poissonconsulting.github.io/term/reference/term.md)
and
[`npdims()`](https://poissonconsulting.github.io/universals/reference/npdims.html)

## Examples

``` r
consistent_term(term("alpha[1]", "alpha[3]", "beta[1,1]", "beta[2,1]"))
#> [1] TRUE TRUE TRUE TRUE
consistent_term(term("alpha[1]", NA_term_, "beta[1,1]", "beta[2]"))
#> [1]  TRUE    NA FALSE FALSE
```
