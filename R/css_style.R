css_style <- function(colors) {
  c(
    "<style>",
    paste0(".", names(colors), " {color: ", colors, ";}"),
    "</style>"
  )
}
