# Construct a New Term Record Object

Use this function to quickly construct a term_rcrd object.

## Usage

``` r
new_term_rcrd(
  x = data.frame(par = character(), dim = I(list()), stringsAsFactors = FALSE)
)
```

## Arguments

- x:

  A data frame with columns par and dim.

## See also

[`new_term()`](https://poissonconsulting.github.io/term/reference/new_term.md)

## Examples

``` r
new_term_rcrd()
#> <term_rcrd[0]>
if (FALSE) { # \dontrun{
new_term_rcrd(data.frame(
  par = c("x", "x", "y"), dim = I(list(1, 2, c(2, 2))),
  stringsAsFactors = FALSE
))
} # }
```
