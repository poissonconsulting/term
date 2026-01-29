# Deprecated Functions

Deprecated Functions

## Usage

``` r
is.term(x)

is.incomplete_terms(x)

is.inconsistent_terms(x)

parameters(x, ...)

parameters(x) <- value

set_parameters(x, pars)

tdims(x)
```

## Arguments

- ...:

  These dots are for future extensions and must be empty.

- x:

  The object.

- value:

  A character vector of the new parameter names.

- pars:

  A character vector of parameter names.

## Functions

- `is.term()`: Is Term

  **\[deprecated\]**

  Replace by
  [`is_term()`](https://poissonconsulting.github.io/term/reference/is_term.md)

- `is.incomplete_terms()`: Is Incomplete Terms

  **\[deprecated\]**

  Replace by
  [`is_incomplete_terms()`](https://poissonconsulting.github.io/term/reference/is_incomplete_terms.md)

- `is.inconsistent_terms()`: Is Inconsistent Terms

  **\[deprecated\]**

  Replace by
  [`is_inconsistent_terms()`](https://poissonconsulting.github.io/term/reference/is_inconsistent_terms.md)

- `parameters()`: Get Parameters

  **\[deprecated\]**

  Replace by
  [`pars()`](https://poissonconsulting.github.io/universals/reference/pars.html)

- `parameters(x) <- value`: Setting Parameters

  **\[deprecated\]**

  Replace by pars\<-

- `set_parameters()`: Set Parameters

  **\[deprecated\]**

  Replace by
  [`set_pars()`](https://poissonconsulting.github.io/universals/reference/set_pars.html)

- `tdims()`: Term Index

  **\[deprecated\]**

  Replace by
  [`tindex()`](https://poissonconsulting.github.io/term/reference/tindex.md)
