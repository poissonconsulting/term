# Check Term or Term Record

Checks if term using
[`vld_term()`](https://poissonconsulting.github.io/term/dev/reference/vld_term.md)
or
[`vld_term_rcrd()`](https://poissonconsulting.github.io/term/dev/reference/vld_term.md).

## Usage

``` r
chk_term(x, validate = "complete", x_name = NULL)

chk_term_rcrd(x, validate = "complete", x_name = NULL)
```

## Arguments

- x:

  The object.

- validate:

  A string specifying the level of the validation. The possible values
  in order of increasing strictness are 'class', 'valid', 'consistent'
  and 'complete'.

- x_name:

  A string of the name of object x or NULL.

## Value

`NULL`, invisibly. Called for the side effect of throwing an error if
the condition is not met.

## Functions

- `chk_term_rcrd()`: Check Term Record

## Examples

``` r
# chk_term
x <- term("x[2]", "x[1]")
chk_term(x)
x <- c("x[2]", "x[1]")
try(chk_term(x, validate = "sorted"))
#> Error in vld_term(x, validate = validate) : 
#>   `validate` must match 'class', 'complete', 'consistent' or 'valid', not 'sorted'.

# chk_term_rcrd
x <- term_rcrd("x[2]", "x[1]")
chk_term_rcrd(x)
x <- c("x[2]", "x[1]")
try(chk_term_rcrd(x, validate = "sorted"))
#> Error in vld_term_rcrd(x, validate = validate) : 
#>   `validate` must match 'complete', 'consistent' or 'valid', not 'sorted'.
```
