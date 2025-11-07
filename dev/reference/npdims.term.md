# Number of Dimensions of Each Parameter

The terms argument is **\[defunct\]**.

## Usage

``` r
# S3 method for class 'term'
npdims(x, terms = FALSE, ...)
```

## Arguments

- x:

  An object.

- terms:

  A flag specifying whether to get the number of dimensions for each
  term element.

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
