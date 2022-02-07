
#' iplay_pal
#'
#'
#'
#' @return
#' @export

iplay_pal <- function() {
  iplay <- c(
    `cold burst` = "#272d57",
    `tiffany blue` = "#2fa9ad",
    `kelly green` = "#72be43",
    `flush orange` = "#f48520",
    `raspberry` = "#db2b68"
  )

  structure(iplay, class = "palette", name = iplay_pal)
}


#' print.palette
#'
#' @param x palette a structure of class palette
#' @param ... additional arguments passed to text
#'
#' @importFrom graphics image par rect text
#' @importFrom grDevices rgb
#'
#' @return
#' @export
#'
#' @examples
#' iplay_pal()
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n),
    col = x,
    ylab = "", xaxt = "n", yaxt = "n", bty = "n"
  )

  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text(1:n, 1, labels = attr(x, "names"), ...)
}