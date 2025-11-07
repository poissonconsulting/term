# Construct a New Term Object

Use this function to quickly construct a
[term](https://poissonconsulting.github.io/term/dev/reference/term.md)
object from a character vector, without checking the input. Use
[`term()`](https://poissonconsulting.github.io/term/dev/reference/term.md)
to repair the input.

## Usage

``` r
new_term(x = character())
```

## Arguments

- x:

  A character vector.

## See also

[`new_term_rcrd()`](https://poissonconsulting.github.io/term/dev/reference/new_term_rcrd.md)

## Examples

``` r
new_term()
#> <term[0]>
new_term(c("a", "b[1]", "b[2]"))
#> <term[3]>
#> [1] a    b[1] b[2]

# Terms are not checked for validity:
new_term("r[")
#> <term[1]>
#> [1] r[
repair_terms(new_term("r["))
#> <term[1]>
#> [1] <NA>
```
