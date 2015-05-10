# twinspanR

## UNDER CONSTRUCTION!

<<<<<<< HEAD
This package implements the TWINSPAN classification method (Hill 1979) and it's modified version (Rolecek et al. 2009) into R. Along to being a simple wrapper around twinspan.exe file compiled by Stephan M. Hennekens and later modified by Petr Smilauer (and based on original FORTRAN code written by Mark O. Hill), it contains also Ellenbergs dataset about Danube meadow vegetation (used as example in first TWINSPAN publication by Hill 1979).

For more details see my blog post (). For more examples and tutorials, see website for analysing community ecology data in R (http://www.davidzeleny.net/anadat-r/doku.php/en:hier-divisive).

The library twinspanR can be installed from GitHub repository, using the function install_github from package devtools:
=======
####Authors: David Zelený, Petr Šmilauer and Mark O. Hill (...)

R package implementing the TWINSPAN classification method (Hill 1979) and it's modified version (Roleček et al. 2009). Along to being a simple wrapper around twinspan.exe file compiled by Petr Šmilauer (and based on original FORTRAN code written by Mark O. Hill), it contains also Ellenberg's dataset of Danube meadow vegetation (used as example in first TWINSPAN publication by Hill 1979).

For more details, examples and tutorials, see http://davidzeleny.net/wiki/doku.php/twinspan:start (not working yet).

For some background thoughts, see the blog post (not published yet).

To install:
>>>>>>> a6ac836c57abf6980ee92212ed49d5f3d9e11f00

```{r}
install.packages ('devtools')
devtools::install_github("zdealveindy/twinspanR")
```

<<<<<<< HEAD
To run a simple example, use:
```{r}
library (twinspanR)
example (twinspan)
```
=======
and to run examples:
```{r}
library (twinspanR)
example (twinspan)
```
>>>>>>> a6ac836c57abf6980ee92212ed49d5f3d9e11f00
