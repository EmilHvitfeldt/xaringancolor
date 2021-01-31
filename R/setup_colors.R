#' Setup colors for xaringan document
#'
#' @param ... named parameters of colors to use.
#'
#' @return code to clipboard
#' @export
#'
#' @examples
#' \dontrun{
#' setup_colors(red = "red", blue = "blue", green = "green")
#' }
setup_colors <- function(...) {
  colors <- list(...)

  colors <- purrr::map_chr(colors, col2hex)

  res <- c(
    define_colors(colors),
    mathjax(colors),
    css_style(colors),
    "\n",
    flair_chunk(colors)
  )

  clipr::write_clip(res)

  message(
    "Color setup have been copied to clipboard. ",
    "Please paste at start of xaringan document"
  )
  return(invisible())
}

col2hex <- function(x) {
  colMat <- grDevices::col2rgb(x)
  grDevices::rgb(
    red = colMat[1, ] / 255,
    green = colMat[2, ] / 255,
    blue = colMat[3, ] / 255
  )
}
