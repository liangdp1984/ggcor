% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/quickcor.R
\name{quickcor}
\alias{quickcor}
\title{Plot Correlation Matrix Quickly}
\usage{
quickcor(x, y = NULL, mapping = NULL, fill.colours = NULL,
  fill.bin = FALSE, grid.colour = "grey50", grid.size = 0.25,
  axis.x.position = "auto", axis.y.position = "auto",
  axis.label.drop = TRUE, legend.title = "corr",
  legend.position = "auto", legend.breaks = NULL,
  legend.labels = NULL, ...)
}
\arguments{
\item{x, y}{matrix or data frame.}

\item{mapping}{NULL (default) or a list of aesthetic mappings to use for plot.}

\item{fill.colours}{NULL (default) or a vector of colours to use for n-colour gradient.}

\item{fill.bin}{logical value (default is FALSE). if TRUE, If TRUE, use the function
\code{\link[ggcor]{scale_fill_steps2n}}, otherwise use the function
\code{\link[ggcor]{scale_fill_gradient2n}} for fill colour scale.}

\item{grid.colour}{colour of grid lines.}

\item{grid.size}{size of grid lines.}

\item{axis.x.position, axis.y.position}{the position of the axis. 'auto' (default)
is set according to the plot type, 'bottom' or 'top' for x axes, 'left' or 'right'
for y axes.}

\item{axis.label.drop}{logical value (default is TRUE). When type of plot is 'upper'
or 'lower' and 'show.diag' is FALSE, do you need to remove the blank coordinate
label.}

\item{legend.title}{title of colour bar.}

\item{legend.position}{position of legend.}

\item{legend.breaks}{breaks of colour bar.}

\item{legend.labels}{labels of colour bar.}

\item{...}{extra params for \code{\link[ggcor]{fortify_cor}}.}
}
\description{
quickcor is convenient wrapper for creating a number of different types
of correlation matrix plots because of adding some extra settings by default.
}
\examples{
quickcor(mtcars)
quickcor(mtcars, type = "upper")
quickcor(mtcars, type = "lower", show.diag = FALSE)
quickcor(mtcars) + geom_colour()
quickcor(mtcars, type = "upper") + geom_circle2()
quickcor(mtcars, type = "lower", show.diag = FALSE) + geom_ellipse2()
quickcor(mtcars, cluster = TRUE) + geom_square()
quickcor(mtcars, cor.test = TRUE) + geom_confbox()
quickcor(mtcars, cor.test = TRUE) + geom_colour() + geom_cross()
quickcor(mtcars, cor.test = TRUE) + geom_star(n = 5)
quickcor(mtcars, cor.test = TRUE) + geom_colour() + geom_number(aes(num = r))
quickcor(mtcars, cor.test = TRUE) +
  geom_square(data = get_data(type = "lower", show.diag = FALSE)) +
  geom_mark(data = get_data(type = "upper", show.diag = FALSE)) +
  geom_abline(slope = -1, intercept = 12)
}
\author{
Houyun Huang, Lei Zhou, Jian Chen, Taiyun Wei
}
