# Is Inconsistent Terms

Tests whether a term vector has inconsistent elements. Returns TRUE if
includes missing or invalid terms.

## Usage

``` r
is_inconsistent_terms(x, ...)
```

## Arguments

- x:

  The object.

- ...:

  These dots are for future extensions and must be empty.

## Value

A logical scalar indicating whether the object's terms are inconsistent.

## See also

[`term-vector()`](https://poissonconsulting.github.io/term/reference/term.md)
and
[`consistent_term()`](https://poissonconsulting.github.io/term/reference/consistent_term.md)

## Examples

``` r
is_inconsistent_terms(term("b[2]"))
#> [1] FALSE
is_inconsistent_terms(term("b[2]", "b[1]"))
#> [1] FALSE
is_inconsistent_terms(term("b[2]", "b[1,1]"))
#> [1] TRUE
```
