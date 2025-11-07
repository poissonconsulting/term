# Is Term

Tests whether an R object inherits from S3 class `term`.

## Usage

``` r
is_term(x)
```

## Arguments

- x:

  The object.

## Value

A flag indicating whether the test was positive.

## Details

It does not test the validity of consistency of the term elements.

## See also

[`term-vector()`](https://poissonconsulting.github.io/term/dev/reference/term.md),
[`vld_term()`](https://poissonconsulting.github.io/term/dev/reference/vld_term.md),
[`valid_term()`](https://poissonconsulting.github.io/term/dev/reference/valid_term.md)
and
[`consistent_term()`](https://poissonconsulting.github.io/term/dev/reference/consistent_term.md)

## Examples

``` r
is_term(c("parameter[2]", "parameter[10]"))
#> [1] FALSE
is_term(term("parameter[2]", "parameter[10]"))
#> [1] TRUE
```
