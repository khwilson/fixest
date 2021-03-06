% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MiscFuns.R
\name{to_integer}
\alias{to_integer}
\title{Fast transform of any type of vector(s) into an integer vector}
\usage{
to_integer(
  ...,
  sorted = FALSE,
  add_items = FALSE,
  items.list = FALSE,
  multi.join = FALSE
)
}
\arguments{
\item{...}{Vectors of any type, to be transformed in integer.}

\item{sorted}{Logical, default is \code{FALSE}. Whether the integer vector should make reference to sorted values?}

\item{add_items}{Logical, default is \code{FALSE}. Whether to add the unique values of the original vector(s). If requested, an attribute \code{items} is created containing the values (alternatively, they can appear in a list if \code{items.list=TRUE}).}

\item{items.list}{Logical, default is \code{FALSE}. Only used if \code{add_items=TRUE}. If \code{TRUE}, then a list of length 2 is returned with \code{x} the integer vector and \code{items} the vector of items.}

\item{multi.join}{Logical, or character, scalar, defaults to \code{FALSE}. Only used if multiple vectors are to be transformed into integers. If \code{multi.join} is not \code{FALSE}, then the values of the different vectors will be collated using \code{\link[base]{paste}} with \code{collapse=multi.join}.}
}
\value{
Reruns a vector of the same length as the input vectors.
If \code{add_items=TRUE} and \code{items.list=TRUE}, a list of two elements is returned: \code{x} being the integer vector and \code{items} being the unique values to which the values in \code{x} make reference.
}
\description{
Tool to transform any type of vector, or even combination of vectors, into an integer vector ranging from 1 to the number of unique values. This actually creates an unique identifier vector.
}
\details{
If multiple vectors have to be combined and \code{add_items=TRUE}, to have user readable values in the items, you should add the argument \code{multi.join} so that the values of the vectors are combined in a "user-readable" way. Note that in the latter case, the algorithm is much much slower.
}
\examples{

x1 = iris$Species
x2 = as.integer(iris$Sepal.Length)

# transforms the species vector into integers
to_integer(x1)

# To obtain the "items":
to_integer(x1, add_items = TRUE)
# same but in list form
to_integer(x1, add_items = TRUE, items.list = TRUE)

# transforms x2 into an integer vector from 1 to 4
to_integer(x2, add_items = TRUE)

# To have the sorted items:
to_integer(x2, add_items = TRUE, sorted = TRUE)

# The result can safely be used as an index
res = to_integer(x2, add_items = TRUE, sorted = TRUE, items.list = TRUE)
all(res$items[res$x] == x2)


#
# Multiple vectors
#

# by default, the two vector are fast combined, and items are meaningless
to_integer(x1, x2, add_items = TRUE)

# You can use multi.join to have human-readable values for the items:
to_integer(x1, x2, add_items = TRUE, multi.join = TRUE)

to_integer(x1, x2, add_items = TRUE, multi.join = "; ")

}
