# twinspanR

###Authors: David Zeleny, Stephan M. Hennekens, Petr Smilauer & Mark O. Hill

This package implements the TWINSPAN classification method (Hill 1979) and it's modified version (Rolecek et al. 2009) into R. Along to being a simple wrapper around twinspan.exe file compiled by Stephan M. Hennekens and later modified by Petr Smilauer (and based on original FORTRAN code written by Mark O. Hill), it contains also Ellenbergs dataset about Danube meadow vegetation (used as example in first TWINSPAN publication by Hill 1979).

For more details see my blog post (https://davidzeleny.wordpress.com/2015/05/10/twinspan-in-r/). For more examples and tutorials, see website for analysing community ecology data in R (http://www.davidzeleny.net/anadat-r/doku.php/en:hier-divisive).

The library twinspanR can be installed from GitHub repository, using the function install_github from package devtools:

```{r}
install.packages ('devtools')
devtools::install_github("zdealveindy/twinspanR")
```

To run a simple example, use:
```{r}
library (twinspanR)
example (twinspan)
```