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
# however since they are use in a range of structures to identify elements they

mcmc <- as_mcmc(nlist)
mcmc

# are interesting because they can be used to start to manipulate the elements
#
as_nlist(mcmc)


# its important to note that elements can be missing, duplicated, inconsistent

mcmc <- mcmc[,-c(2,7),drop = FALSE]

mcmc

as_nlist(mcmc)

# the term packages is designed to manipulate term vectors.
#
# currently it is based on a character vector as a vctrs_vctr which has to be parsed into its component parts for each term ie the name of the parameter and the index.
#
# the question is whether its worth defining each element in a term vector as a composite of scalars of other class (possibly vctr_vctrs) one class is the parameter
# name and the other is the index which must be a 1 or more positive integers?


