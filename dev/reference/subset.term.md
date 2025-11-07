# Subset Term Vector

Subsets a term vector.

## Usage

``` r
# S3 method for class 'term'
subset(x, pars = NULL, select = NULL, ...)
```

## Arguments

- x:

  The object.

- pars:

  A character vector of parameter names.

- select:

  A character vector of the names of the parameters to include in the
  subsetted object.

- ...:

  These dots are for future extensions and must be empty.

## Value

The modified term vector.

## Details

The `select` argument is **\[defunct\]**.

## See also

[`term-vector()`](https://poissonconsulting.github.io/term/dev/reference/term.md)

## Examples

``` r
term <- term(
  "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
  "beta[1,2]", "beta[2,2]", "sigma"
)
subset(term, "beta")
#> <term[4]>
#> [1] beta[1,1] beta[2,1] beta[1,2] beta[2,2]
subset(term, c("alpha", "sigma"))
#> <term[3]>
#> [1] alpha[1] alpha[2] sigma   
```
