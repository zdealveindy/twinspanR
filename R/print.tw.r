#' Printing the results of TWINSPAN
#' Generic \code{print} function applicable on object of class \code{tw}, created by function \code{twinspan}. With appropriate setting of its arguments returns detail results of TWINSPAN (including indicator species or two-way sorted table).
#' @param x Object of class \code{'tw'}, created by \code{twinspan} function.
#' @param what Vector of character strings, indicating which part of TWINSPAN output should be printed. Default = NULL (only standard output, i.e. \code{data.frame} with three columns stored in \code{x$classif} is returned). Should be one (or more) of  \code{c('species.names', 'reading.data', 'input.parameters', 'levels', 'table', 'twi')}.
#' @param clusters Vector of integers. For which clusters (in case of modified TWINSPAN) the results should be returned? Default = NULL (i.e. information will be returned for all created clusters).
#' @param ... Arguments passed to default \code{print} function. Not implemented here.
#' @export
print.tw <- function (x, what = NULL, clusters = NULL, ...)
{
  if (is.null (what)) print (x$classif) else 
  {
    WHAT <- c('species.names', 'reading.data', 'input.parameters', 'levels', 'table', 'twi')
    what <- WHAT[pmatch (what, WHAT)]
    if (any (is.na (what))) stop ("Argument 'what' must be one or more of the following: c('reading.data', 'input.parameters', 'levels', 'table', 'twi')")
    if (any (what == 'species.names')) printSPNAMES (x) else printTWI (x, what = what, clusters = clusters)
  }
}

printTWI <- function (tw, what = NULL, clusters = NULL) 
{
  if (what %in% 'twi') what <- c('reading.data', 'input.parameters', 'levels', 'table')  
  if (!tw$modif & !is.null (clusters)) warning ("Argument 'clusters' is ignored, because it is relevant only for modified TWINSPAN (but you have calculated standard TWINSPAN)")
  if (tw$modif & !is.null (clusters)) if (max (clusters) > length (tw$twi)+1 || clusters < 2) stop (paste ("Values in argument 'clusters' must be between 2 and ", length (tw$twi)+1, ".", sep = ''))
  twi <- tw$twi
  if (tw$modif == FALSE) 
  {
    twi <- readTWI (twi)[what]
    cat (unlist (twi), sep = '\n')
  }
  if (tw$modif == TRUE)
  {
    temp <- lapply (X = if (is.null (clusters)) 2:(length (twi)+1) else clusters, FUN = function (l) 
    {
      twi <- readTWI (twi[[l-1]])[what]
      cat (' @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@', sep = '\n')
      cat (paste (' Modified TWINSPAN - step ',l-1, ' (', l,' clusters)', sep = ''), sep = '\n')
      cat (unlist (twi), sep = '\n')
    })
  }
}


readTWI <- function (twi)
{
  separators <- which (twi %in% c(' \f', '\f Input parameters:'))
  twi.temp <- list ()
  twi.temp$reading.data <- twi [1:(separators[1])-1]
  twi.temp$input.parameters <- twi [(separators[1]+1):(separators[2]-1)]
  twi.temp$levels <- twi[(separators[2]+1):(separators[3]-1)]
  twi.temp$table <- twi[(separators[3]+1):length (twi)]
  return (twi.temp)
}

printSPNAMES <- function (tw) tw$spnames
