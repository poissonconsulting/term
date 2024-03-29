% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/chk.R
\name{chk_term}
\alias{chk_term}
\alias{chk_term_rcrd}
\title{Check Term or Term Record}
\usage{
chk_term(x, validate = "complete", x_name = NULL)

chk_term_rcrd(x, validate = "complete", x_name = NULL)
}
\arguments{
\item{x}{The object.}

\item{validate}{A string specifying the level of the validation.
The possible values in order of increasing strictness
are 'class', 'valid', 'consistent' and 'complete'.}

\item{x_name}{A string of the name of object x or NULL.}
}
\value{
\code{NULL}, invisibly. Called for the side effect of throwing an error
if the condition is not met.
}
\description{
Checks if term using \code{\link[=vld_term]{vld_term()}} or \code{\link[=vld_term_rcrd]{vld_term_rcrd()}}.
}
\section{Functions}{
\itemize{
\item \code{chk_term_rcrd()}: Check Term Record

}}
\examples{
# chk_term
x <- term("x[2]", "x[1]")
chk_term(x)
x <- c("x[2]", "x[1]")
try(chk_term(x, validate = "sorted"))

# chk_term_rcrd
x <- term_rcrd("x[2]", "x[1]")
chk_term_rcrd(x)
x <- c("x[2]", "x[1]")
try(chk_term_rcrd(x, validate = "sorted"))
}
