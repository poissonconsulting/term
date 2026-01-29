# Term Index

Gets the index for each term of an term or term_rcrd object.

## Usage

``` r
tindex(x)
```

## Arguments

- x:

  The object.

## Value

A named list of integer vectors of the index for each term.

## Details

For example the index of `beta[2,1]` is `c(2L, 1L)` while the index for
`sigma` is `1L`. It is useful for extracting the values of individual
terms.

## See also

[`dims()`](https://poissonconsulting.github.io/universals/reference/dims.html),
[`ndims()`](https://poissonconsulting.github.io/universals/reference/ndims.html),
[`npdims()`](https://poissonconsulting.github.io/universals/reference/npdims.html)
and
[`pdims()`](https://poissonconsulting.github.io/universals/reference/pdims.html)

Other term:
[`term()`](https://poissonconsulting.github.io/term/reference/term.md),
[`term_rcrd()`](https://poissonconsulting.github.io/term/reference/term_rcrd.md)

## Examples

``` r
tindex(term("alpha", "alpha[2]", "beta[1,1]", "beta[2 ,1  ]"))
#> $`alpha[1]`
#> [1] 1
#> 
#> $`alpha[2]`
#> [1] 2
#> 
#> $`beta[1,1]`
#> [1] 1 1
#> 
#> $`beta[2,1]`
#> [1] 2 1
#> 
```
