#' Creates \code{tw.dat} file with parameters of TWINSPAN analysis
#' 
#' Internal function used to generate file \code{tw.dat} file with parameters entering \code{twinspan.exe}. Contains all TWINSPAN parameters which could be modified (also via the function \code{\link{twinspan}}).
#' @author David Zeleny (zeleny.david@@gmail.com)
#' @param input.file Input file with data (default = \code{"tw.cc!"}, should not be changed).
#' @param omit.samples Which samples should be omitted from analysis? (default = -1, meaning no samples omitted)
#' @param no.cut.levels How many pseudospecies cut levels? (default = \code{length (cut.levels)}, should not be changed)
#' @param cut.levels Pseudospecies cut levels (default = \code{c(0,2,5,10,20)}). Should not exceed 9 cut levels.
#' @param min.group.size Minimum size of the group, which should not be further divided (default = 5).
#' @param max.no.ind Maximum number of indicator species (default = 7, should be between 0 and 15).
#' @param max.no.sp.table Maximum number of species in the output table stored in \code{tw.TWI} file (default = 100, should be between 0 and 1000).
#' @param levels Number of hierarchical levels of divisions (default = 6, should be between 0 and 15).
#' @param long.output Should the long output be produced? (default = 1, means yes)
#' @param diagram Should the diagram be appended in output? (default = 0, means no)
#' @param machine.readable.output Should the machine readable output be created? (default = 1, means yes, and should not be changed, othewise the result cannot be read back to R)
#' @param pseudosp.weights Weights for pseudospecies.
#' @param indicator.potential Indicator potential for cut levels.
#' @param ommited.species Numbers (not names) of species which should be omitted from the list of potential indicators.
#' @param samples.weights Weights of samples.
#' @param species.weights Weights of species.
#' @return Creates file \code{tw.dat} in the subdirectory \code{exec} of the \code{twinspan} library folder. This file contains all parameters needed to setup the TWINSPAN algorithm, and is loaded into \code{twinspan.exe} together with the community data (reformated into condensed format and stored in \code{tw.cc!}).
#' @export
create.tw.dat <- function (input.file = 'tw.cc!', omit.samples = -1, no.cut.levels = length (cut.levels), cut.levels = c(0,2,5,10,20), min.group.size = 5, max.no.ind = 7, max.no.sp.table = 100, levels = 6, long.output = 1, diagram = 0, machine.readable.output = 1, pseudosp.weights = -1, indicator.potential = -1, ommited.species = -1, samples.weights = -1, species.weights = -1)
{
  if (min.group.size < 2 || min.group.size > 10000) stop ('Min.group.size must be in range between 2 and 10.000!')
  cat (input.file,
       omit.samples,
       no.cut.levels,
       paste (cut.levels, collapse = ' '),
       min.group.size,
       max.no.ind,
       max.no.sp.table,
       levels,
       long.output,
       diagram,
       machine.readable.output,
       pseudosp.weights,
       indicator.potential,
       ommited.species,
       samples.weights,
       species.weights,
       file = 'tw.dat', sep = '\n')
}