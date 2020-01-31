% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/npars.R
\name{npars.term}
\alias{npars.term}
\title{Number of Parameters}
\usage{
\method{npars}{term}(x, scalar = NA, ...)
}
\arguments{
\item{x}{An object.}

\item{scalar}{A logical scalar specifying whether to include
all parameters (NA), only scalars (TRUE) or all parameters
except scalars (FALSE).}

\item{...}{Other arguments passed to methods.}
}
\value{
An integer scalar of the number of parameters.
}
\description{
Gets the number of parameters of an object as returned by \code{\link[universals:pars]{pars()}}.
}
\examples{
npars(as.term(c("sigma", "alpha[1]", "alpha[2]", "beta[1,1]", "beta[2,1]")))
npars(as.term(c("sigma", "alpha[1]", "alpha[2]")), scalar = TRUE)
}
\seealso{
\code{\link[universals:pars]{pars()}}

Other {MCMC dimensions}: 
\code{\link[universals]{nchains}()},
\code{\link[universals]{niters}()},
\code{\link[universals]{nsams}()},
\code{\link[universals]{nsims}()},
\code{\link[universals]{nterms}()}

Other {parameters}: 
\code{\link[universals]{pars}()},
\code{\link[universals]{set_pars}()}
}