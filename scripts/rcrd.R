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

# this seems to work - didn't before!
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

asdf

xx[NA]
dput(NA_term_)

asdf




x <- structure(list(1:3, 2:1), class = c("term_rcrd", "list"))
inherits(x, "list")
vec_is(x)


# currently using
data <- data.frame(dim = I(list(1:3, 2:1)))
data$dim <- as.list(data$dim)
x <- vctrs::new_data_frame(data, class = "term_rcrd")
# but this is a data frame not a vctr
class(x)
x

# trying as list  - but must be named
new_rcrd(fields = list(1:3, 2:1) , class = "term_rcrd")

# and must be same length
new_rcrd(fields = list(x = 1:3, y = 2:1) , class = "term_rcrd")

# this works
new_rcrd(fields = list(x = 1:3, y = 2:0) , class = "term_rcrd")

# trying as separate columns for each dimension but must be lists
new_rcrd(fields = c(1L, 2L), c(2L, 1L), c(3L, 0L), class = "term_rcrd")

# but must be uniquely named!
new_rcrd(fields = list(1L, 2L), list(2L, 1L), list(3L, 0L), class = "term_rcrd")

# but attributes must be named too
new_rcrd(fields = list(dim11 = 1L, dim12 = 2L), list(dim21 = 2L, dim22 = 1L),
         list(dim31 = 3L, dim32 = 0L), class = "term_rcrd")

# works but lots of
new_rcrd(fields = list(dim11 = 1L, dim12 = 2L), dim2 = list(dim21 = 2L, dim22 = 1L),
         dim3 = list(dim31 = 3L, dim32 = 0L), class = "term_rcrd")

