# Parameter Dimensions

Gets the dimensions of each parameter of an object.

## Usage

``` r
# S3 method for class 'term'
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

Errors if the parameter dimensions are invalid or inconsistent.

A named list of the dimensions of each parameter can be converted into
the equivalent
[`term-vector()`](https://poissonconsulting.github.io/term/dev/reference/term.md)
using
[`term()`](https://poissonconsulting.github.io/term/dev/reference/term.md).

## See also

Other dimensions:
[`dims()`](https://poissonconsulting.github.io/universals/reference/dims.html),
[`ndims()`](https://poissonconsulting.github.io/universals/reference/ndims.html),
[`npdims()`](https://poissonconsulting.github.io/universals/reference/npdims.html)

## Examples

``` r
pdims(term("alpha[1]", "alpha[3]", "beta[1,1]", "beta[2,1]"))
#> $alpha
#> [1] 3
#> 
#> $beta
#> [1] 2 1
#> 
```
