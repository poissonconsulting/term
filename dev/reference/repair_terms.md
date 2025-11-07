# Repair Terms

Repairs a terms vector.

## Usage

``` r
repair_terms(x, normalize = TRUE)
```

## Arguments

- x:

  The object.

- normalize:

  A flag specifying whether to normalize terms.

## Value

The repaired term vector.

## Details

Invalid elements are replaced by missing values and spaces removed.

## See also

[`term-vector()`](https://poissonconsulting.github.io/term/dev/reference/term.md),
[`valid_term()`](https://poissonconsulting.github.io/term/dev/reference/valid_term.md)
and
[`normalize_terms()`](https://poissonconsulting.github.io/term/dev/reference/normalize_terms.md)

## Examples

``` r
repair_terms(new_term(c("b[3]", "b")))
#> <term[2]>
#> [1] b[3] b[1]
repair_terms(new_term(c("a[3]", "b[1]")))
#> <term[2]>
#> [1] a[3] b   
repair_terms(new_term(c("a [3]", " b [ 1  ] ")))
#> <term[2]>
#> [1] a[3] b   
repair_terms(new_term(c("a", NA)))
#> <term[2]>
#> [1] a    <NA>
```
