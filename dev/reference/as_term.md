# Coerce to a Term Vector

Coerces an R object to a
[`term-vector()`](https://poissonconsulting.github.io/term/dev/reference/term.md).

## Usage

``` r
as_term(x, ...)

as.term(x, ...)

# S3 method for class 'character'
as_term(x, repair = FALSE, normalize = repair, ...)

# S3 method for class 'numeric'
as_term(x, name = "par", ...)
```

## Arguments

- x:

  The object.

- ...:

  These dots are for future extensions and must be empty.

- repair:

  A flag specifying whether to repair terms.

- normalize:

  A flag specifying whether to normalize terms.

- name:

  A string specifying the name of the parameter.

## Details

`as.term` has been **\[deprecated\]** for `as_term`.

## Methods (by class)

- `as_term(character)`: Coerce character vector to term vector

- `as_term(numeric)`: Coerce numeric object to term vector

## See also

[`term-vector()`](https://poissonconsulting.github.io/term/dev/reference/term.md)
and
[`repair_terms()`](https://poissonconsulting.github.io/term/dev/reference/repair_terms.md)

## Examples

``` r
as_term(matrix(1:4, 2))
#> <term[4]>
#> [1] par[1,1] par[2,1] par[1,2] par[2,2]
as_term(c("parm3[10]", "parm3[2]", "parm[2,2]", "parm[1,1]"))
#> <term[4]>
#> [1] parm3[10] parm3[2]  parm[2,2] parm[1,1]
```
