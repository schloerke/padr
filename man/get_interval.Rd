% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_interval.R
\name{get_interval}
\alias{get_interval}
\title{Get the interval of a datetime variable}
\usage{
get_interval(x)
}
\arguments{
\item{x}{A variable of class of class \code{Date} or of class \code{POSIXt}.}
}
\value{
A character string indicating the interval of \code{x}.
}
\description{
The interval is the lowest highest time unit that can explain all instances of a
variable of class \code{Date} or of class \code{POSIXct}. This function
will determine what the interval of the variable is.
}
\examples{
x_month <- seq(as.Date('2016-01-01'), as.Date('2016-05-01'), by = 'month')
get_interval(x_month)
}

