flair_chunk <- function(colors) {
  c(
    "```{r flair_color, echo=FALSE}",
    "library(flair)",
    paste0(names(colors), " <- \"", colors, "\""),
    "```"
  )
}
