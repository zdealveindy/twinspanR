#' Draws TWINSPAN dendrogram
#' @author David Zeleny (zeleny.david@@gmail.com)
#' @param tw object created by the function \code{twinspan}
#' @param level xxx
plot.tw <- function (tw, level = NULL) 
{
  tw.class.level <- sort (unlist (lapply (as.character (tw$class), FUN = function (x) substr (x, start = 1, stop = level + 1))))
  plot.numbers <- tw$plot.no[order.tw.class.level]
  max.width <- max (unlist (lapply (tw.class.level, FUN = function (x) length (unlist (strsplit (x, split = ''))[-1]))))
  tw.class.m <- matrix (ncol = max.width, nrow = length (tw.class.level), dimnames = list (1:length (tw.class.level), 1:max.width))
  for (ro in 1:length (tw.class.level)) 
  {
    replacement <- as.numeric (unlist (strsplit (tw.class.level[ro], split = ''))[-1])
    tw.class.m[ro, 1:length (replacement)] <- replacement  
  }
  
  co <- 1
  re <- which (diff (tw.class.m[,co])<0)
}


  