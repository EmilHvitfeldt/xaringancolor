
<!-- README.md is generated from README.Rmd. Please edit that file -->

# xaringancolor

<!-- badges: start -->
<!-- badges: end -->

The goal of xaringancolor is to allow you to change the colors in a
uniform fashion across text, equations and code.

## Installation

You can install the package with:

``` r
# install.packages("devtools")
devtools::install_github("EmilHvitfeldt/augassign")
```

This package will most likely never be put on CRAN.

## How to setup

xaringancolor only contain 1 function; `setup_colors()`. Pass the colors
you want to use in as named arguments. Please be careful and use simple
names, preferably letters only, no numbers, spaces or other characters.

``` r
library(xaringancolor)
setup_colors(
  orange = "#EF8633",
  blue = "#3381F7",
  red = "red"
)
```

Running this code include some lines of code into your clipboard. Paste
this into the beginning of your
[xaringan](https://github.com/yihui/xaringan) document. After you have
done that you can delete the above code, you won’t be needing it
anymore.

## How to use

### HTML

css classes named accoring to the colors have been created, so if you
want some text to be red you type `.red[my text]` and text inside the
square brackets turn red. This only works for the colors you have
created and you need to put a leading period (.) before the color name
when you use the css class.

### Equations

A LaTeX macro have been created for each color. Use them as follows

``` code
$$\orange{Y} = a \blue{X} + b$$
```

and `Y` will be colored orange and `X` will be colored blue.

### Code

A variable for each color have been created. These can be used directly
in plot such as `geom_abline(..., color = orange)` but they can also be
used with **flair**.

Start off with a named chunk with both `include` and `eval` set to
`FALSE`. This is the code you want to highlight

``` code
``{r mtcars_mean, include=FALSE, eval=FALSE}
lapply(mtcars, mean)
``
```

then you add another chunk with `echo=FALSE` where you use the
`decorate()` to select the previous chunk by name and `flair()` to
denote that which parts of the code should be colors which way. Use the
color variables here to achive uniform coloring throughout the
presentation.

``` code
``{r, echo=FALSE}
decorate("mtcars_mean") %>%
  flair("mtcars", color = orange) %>%
  flair("mean", color = blue)
``
```

See [this link](https://r-for-educators.github.io/flair/index.html) for
more information on how to use **flair**.

## How it works

The code will look something like this the code below and serve 3 main
purposes. The first section defines the LaTeX colors and the second
section uses [Mathjax](https://www.mathjax.org/) to generate LaTeX
macros which allows us to use colors in the equations.

``` code
$$\require{color}\definecolor{orange}{rgb}{0.937254901960784, 0.525490196078431, 0.2}$$
$$\require{color}\definecolor{blue}{rgb}{0.2, 0.505882352941176, 0.968627450980392}$$
$$\require{color}\definecolor{red}{rgb}{1, 0, 0}$$

<script type="text/x-mathjax-config">
MathJax.Hub.Config({
  TeX: {
    Macros: {


     orange: ["{\\color{orange}{#1}}", 1],

     blue: ["{\\color{blue}{#1}}", 1],

     red: ["{\\color{red}{#1}}", 1]


  },
    loader: {load: ['[tex]/color']},
    tex: {packages: {'[+]': ['color']}}
  }
});
</script>
```

The third section defines a &lt;style&gt; tag with sets the colors so we
can use them in the html text.

``` code
<style>
.orange {color: #EF8633;}
.blue {color: #3381F7;}
.red {color: #FF0000;}
</style>
```

And the forth and final section creates a R chunk that sets us up to use
[flair](https://github.com/r-for-educators/flair) package. It loads the
package and defines character vectors which specifies the colors.

``` code
``{r flair_color, echo=FALSE}
library(flair)
orange <- "#EF8633"
blue <- "#3381F7"
red <- "#FF0000"
``
```
