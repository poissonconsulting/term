# Scalar Term

Test whether each term is a scalar.

## Usage

``` r
scalar_term(x)
```

## Arguments

- x:

  The object.

## Value

A logical vector indicating whether the term is a scalar.

## Examples

``` r
scalar_term(term("alpha[1]", "alpha[3]", "beta[1]", "sigma[3]"))
#> [1] FALSE FALSE  TRUE FALSE
scalar_term(term("alpha[1]", NA_term_, "beta[1]", "beta[3]"))
#> [1]  TRUE    NA FALSE FALSE
```
