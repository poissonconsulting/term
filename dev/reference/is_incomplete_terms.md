# Is Incomplete Terms

Tests whether a term vector has absent elements. The vector should not
require repairing.

## Usage

``` r
is_incomplete_terms(x, ...)
```

## Arguments

- x:

  The object.

- ...:

  These dots are for future extensions and must be empty.

## Value

A logical scalar indicating whether the object's terms are incomplete.

## See also

[`term-vector()`](https://poissonconsulting.github.io/term/dev/reference/term.md)
and
[`complete_terms()`](https://poissonconsulting.github.io/term/dev/reference/complete_terms.md)

## Examples

``` r
is_incomplete_terms(term("b[2]"))
#> [1] TRUE
is_incomplete_terms(term("b[2]", "b[1]"))
#> [1] FALSE
is_incomplete_terms(term("b[2]", "b[1]", "b[1]"))
#> [1] FALSE
```
