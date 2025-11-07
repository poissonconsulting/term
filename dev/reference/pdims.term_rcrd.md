# Parameter Dimensions

Gets the dimensions of each parameter of an object.

## Usage

``` r
# S3 method for class 'term_rcrd'
pdims(x, ...)
```

## Arguments

- x:

  An object.

- ...:

  Other arguments passed to methods.

## Value

A named list of integer vectors of the dimensions of each parameter.

## Details

Errors if the parameter dimensions are inconsistent.

## See also

Other dimensions:
[`dims()`](https://poissonconsulting.github.io/universals/reference/dims.html),
[`ndims()`](https://poissonconsulting.github.io/universals/reference/ndims.html),
[`npdims()`](https://poissonconsulting.github.io/universals/reference/npdims.html)

## Examples

``` r
pdims(as_term_rcrd(term("alpha[1]", "alpha[3]", "beta[1,1]", "beta[2,1]")))
#> $alpha
#> [1] 3
#> 
#> $beta
#> [1] 2 1
#> 
```
