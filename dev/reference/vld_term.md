# Validate Term or Term Record

Validates the elements of a term or term_rcrd vector.

## Usage

``` r
vld_term(x, validate = "complete")

vld_term_rcrd(x, validate = "complete")
```

## Arguments

- x:

  The object.

- validate:

  A string specifying the level of the validation. The possible values
  in order of increasing strictness are 'class', 'valid', 'consistent'
  and 'complete'.

## Value

A flag indicating whether the condition was met.

## Details

Internal validity of a term can be checked on three levels:

- `"valid"` checks that all terms are of the form `x`, `x[#]`, `x[#,#]`
  etc. where `x` is an identifier and `#` are positive integers.

- `"consistent"` checks that all terms are addressed with the same
  dimensionality; the terms `x[1]` and `x[2,3]` are inconsistent.

- `"complete"` checks that the values span all possible values across
  all dimensions; if `x[3,4]` exist, the vector must contain at least 11
  more terms to be consistent (`x[1,1]` to `x[1,4]`, `x[2,1]` to
  `x[2,4]` and `x[3,1]` to `x[3,3]`).

Missing values are ignored as are duplicates and order.

## Functions

- `vld_term_rcrd()`: Validate Term Record

## See also

[`chk_term()`](https://poissonconsulting.github.io/term/dev/reference/chk_term.md)

Other valid:
[`valid_term()`](https://poissonconsulting.github.io/term/dev/reference/valid_term.md)

Other valid:
[`valid_term()`](https://poissonconsulting.github.io/term/dev/reference/valid_term.md)

## Examples

``` r
# vld_term
vld_term(c("x[2]", "x[1]"))
#> [1] FALSE
vld_term(term("x[2]", "x[1]"))
#> [1] TRUE

# vld_term_rcrd
vld_term_rcrd(c("x[2]", "x[1]"))
#> [1] FALSE
vld_term_rcrd(term_rcrd("x[2]", "x[1]"))
#> [1] TRUE
```
