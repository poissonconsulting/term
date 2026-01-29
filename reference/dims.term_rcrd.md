# Dimensions

Gets the dimensions of an object.

## Usage

``` r
# S3 method for class 'term_rcrd'
dims(x, ...)
```

## Arguments

- x:

  An object.

- ...:

  Other arguments passed to methods.

## Value

An integer vector of the dimensions.

## Details

Unlike [`base::dim()`](https://rdrr.io/r/base/dim.html), dims returns
the length of an atomic vector.

## See also

[`base::dim()`](https://rdrr.io/r/base/dim.html)

Other dimensions:
[`ndims()`](https://poissonconsulting.github.io/universals/reference/ndims.html),
[`npdims()`](https://poissonconsulting.github.io/universals/reference/npdims.html),
[`pdims()`](https://poissonconsulting.github.io/universals/reference/pdims.html)

## Examples

``` r
dims(term_rcrd("beta[1,1]"))
#> [1] 1
dims(term_rcrd("beta[1,1]", "beta[1,2]"))
#> [1] 2
```
