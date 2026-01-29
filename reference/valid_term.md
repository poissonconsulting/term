# Test Valid Terms

Test whether each element in a term or term_rcrd object is valid.

## Usage

``` r
valid_term(x)
```

## Arguments

- x:

  The object.

## Value

A logical vector indicating whether each term is valid.

## Details

Repairing a term vector replaces invalid terms with missing values.

## See also

[`term-vector()`](https://poissonconsulting.github.io/term/reference/term.md)
and
[`repair_terms()`](https://poissonconsulting.github.io/term/reference/repair_terms.md)

Other valid:
[`vld_term()`](https://poissonconsulting.github.io/term/reference/vld_term.md)

## Examples

``` r
# valid term elements
valid_term(term("a", "a [3]", " b [ 1  ] ", "c[1,300,10]"))
#> [1] TRUE TRUE TRUE TRUE
# invalid term elements
valid_term(new_term(c("a b", "a[1]b", "a[0]", "b[1,]", "c[]", "d[1][2]")))
#> [1] FALSE FALSE FALSE FALSE FALSE FALSE
```
