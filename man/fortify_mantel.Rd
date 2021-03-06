% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fortify-mantel.R
\name{fortify_mantel}
\alias{fortify_mantel}
\title{Tidy for mantel tests}
\usage{
fortify_mantel(spec, env, group = NULL, env.ctrl = NULL,
  mantel.fun = "mantel", ...)
}
\arguments{
\item{spec, env}{data frame object.}

\item{group}{vector for rows grouping.}

\item{env.ctrl}{NULL (default), data frame or named list of data frame.}

\item{mantel.fun}{string, function of mantel test.}

\item{...}{extra params for \code{\link[ggcor]{mantel_test}}.}
}
\description{
Enhanced encapsulation of the mantel_test function.
}
\examples{
library(vegan)
data("varespec")
data("varechem")
fortify_mantel(varespec, varechem,
  spec.select = list(spec01 = 1:5, spec02 = 6:12))
fortify_mantel(varespec, varechem,
  spec.select = list(spec01 = 1:5, spec02 = 6:12),
  env.select = list(env01 = 1:5, env02 = 6:10, env03 = 11:14))
set.seed(20191224)
sam_grp <- sample(paste0("sample", 1:3), 24, replace = TRUE)
fortify_mantel(varespec, varechem, group = sam_grp)
}
\seealso{
\code{\link[ggcor]{mantel_test}}.
}
\author{
Houyun Huang, Lei Zhou, Jian Chen, Taiyun Wei
}
