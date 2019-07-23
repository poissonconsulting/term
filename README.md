
<!-- README.md is generated from README.Rmd. Please edit that file -->

# term

<!-- badges: start -->

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
parameter terms. A parameter term is the name of a parameter value, ie,
“alpha”, “beta\[3\]”, “sigma2\[1,4\]”.

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
library(term)

# a term vector can be created from a character vector
term <- as.term(c("sigma", "beta[2,2]", "alpha[1]", "alpha[2]", "beta[1,1]", 
                  "beta[2,1]", "beta[1,2]"))

print(term)
#> [1] "sigma"     "beta[2,2]" "alpha[1]"  "alpha[2]"  "beta[1,1]" "beta[2,1]"
#> [7] "beta[1,2]"

# term vectors can be sorted
term <- sort(term)
print(term)
#> [1] "alpha[1]"  "alpha[2]"  "beta[1,1]" "beta[2,1]" "beta[1,2]" "beta[2,2]"
#> [7] "sigma"

# and the parameters extracted
parameters(term)
#> [1] "alpha" "beta"  "sigma"

# as well as the dimensions of each parameter
pdims(term)
#> $alpha
#> [1] 2
#> 
#> $beta
#> [1] 2 2
#> 
#> $sigma
#> [1] 1

# and the index of each term
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

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/term/issues).

[Pull requests](https://github.com/poissonconsulting/term/pulls) are
always welcome.

Please note that the ‘term’ project is released with a [Contributor Code
of
Conduct](https://poissonconsulting.github.io/term/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
