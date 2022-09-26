
<!-- README.md is generated from README.Rmd. Please edit that file -->

# term <img src="man/figures/logo.png" align="right" />

<!-- badges: start -->

[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![R-CMD-check](https://github.com/poissonconsulting/term/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/poissonconsulting/term/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/poissonconsulting/term/branch/master/graph/badge.svg)](https://app.codecov.io/gh/poissonconsulting/term?branch=master)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![CRAN
status](https://www.r-pkg.org/badges/version/term)](https://cran.r-project.org/package=term)
![CRAN downloads](http://cranlogs.r-pkg.org/badges/term)
<!-- badges: end -->

`term` is an R package to create, manipulate, query and repair vectors
of parameter terms. Parameter terms are the labels used to reference
values in vectors, matrices and arrays. They represent the names in
coefficient tables and the column names in `mcmc` and `mcmc.list`
objects.

## Installation

To install the latest release from [CRAN](https://cran.r-project.org)

``` r
install.packages("term")
```

To install the developmental version from
[GitHub](https://github.com/poissonconsulting/term)

``` r
# install.packages("remotes")
remotes::install_github("poissonconsulting/term")
```

## Demonstration

### Term Vectors

``` r
library(term)

# term vectors are the labels used to reference values in 
# vectors, matrices and arrays
term <- term(
  "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
  "beta[1,2]", "beta[2,2]", "sigma"
)

# they print like character vectors
term
#> <term[7]>
#> [1] alpha[1]  alpha[2]  beta[1,1] beta[2,1] beta[1,2] beta[2,2] sigma

# but are S3 class objects that also inherit from vctrs_vctr
class(term)
#> [1] "term"       "vctrs_vctr"
```

``` r
# consider a matrix of term values
set.seed(101)
estimate <- matrix(rnorm(4), nrow = 2)
estimate
#>            [,1]       [,2]
#> [1,] -0.3260365 -0.6749438
#> [2,]  0.5524619  0.2143595

# the term labels can be created using as_term()
term <- as_term(estimate, name = "b0")
term
#> <term[4]>
#> [1] b0[1,1] b0[2,1] b0[1,2] b0[2,2]

# and combined with the term values to create a coef table
library(tibble)
coef <- tibble(term = term, estimate = as.vector(estimate))
coef
#> # A tibble: 4 × 2
#>   term    estimate
#>   <term>     <dbl>
#> 1 b0[1,1]   -0.326
#> 2 b0[2,1]    0.552
#> 3 b0[1,2]   -0.675
#> 4 b0[2,2]    0.214
```

### Querying Term Vectors

``` r
# the term vectors are readily sorted
coef[rev(order(coef$term)),]
#> # A tibble: 4 × 2
#>   term    estimate
#>   <term>     <dbl>
#> 1 b0[2,2]    0.214
#> 2 b0[1,2]   -0.675
#> 3 b0[2,1]    0.552
#> 4 b0[1,1]   -0.326

# and the parameter names or parameter dimensions extracted
term <- term(
  "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]",
  "beta[1,2]", "beta[2,2]", "sigma"
)

pars(term)
#> [1] "alpha" "beta"  "sigma"
pdims(term)
#> $alpha
#> [1] 2
#> 
#> $beta
#> [1] 2 2
#> 
#> $sigma
#> [1] 1

# this can also be done for each term
pars_terms(term)
#> [1] "alpha" "alpha" "beta"  "beta"  "beta"  "beta"  "sigma"
tindex(term)
#> $`alpha[1]`
#> [1] 1
#> 
#> $`alpha[2]`
#> [1] 2
#> 
#> $`beta[1,1]`
#> [1] 1 1
#> 
#> $`beta[2,1]`
#> [1] 2 1
#> 
#> $`beta[1,2]`
#> [1] 1 2
#> 
#> $`beta[2,2]`
#> [1] 2 2
#> 
#> $sigma
#> [1] 1
```

### Validating Term Vectors

``` r
# term vectors can be tested for whether they have (parseably) valid,
# (dimensionally) consistent and complete terms.

# valid terms
valid_term(term("a", "a[1]", "a [2]", " b [3  ] ", "c[1,10]"))
#> [1] TRUE TRUE TRUE TRUE TRUE

# invalid terms
valid_term(new_term(c("a a", "a[]", "a[2", " b[3 3]", "c[1,10]c")))
#> [1] FALSE FALSE FALSE FALSE FALSE

# consistent terms
consistent_term(term("a", "a[2]", "b[1,1]", "b[10,99]"))
#> [1] TRUE TRUE TRUE TRUE

# inconsistent terms
consistent_term(term("a", "a[2,1]", "b[1,1]", "b[10,99,1]"))
#> [1] FALSE FALSE FALSE FALSE

# complete terms
is_incomplete_terms(term("a", "a[2]", "b[1,1]", "b[2,1]"))
#> [1] FALSE

# incomplete terms
is_incomplete_terms(term("a", "a[3]", "b[1,1]", "b[2,2]"))
#> [1] TRUE
```

### Checking Term Vectors

``` r
# term vectors can be checked using functions styled on those in the chk package
x <- term("a[1]", "a[3]")
vld_term(x, validate = "valid")
#> [1] TRUE
chk_term(x, validate = "complete")
#> Error:
#> ! All elements of term vector `x` must be complete.
```

### Repairing Term Vectors

``` r
term <- new_term(c("b[4]", "b   [2]", "b", "b[1", "b[2, 2]", "b", "a [ 1 ] ", NA))
term
#> <term[8]>
#> [1] b[4]       `b   [2]`  b          b[1        `b[2, 2]`  b          `a [ 1 ] `
#> [8] <NA>

# valid terms can be repaired (invalid terms are converted to missing values)
term <- repair_terms(term)
term
#> <term[8]>
#> [1] b[4]   b[2]   b[1]   <NA>   b[2,2] b[1]   a      <NA>

# the `term()` constructor rejects invalid terms
term("b[4]", "b   [2]", "b", "b[1", "b[2, 2]", "b", "a [ 1 ] ", NA)
#> Error in `term_impl()` at ]8;line = 50:col = 4;file:///Users/joe/Code/poissonconsulting/term/term/R/term.Rterm/R/term.R:50:4]8;;:
#> ! All elements of term vector `string_args_term` must be valid.

# missing values can easily removed
term <- term[!is.na(term)]
term
#> <term[6]>
#> [1] b[4]   b[2]   b[1]   b[2,2] b[1]   a

# and only unique values retained
term <- unique(term)
term
#> <term[5]>
#> [1] b[4]   b[2]   b[1]   b[2,2] a

# a term vector can be sorted by parameter name and index
term <- sort(term)
term
#> <term[5]>
#> [1] a      b[1]   b[2]   b[4]   b[2,2]

# an inconsistent term removed
term <- term[term != "b[2,2]"]
term
#> <term[4]>
#> [1] a    b[1] b[2] b[4]

# and incomplete terms completed
term <- sort(complete_terms(term))
term
#> <term[5]>
#> [1] a    b[1] b[2] b[3] b[4]
```

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/term/issues).

[Pull requests](https://github.com/poissonconsulting/term/pulls) are
always welcome.

## Code of Conduct

Please note that the term project is released with a [Contributor Code
of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
