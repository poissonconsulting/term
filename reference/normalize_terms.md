# Normalize Terms

Normalizes a term vector.

## Usage

``` r
normalize_terms(x)
```

## Arguments

- x:

  The object.

## Value

The normalized term vector.

## Details

If a parameter such as `b` is a scalar then `b[1]` is replaced by `b`
but if higher indices are included such as `b[2]` then `b` is replaced
by `b[1]`.

## See also

[`term-vector()`](https://poissonconsulting.github.io/term/reference/term.md)
and
[`repair_terms()`](https://poissonconsulting.github.io/term/reference/repair_terms.md)

## Examples

``` r
normalize_terms(new_term(c("b", "b[3]")))
#> <term[2]>
#> [1] b[1] b[3]
normalize_terms(new_term(c("b[1]", "a[3]")))
#> <term[2]>
#> [1] b    a[3]
```
