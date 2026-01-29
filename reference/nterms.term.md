# Number of Terms of a Term

Gets the number of terms of an MCMC object.

## Usage

``` r
# S3 method for class 'term'
nterms(x, ...)
```

## Arguments

- x:

  An object.

- ...:

  Other arguments passed to methods.

## Value

A integer scalar of the number of terms.

## See also

Other MCMC dimensions:
[`nchains()`](https://poissonconsulting.github.io/universals/reference/nchains.html),
[`niters()`](https://poissonconsulting.github.io/universals/reference/niters.html),
[`npars()`](https://poissonconsulting.github.io/universals/reference/npars.html),
[`nsams()`](https://poissonconsulting.github.io/universals/reference/nsams.html),
[`nsims()`](https://poissonconsulting.github.io/universals/reference/nsims.html)

## Examples

``` r
nterms(term("alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]"))
#> [1] 4
nterms(term("alpha[1]", "alpha[1]", "beta[1,1]", "beta[1,1]"))
#> [1] 4
```
