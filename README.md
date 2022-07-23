# twinspanR

### Author: David Zelený

This package implements the TWINSPAN classification method (Hill 1979) and it's modified version (Roleček et al. 2009) into R. The library is a simple wrapper around twinspan.exe file (taken from JUICE software, Tichý 2002), which was compiled by Stephan M. Hennekens and later modified by Petr Šmilauer (and based on original FORTRAN code written by Mark O. Hill). It contains also Ellenberg's dataset about Danube meadow vegetation (used as example in first TWINSPAN publication by Hill 1979).

To use this library on operating system other than Microsoft Windows,
you must install [WineHQ](https://wiki.winehq.org/Download).
The reason is that internally, the library is using twinspan.exe, Microsoft Windows executable file, which will not run under different operating system.

For more details see the blog post (https://davidzeleny.wordpress.com/2015/05/10/twinspan-in-r/). For more examples and tutorials, see website for analysing community ecology data in R (http://www.davidzeleny.net/anadat-r/doku.php/en:hier-divisive).

The library twinspanR can be installed from GitHub repository, using the function install_github from package devtools (note that it works only on Windows and cannot be installed on other operating systems, see above). Prior to the installation, you need to manually install the packages riojaExtra from GitHub (works for R version 3.6.0 and later):

```{r}
install.packages ('devtools') # if you don't have it installed yet
devtools::install_github("nsj3/riojaExtra")
devtools::install_github("zdealveindy/twinspanR")
```

To run a simple example, use:
```{r}
library (twinspanR)
example (twinspan)
```

## References
* Hill M.O. (1979): TWINSPAN: A FORTRAN Program for Arranging Multivariate Data in an Ordered Two-way Table by Classification of the Individuals and Attributes. Cornell University, Ithaca, NY.
* Roleček J., Tichý L., Zelený D. & Chytrý M. (2009): Modified TWINSPAN classification in which the hierarchy respects cluster heterogeneity. Journal of Vegetation Science, 20:596-602.
