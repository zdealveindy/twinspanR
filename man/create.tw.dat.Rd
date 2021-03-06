% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create.tw.dat.r
\name{create.tw.dat}
\alias{create.tw.dat}
\title{Creates \code{tw.dat} file with parameters of TWINSPAN analysis}
\usage{
create.tw.dat(
  input.file = "tw.cc!",
  omit.samples = -1,
  no.cut.levels = length(cut.levels),
  cut.levels = c(0, 2, 5, 10, 20),
  min.group.size = 5,
  max.no.ind = 7,
  max.no.sp.table = 100,
  levels = 6,
  long.output = 1,
  diagram = 0,
  machine.readable.output = 1,
  pseudosp.weights = -1,
  indicator.potential = -1,
  ommited.species = -1,
  samples.weights = -1,
  species.weights = -1
)
}
\arguments{
\item{input.file}{Input file with data (default = \code{"tw.cc!"}, should not be changed).}

\item{omit.samples}{Which samples should be omitted from analysis? (default = -1, meaning no samples omitted)}

\item{no.cut.levels}{How many pseudospecies cut levels? (default = \code{length (cut.levels)}, should not be changed)}

\item{cut.levels}{Pseudospecies cut levels (default = \code{c(0,2,5,10,20)}). Should not exceed 9 cut levels.}

\item{min.group.size}{Minimum size of the group, which should not be further divided (default = 5).}

\item{max.no.ind}{Maximum number of indicator species (default = 7, should be between 0 and 15).}

\item{max.no.sp.table}{Maximum number of species in the output table stored in \code{tw.TWI} file (default = 100, should be between 0 and 1000).}

\item{levels}{Number of hierarchical levels of divisions (default = 6, should be between 0 and 15).}

\item{long.output}{Should the long output be produced? (default = 1, means yes)}

\item{diagram}{Should the diagram be appended in output? (default = 0, means no)}

\item{machine.readable.output}{Should the machine readable output be created? (default = 1, means yes, and should not be changed, othewise the result cannot be read back to R)}

\item{pseudosp.weights}{Weights for pseudospecies.}

\item{indicator.potential}{Indicator potential for cut levels.}

\item{ommited.species}{Numbers (not names) of species which should be omitted from the list of potential indicators.}

\item{samples.weights}{Weights of samples.}

\item{species.weights}{Weights of species.}
}
\value{
Creates file \code{tw.dat} in the subdirectory \code{exec} of the \code{twinspan} library folder. This file contains all parameters needed to setup the TWINSPAN algorithm, and is loaded into \code{twinspan.exe} together with the community data (reformated into condensed format and stored in \code{tw.cc!}).
}
\description{
Internal function used to generate file \code{tw.dat} file with parameters entering \code{twinspan.exe}. Contains all TWINSPAN parameters which could be modified (also via the function \code{\link{twinspan}}).
}
\author{
David Zeleny (zeleny.david@gmail.com)
}
