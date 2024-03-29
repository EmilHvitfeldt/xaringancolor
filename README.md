
<!-- README.md is generated from README.Rmd. Please edit that file -->

# xaringancolor <img src='man/figures/logo.png' align="right" height="139" />

<!-- badges: start -->
<!-- badges: end -->

The goal of xaringancolor is to allow you to change the colors uniformly
across text, equations, and code.

## Installation

You can install the package with:

``` r
# install.packages("devtools")
devtools::install_github("EmilHvitfeldt/xaringancolor")
```

This package will most likely never be put on CRAN.

## How to setup

xaringancolor only contain 1 function; `setup_colors()`. Pass the colors
you want to use in as named arguments. Please be careful and use simple
names, preferably letters only, no numbers, spaces, or other characters.

``` r
library(xaringancolor)
setup_colors(
  red = "red",
  green = "green",
  blue = "blue"
)
```

Running this code includes some lines of code into your clipboard. Paste
this into the beginning of your
[xaringan](https://github.com/yihui/xaringan) document. After you have
done that you can delete the above code, you won’t be needing it
anymore.

## How to use

### HTML

css classes named according to the colors have been created, so if you
want some text to be red you type `.red[my text]` and text inside the
square brackets turn red. This only works for the colors you have
created and you need to put a leading period (.) before the color name
when you use the css class.

### Equations

A LaTeX macro has been created for each color. Use them as follows

``` code
$$\red{Y} = a \blue{X} + b$$
```

and `Y` will be colored red and `X` will be colored blue.

### Code

A variable for each color has been created. These can be used directly
in plots such as with `geom_abline(..., color = red)` but they can also
be used with **flair**.

Start with a named chunk with both `include` and `eval` set to `FALSE`.
This is the code you want to highlight

``` code
``{r mtcars_mean, include=FALSE, eval=FALSE}
lapply(mtcars, mean)
``
```

then you add another chunk with `echo=FALSE` where you use the
`decorate()` to select the previous chunk by name and `flair()` to
denote which parts of the code should be colors which way. Use the color
variables here to achieve uniform coloring throughout the presentation.

``` code
``{r, echo=FALSE}
decorate("mtcars_mean") %>%
  flair("mtcars", color = red) %>%
  flair("mean", color = blue)
``
```

See [this link](https://r-for-educators.github.io/flair/index.html) for
more information on how to use **flair**.

## How it works

The code will look something like the code below and serve 3 main
purposes. The first section defines the LaTeX colors and the second
section uses [Mathjax](https://www.mathjax.org/) to generate LaTeX
macros which allow us to use colors in the equations.

``` code
<div style = "position:fixed; visibility: hidden">
$$\require{color}\definecolor{red}{rgb}{1, 0, 0}$$
$$\require{color}\definecolor{green}{rgb}{0, 1, 0}$$
$$\require{color}\definecolor{blue}{rgb}{0, 0, 1}$$
</div>

<script type="text/x-mathjax-config">
MathJax.Hub.Config({
  TeX: {
    Macros: {
      red: ["{\\color{red}{#1}}", 1],
      green: ["{\\color{green}{#1}}", 1],
      blue: ["{\\color{blue}{#1}}", 1]
    },
    loader: {load: ['[tex]/color']},
    tex: {packages: {'[+]': ['color']}}
  }
});
</script>
```

The third section defines a \<style> tag with sets the colors so we can
use them in the html text.

``` code
<style>
.red {color: #FF0000;}
.green {color: #00FF00;}
.blue {color: #0000FF;}
</style>
```

And the fourth and final section creates a R chunk that sets us up to
use [flair](https://github.com/r-for-educators/flair) package. It loads
the package and defines character vectors that specify the colors.

``` code
``{r flair_color, echo=FALSE}
library(flair)
red <- "#FF0000"
green <- "#00FF00"
blue <- "#0000FF"
``
```
