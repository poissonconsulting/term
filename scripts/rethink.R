# A term vector is a vector of labels each of which refers to a particular element of a numeric object.

# term vectors can be readily created from a numeric object
library(term)
as_term(matrix(c(1,5,6,10), nrow = 2))

# or from multiple numeric objects
library(nlist)
nlist <- nlist(x = c(3,6,9), zz = matrix(c(1, 5, 6, 11), nrow = 2))
nlist
as_term(nlist)

# by themselves such term vectors are not very interesting

# however when used to identify elements in various structures they start to become interesting

mcmc <- as.mcmc(nlist)
term_frame <- as_term_frame(nlist)

# as they allow reconstruction of the original numeric objects

as_nlist(term_frame)






