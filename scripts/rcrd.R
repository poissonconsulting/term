# NOTES
#  create index class in extras
#  then update term_rcrd class (par and index class) so that rcrd not data.frame.
#  missing values are NULL in list
# see if replace for loops with split.
library(vctrs)
library(tidyverse)
pkgload::load_all()

vec_cast.term_rcrd2.term <- function(x, to, ...) {
  stop()
}

vec_cast.term.term_rcrd2 <- function(x, to, ...) {
  chr <- paste0(
    field(x, "name"),
    "[",
    map_chr(field(x, "dim"), paste, collapse = ","),
    "]"
  )
  chr[is.na(x)] <- NA_character_
  new_term(chr)
}

format.term_rcrd2 <- function(x, ...) {
  format(vec_cast(x, new_term()))
}

x <- new_list_of(list(1:3, 2:1), integer(), class = "term_dim")
inherits(x, "list")
vec_is(x)

xx <- new_rcrd(fields = list(name = letters[1:2], dim = x), class = "term_rcrd2")
vec_is(xx)
term::term(!!!set_names(field(xx, "dim"), field(xx, "name")))
xx
fields(xx)

tibble(xx)
dput(xx[1])
dput()
# Needs https://github.com/r-lib/vctrs/issues/1205
xx[[1]]
vec_slice(xx, 1)

vec_cast(xx, new_term())

x <- structure(list(1:3, 2:1), class = c("term_rcrd", "list"))
inherits(x, "list")
vec_is(x)

