#' Cut a TWINSPAN tree into groups of data
#' @author David Zeleny (zeleny.david@@gmail.com)
#' @param tw object created by the function \code{twinspan}
#' @param level the hierarchical level at which the tree should be cut (default is NULL - the level will be set up according to maximum number of levels created by \code{twinspan})
#' @param long.output logical - should the output contain only vector with group assignment (FALSE), or also additional information (TRUE)?
#' @return If \code{long.output = FALSE} returns a vector of the same length as number of samples with assignement of sample into clusters. 
#' If \code{long.output = TRUE}, output is a \code{data.frame} with three columns: 
#' \itemize{
#' \item \code{plot.no} with the original plot number, 
#' \item \code{group} with the assignment to cluster, 
#' \item \code{class} with the binary string created by \code{twinspan.exe} defining the hiearchical relationships of individual samples.}
#' @export
  cutree.tw <- function (tw, level = NULL, long.output = F)
{
  if (is.null (level)) level <- max (unlist (lapply (as.character (tw$classif$class), FUN = function (x) length (unlist (strsplit (x, split = ''))))))-1
  tw.class.level <- as.factor (unlist (lapply (as.character (tw$classif$class), FUN = function (x) substr (x, start = 1, stop = level + 1))))
  plot.no <- tw$classif$plot.no
  group <- as.numeric (tw.class.level)
  class <- tw.class.level
  if (long.output) res <- as.data.frame (list (plot.no = plot.no, group = group, class = class)) else res <- group
  return (res)
}