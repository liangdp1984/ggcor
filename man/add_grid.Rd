% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add-grid.R
\name{add_grid}
\alias{add_grid}
\title{Add panel grid line on correlation plot}
\usage{
add_grid(colour = "grey50", size = 0.25, ..., color = NULL)
}
\arguments{
\item{colour, color}{colour of grid lines.}

\item{size}{size of grid lines.}

\item{...}{extra params for \code{\link[ggplot2]{geom_segment}}.}
}
\description{
\code{add_grid} is mainly used with \code{ggcor} function,
    and only valid if the input data is cor_tbl in \code{\link[ggplot2]{ggplot}}.
}
\examples{
df <- fortify_cor(mtcars)
ggcor(df) + add_grid()
ggplot(df, aes(x, y)) + add_grid()
}
\author{
Houyun Huang, Lei Zhou, Jian Chen, Taiyun Wei
}
