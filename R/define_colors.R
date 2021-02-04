define_color <- function(name, color) {
  rgb <- grDevices::col2rgb(color)[, 1] / 255
  paste0(
    "$$\\require{color}\\definecolor{",
    name,
    "}{rgb}{",
    rgb[1],
    ", ",
    rgb[2],
    ", ",
    rgb[3],
    "}$$"
  )
}

define_colors <- function(colors) {
  c(
    "<div style = \"position:fixed; visibility: hidden\">",
    purrr::imap_chr(colors, ~define_color(.y, .x)),
    "</div>"
  )
}
