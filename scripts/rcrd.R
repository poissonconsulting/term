library(vctrs)

format.term_rcrd <- function(x) {
  unclass(x)
}

# this seems to work - didn't before!
new_vctr(list(1:3, 2:1), class = "term_rcrd")

inherits(list(1:3, 2:1), "list")
vec_is(list(1:3, 2:1))

new_vctr(list(1:3, 2:1), class = "term_rcrd")


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

