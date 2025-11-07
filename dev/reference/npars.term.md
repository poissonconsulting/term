# Number of Parameters

Gets the number of parameters of an object.

The default methods returns the length of
[`pars()`](https://poissonconsulting.github.io/universals/reference/pars.html)
if none are `NA`, otherwise it returns `NA`.

## Usage

``` r
# S3 method for class 'term'
npars(x, scalar = NULL, ...)
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

An integer scalar of the number of parameters.

## See also

[`pars()`](https://poissonconsulting.github.io/universals/reference/pars.html)

Other MCMC dimensions:
[`nchains()`](https://poissonconsulting.github.io/universals/reference/nchains.html),
[`niters()`](https://poissonconsulting.github.io/universals/reference/niters.html),
[`nsams()`](https://poissonconsulting.github.io/universals/reference/nsams.html),
[`nsims()`](https://poissonconsulting.github.io/universals/reference/nsims.html),
[`nterms()`](https://poissonconsulting.github.io/universals/reference/nterms.html)

Other parameters:
[`pars()`](https://poissonconsulting.github.io/universals/reference/pars.html),
[`set_pars()`](https://poissonconsulting.github.io/universals/reference/set_pars.html)

## Examples

``` r
npars(term("sigma", "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]"))
#> [1] 3
```
