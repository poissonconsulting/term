# Create Term Vector

Creates a term vector from values. A `term` vector is an S3 vector of
parameter terms of the form `p`, `q[#]` or `r[#,#]` where `#` are
positive integers. This function checks that all terms are valid but
does not require stronger levels of consistency, see `chk_valid()` for
details.

## Usage

``` r
term(...)
```

## Arguments

- ...:

  Unnamed values are term values, named values describe the parameter in
  the name and the dimensionality in the value.

## Value

A term vector.

## See also

[`dims()`](https://poissonconsulting.github.io/universals/reference/dims.html),
[`ndims()`](https://poissonconsulting.github.io/universals/reference/ndims.html),
[`npdims()`](https://poissonconsulting.github.io/universals/reference/npdims.html)
and
[`pdims()`](https://poissonconsulting.github.io/universals/reference/pdims.html)

Other term:
[`term_rcrd()`](https://poissonconsulting.github.io/term/dev/reference/term_rcrd.md),
[`tindex()`](https://poissonconsulting.github.io/term/dev/reference/tindex.md)

## Examples

``` r
term()
#> <term[0]>
term("p", "q[1]", "q[2]", "q[3]")
#> <term[4]>
#> [1] p    q[1] q[2] q[3]
term("q[1]", "q[2]", "q[3]")
#> <term[3]>
#> [1] q[1] q[2] q[3]
combined <- term(par = 2:4, "alpha")
pdims(combined)
#> $alpha
#> [1] 1
#> 
#> $par
#> [1] 2 3 4
#> 
term(!!!pdims(combined))
#> <term[25]>
#>  [1] alpha      par[1,1,1] par[2,1,1] par[1,2,1] par[2,2,1] par[1,3,1]
#>  [7] par[2,3,1] par[1,1,2] par[2,1,2] par[1,2,2] par[2,2,2] par[1,3,2]
#> [13] par[2,3,2] par[1,1,3] par[2,1,3] par[1,2,3] par[2,2,3] par[1,3,3]
#> [19] par[2,3,3] par[1,1,4] par[2,1,4] par[1,2,4] par[2,2,4] par[1,3,4]
#> [25] par[2,3,4]

# Invalid terms are rejected:
try(term("r["))
#> Error in term_impl(args) : 
#>   All elements of term vector `string_args_term` must be valid.

# Valid terms are repaired
term("r  [ 1  ,2  ]")
#> <term[1]>
#> [1] r[1,2]
```
