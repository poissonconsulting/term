# Coerce to a Term Record

Coerces an R object to a `term_rcrd`.

## Usage

``` r
as_term_rcrd(x, ...)

# S3 method for class 'character'
as_term_rcrd(x, repair = FALSE, ...)

# S3 method for class 'numeric'
as_term_rcrd(x, name = "par", ...)

# S3 method for class 'term'
as_term_rcrd(x, repair = FALSE, ...)
```

## Arguments

- x:

  The object.

- ...:

  These dots are for future extensions and must be empty.

- repair:

  A flag specifying whether to repair terms.

- name:

  A string specifying the name of the parameter.

## Methods (by class)

- `as_term_rcrd(character)`: Coerce character vector to term_rcrd

- `as_term_rcrd(numeric)`: Coerce numeric vector to term_rcrd

- `as_term_rcrd(term)`: Coerce term vector to term_rcrd

## See also

[`as_term()`](https://poissonconsulting.github.io/term/dev/reference/as_term.md)
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
