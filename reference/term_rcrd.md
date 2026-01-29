# Create Term Record

Creates a term_rcrd from values. This function checks that all terms are
valid but does not require stronger levels of consistency, see
`chk_valid()` for details.

## Usage

``` r
term_rcrd(...)
```

## Arguments

- ...:

  Unnamed values are term values, named values describe the parameter in
  the name and the dimensionality in the value.

## Value

A term_rcrd vector.

## See also

[`dims()`](https://poissonconsulting.github.io/universals/reference/dims.html),
[`ndims()`](https://poissonconsulting.github.io/universals/reference/ndims.html),
[`npdims()`](https://poissonconsulting.github.io/universals/reference/npdims.html)
and
[`pdims()`](https://poissonconsulting.github.io/universals/reference/pdims.html)

Other term:
[`term()`](https://poissonconsulting.github.io/term/reference/term.md),
[`tindex()`](https://poissonconsulting.github.io/term/reference/tindex.md)

## Examples

``` r
term_rcrd()
#> <term_rcrd[0]>
if (FALSE) { # \dontrun{
term_rcrd("p", "q[1]", "q[2]", "q[3]")
term_rcrd("q[1]", "q[2]", "q[3]")
} # }
```
