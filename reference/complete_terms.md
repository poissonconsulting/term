# Complete Terms

Completes an object's terms.

## Usage

``` r
complete_terms(x, ...)

# S3 method for class 'term'
complete_terms(x, ...)

# S3 method for class 'term_rcrd'
complete_terms(x, ...)
```

## Arguments

- x:

  The object.

- ...:

  These dots are for future extensions and must be empty.

## Details

It must not have any invalid or missing (NA) values.

## Methods (by class)

- `complete_terms(term)`: Complete Terms for a term Vector

- `complete_terms(term_rcrd)`: Complete Terms for a term_rcrd vector

## See also

[`term-vector()`](https://poissonconsulting.github.io/term/reference/term.md),
[`repair_terms()`](https://poissonconsulting.github.io/term/reference/repair_terms.md)
and
[`is_incomplete_terms()`](https://poissonconsulting.github.io/term/reference/is_incomplete_terms.md).

## Examples

``` r
complete_terms(term("b[3]", "b[1]", "b[2]"))
#> <term[3]>
#> [1] b[3] b[1] b[2]
complete_terms(term("z[2,2]", "z[1,1]"))
#> <term[4]>
#> [1] z[2,2] z[1,1] z[2,1] z[1,2]
if (FALSE) { # \dontrun{
complete_terms(term_rcrd("b[3]", "b[1]", "b[2]"))
complete_terms(term_rcrd("z[2,2]", "z[1,1]"))
} # }
```
