#' @export
geom_star <- function(mapping = NULL, data = NULL,
                          stat = "identity", position = "identity",
                          ...,
                          linejoin = "mitre",
                          na.rm = FALSE,
                          show.legend = NA,
                          inherit.aes = TRUE) {
  layer(
    data = data,
    mapping = mapping,
    stat = stat,
    geom = GeomStar,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(
      linejoin = linejoin,
      na.rm = na.rm,
      ...
    )
  )
}

#' @export
GeomStar <- ggproto(
  "GeomStar", Geom,
  default_aes = aes(n = 5, r0 = 0.5, ratio = 0.618, colour = "grey35", fill = NA,
                    size = 0.25, linetype = 1, alpha = NA),
  required_aes = c("x", "y"),
  draw_panel = function(self, data, panel_params, coord, linejoin = "mitre") {
    aesthetics <- setdiff(names(data), c("x", "y"))
    star <- lapply(split(data, seq_len(nrow(data))), function(row) {
      if(row$n <= 2)
        return(grid::nullGrob())
      dd <- point_to_star(row$x, row$y, row$n, row$r0, row$ratio)
      aes <- new_data_frame(row[aesthetics])[rep(1, 2 * row$n + 1), ]
      GeomPolygon$draw_panel(cbind(dd, aes), panel_params, coord)
    })
    ggplot2:::ggname("star", do.call("grobTree", star))
  },
  draw_key = draw_key_polygon
)

#' @noRd
point_to_star <- function(x, y, n, r0, ratio = 0.618) {
  p <- 0:n / n
  if (n %% 2 == 0) p <- p + p[2] / 2
  pos <- p * 2 * pi
  x_tmp <- 0.5 * sign(r0) * sqrt(abs(r0)) * sin(pos)
  y_tmp <- 0.5 * sign(r0) * sqrt(abs(r0)) * cos(pos)
  angle <- pi / n
  xx <- numeric(2 * n + 2)
  yy <- numeric(2 * n + 2)
  xx[seq(2, 2 * n + 2, by = 2)] <- x + x_tmp
  yy[seq(2, 2 * n + 2, by = 2)] <- y + y_tmp
  xx[seq(1, 2 * n + 2, by = 2)] <- x + ratio * (x_tmp * cos(angle) - y_tmp * sin(angle))
  yy[seq(1, 2 * n + 2, by = 2)] <- y + ratio * (x_tmp * sin(angle) + y_tmp * cos(angle))
  new_data_frame(list(
    x = xx[- (2 * n + 2)],
    y = yy[- (2 * n + 2)]
  ))
}
