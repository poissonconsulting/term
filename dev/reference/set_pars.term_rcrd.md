# Set Parameter Names

Sets an object's parameter names.

The assignment version `pars<-()` forwards to
[`set_pars()`](https://poissonconsulting.github.io/universals/reference/set_pars.html).

## Usage

``` r
# S3 method for class 'term_rcrd'
set_pars(x, value, ...)
```

## Arguments

- x:

  An object.

- value:

  A character vector of the new parameter names.

- ...:

  Other arguments passed to methods.

## Value

The modified object.

## Details

`value` must be a unique character vector of the same length as the
object's parameters.

## See also

Other parameters:
[`npars()`](https://poissonconsulting.github.io/universals/reference/npars.html),
[`pars()`](https://poissonconsulting.github.io/universals/reference/pars.html)

## Examples

``` r
term_rcrd <- term_rcrd("b[2]", "a[1]", "b[3,3]")
set_pars(term_rcrd, c("x", "y"))
#> <term_rcrd[3]>
#> [1] x[2]   y      x[3,3]
```
