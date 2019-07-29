
<!-- README.md is generated from README.Rmd. Please edit that file -->

# term

<!-- badges: start -->

[![Lifecycle:
maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![Travis build
status](https://travis-ci.com/poissonconsulting/term.svg?branch=master)](https://travis-ci.com/poissonconsulting/term)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/poissonconsulting/term?branch=master&svg=true)](https://ci.appveyor.com/project/poissonconsulting/term)
[![Codecov test
coverage](https://codecov.io/gh/poissonconsulting/term/branch/master/graph/badge.svg)](https://codecov.io/gh/poissonconsulting/term?branch=master)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![Tinyverse
status](https://tinyverse.netlify.com/badge/term)](https://CRAN.R-project.org/package=term)
[![CRAN
status](https://www.r-pkg.org/badges/version/term)](https://cran.r-project.org/package=term)
![CRAN downloads](http://cranlogs.r-pkg.org/badges/term)
<!-- badges: end -->

`term` is an R package to create, manipulate and query vectors of
parameter terms. Parameter terms are the labels used to reference values
in vectors, matrices and arrays. They are most commonly used in
coefficient tables.

## Installation

To install the latest release version from
[CRAN](https://cran.r-project.org)

    install.packages("term")

To install the latest development version from
[GitHub](https://github.com/poissonconsulting/term)

    # install.packages("remotes")
    remotes::install_github("poissonconsulting/term")

## Demonstration

``` r
library(tibble) # for prettier printing of df
library(term)

# creates a data frame with a term vector 
df <- term_df(matrix(1:4, 2))

df
#> # A tibble: 4 x 2
#>   term        n1
#>   <term>   <int>
#> 1 par[1,1]     1
#> 2 par[2,1]     2
#> 3 par[1,2]     3
#> 4 par[2,2]     4

# extract the term vector
term <- df$term

str(term)
#>  'term' chr [1:4] "par[1,1]" "par[2,1]" "par[1,2]" "par[2,2]"

# then extract the parameter names
pars(term)
#> [1] "par"

# the dimensions of each parameter
pdims(term)
#> $par
#> [1] 2 2

# and the index of each term
tindex(term)
#> $`par[1,1]`
#> [1] 1 1
#> 
#> $`par[2,1]`
#> [1] 2 1
#> 
#> $`par[1,2]`
#> [1] 1 2
#> 
#> $`par[2,2]`
#> [1] 2 2
```

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/term/issues).

[Pull requests](https://github.com/poissonconsulting/term/pulls) are
always welcome.

Please note that the ‘term’ project is released with a [Contributor Code
of
Conduct](https://poissonconsulting.github.io/term/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
