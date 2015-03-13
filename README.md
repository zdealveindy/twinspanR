# twinspanR

## UNDER CONSTRUCTION!

####Authors: David Zelený, Petr Šmilauer and Mark O. Hill (...)

R package implementing the TWINSPAN classification method (Hill 1979) and it's modified version (Roleček et al. 2009). Along to being a simple wrapper around twinspan.exe file compiled by Petr Šmilauer (and based on original FORTRAN code written by Mark O. Hill), it contains also Ellenberg's dataset of Danube meadow vegetation (used as example in first TWINSPAN publication by Hill 1979).

For more details, examples and tutorials, see http://davidzeleny.net/wiki/doku.php/twinspan:start (not working yet).

For some background thoughts, see the blog post (not published yet).

To install:

install.packages ('devtools')
devtools::install_github("zdealveindy/twinspanR")

and to run examples:
library (twinspanR)
example (twinspan)
