# Number of Dimensions of Each Parameter

Gets the number of the dimensions of each parameter of an object.

The default methods returns the length of each element of
[`pdims()`](https://poissonconsulting.github.io/universals/reference/pdims.html)
as an integer vector.

## Usage

``` r
# S3 method for class 'term'
npdims(x, ...)
```

## Arguments

- x:

  An object.

- ...:

  Other arguments passed to methods.

## Value

A named integer vector of the number of dimensions of each parameter.

## See also

Other dimensions:
[`dims()`](https://poissonconsulting.github.io/universals/reference/dims.html),
[`ndims()`](https://poissonconsulting.github.io/universals/reference/ndims.html),
[`pdims()`](https://poissonconsulting.github.io/universals/reference/pdims.html)

## Examples

``` r
npdims(term("alpha[1]", "alpha[3]", "beta[1,1]", "beta[2,1]"))
#> alpha  beta 
#>     1     2 
```
