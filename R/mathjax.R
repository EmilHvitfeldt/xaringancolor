mathjax_config <- c(
"
<script type=\"text/x-mathjax-config\">
MathJax.Hub.Config({
  TeX: {
    Macros: {",

"    },
    loader: {load: ['[tex]/color']},
    tex: {packages: {'[+]': ['color']}}
  }
});
</script>
"
)

mathjax_color <- function(name) {
  colors <- paste0("      ", name, ": [\"{\\\\color{", name, "}{#1}}\", 1]")

  if (length(colors) == 1) {
    return(colors)
  }

  c(
    paste0(colors[-length(colors)], ","),
    colors[length(colors)]
  )
}

mathjax <- function(colors) {
  c(
    mathjax_config[1],
    mathjax_color(names(colors)),
    mathjax_config[2]
  )
}
