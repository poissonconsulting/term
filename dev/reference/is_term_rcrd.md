# Is Term Record

Tests whether an R object inherits from S3 class `term_rcrd`.

## Usage

``` r
is_term_rcrd(x)
```

## Arguments

- x:

  The object.

## Value

A flag indicating whether the test was positive.

## Details

It does not test the validity of consistency of the term elements.

## See also

[`valid_term()`](https://poissonconsulting.github.io/term/dev/reference/valid_term.md)
and
[`consistent_term()`](https://poissonconsulting.github.io/term/dev/reference/consistent_term.md)

## Examples

``` r
is_term_rcrd(new_term_rcrd())
#> [1] TRUE
```
