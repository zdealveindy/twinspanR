#' Cut a TWINSPAN tree into groups of data
#' @author David Zeleny (zeleny.david@@gmail.com)
#' @param x Object of the class \code{'tw'} created by the function \code{twinspan}.
#' @param level The hierarchical level at which the tree should be cut (default is NULL - the level will be set up according to maximum number of levels created by \code{twinspan}). Works for both standard and modified TWINSPAN, but differs in behaviour (see Details).
#' @param clusters Number of resulting clusters (only for results of modified TWINSPAN).
#' @param long.output Logical - should the output contain only vector with group assignment (FALSE), or also additional information (TRUE)?
#' @param ... Arguments passed to default \code{cut} function. Not implemented here.
#' @details Argument \code{level} can be used for results of both standard and modified TWINSPAN, while argument \code{clusters} is applicable only on results of modified TWINSPAN. In the case of modified TWINSPAN the behavior of \code{level} and \code{clusters} differ - the first indicates at which hierarchical level the resulting tree is cut, while the second says how many final groups should be recognized. Since in modified TWINSPAN there is one division at each hierarchical level, the relationship between \code{level} and \code{clusters} is \code{level + 1 = clusters}.
#' 
#'  In case of standard TWINSPAN, number of resulting clusters depends not only on hierarchical level of cutting, but also on other stopping criteria (mainly \code{min.group.size}). Number of groups =< 2^\code{level}.
#'  
#' @return If \code{long.output = FALSE} returns a vector of the same length as number of samples with assignement of sample into clusters. 
#' If \code{long.output = TRUE}, output is a \code{data.frame} with three columns: 
#' \itemize{
#' \item \code{plot.no} with the original plot number, 
#' \item \code{group} with the assignment to cluster, 
#' \item \code{class} with the binary string created by \code{twinspan.exe} defining the hiearchical relationships of individual samples.}

#' @export
cut.tw <- function (x, level = NULL, clusters = NULL, long.output = F, ...)
{
  max.level <- max (unlist (lapply (as.character (x$classif$class), FUN = function (x) length (unlist (strsplit (x, split = ''))))))-1 
  if (!is.null (level) & (level < 0 || level > max.level)) stop (paste ("Argument 'level' must be in range between 0 and ", max.level, sep = ''))
  if (!is.null (clusters) & x$modif & (clusters < 1 || clusters > (max.level + 1))) stop (paste ("Argument 'cluster' must be in range between 1 and ", max.level + 1, sep = ''))
  if (!is.null (clusters) & !x$modif) warning ("Argument 'clusters' was ignored - applies only when the results come from modified TWINSPAN.")
  if (!is.null (clusters) & x$modif) level <- clusters - 1
  if (is.null (level)) level <- max.level
  tw.class.level <- as.factor (unlist (lapply (as.character (x$classif$class), FUN = function (x) substr (x, start = 1, stop = level + 1))))
  plot.no <- x$classif$plot.no
  group <- as.numeric (tw.class.level)
  class <- tw.class.level
  if (long.output) res <- as.data.frame (list (plot.no = plot.no, group = group, class = class)) else res <- group
  return (res)
}

cut.tw0 <- function (x, level = NULL, ...)
{
  tw.class.level <- as.factor (unlist (lapply (as.character (x$classif$class), FUN = function (x) substr (x, start = 1, stop = level + 1))))
  group <- as.numeric (tw.class.level)
  return (group)
}