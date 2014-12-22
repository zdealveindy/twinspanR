#' (Modified) TWINSPAN in R
#' 
#' Calculates TWINSPAN (TWo-way INdicator SPecies ANalaysis) and modified TWINSPAN
#' @author Mark O. Hill wrote the original Fortran code and executable library \code{twinspan.exe}; the R function maintaining communication between R and \code{twinspan.exe} was written by David Zeleny (zeleny.david@@gmail.com).
#' @name twinspan
#' @param com Community data (\code{data.frame} or \code{matrix}).
#' @param modif Should the modified TWINSPAN algorithm be used? (logical, value, default = FALSE, i.e. standard TWINSPAN)
#' @param cut.levels Pseudospecies cut levels (default = \code{c(0,2,5,10,20)}). Should not exceed 9 cut levels.
#' @param min.group.size Minimum size of the group, which should not be further divided (default = 5).
#' @param divisions Number of hierarchical divisions (default = 6, should be between 0 and 15). Applies only for standard TWINSPAN (\code{modif = FALSE}).
#' @param no.clusters Number of clusters generated by modified TWINSPAN (default = 5). Applies only for modified TWINSPAN (\code{modif = TRUE}).
#' @param diss Dissimilarity used to calculate cluster heterogeneity (default = 'bray'); see Details for more information. Applies only for modified TWINSPAN (\code{modif = TRUE}).
#' @param min.diss Minimum dissimilarity under which the cluster will not be divided further (default = NULL, which means that the stopping rule is based on number of clusters (parameter \code{no.clusters})). Currently not implemented.
#' @param mean.median Should be the average dissimilarity of cluster calculated as mean or median of all between sample dissimilarities within the cluster? (default = \code{'mean'}, alternative is \code{'median'})
#' @param ... Other (rarely used) TWINSPAN parameters passed into function \code{\link{create.tw.dat}}
#' @details XXXXX
#' @return \code{twinspan} returns object of the class \code{'tw'}, which has \code{plot} and \code{summary} methods.
#' @references \itemize{
#' \item Hill M.O. (1979): TWINSPAN - A FORTRAN program for arranging multivariate data in an ordered two-way table by classification of the individuals and attributes. Section of Ecology and Systematics, Cornel University, Ithaca, New York. 
#' \item Rolecek J., Tichy L., Zeleny D. & Chytry M. (2009): Modified TWINSPAN classification in which the hierarchy respects cluster heterogeneity. Journal of Vegetation Science, 20: 596-602.
#' }
#' @examples
#' data (danube)
#' res <- twinspan (danube$spe, modif = TRUE, no.clusters = 4)
#' k <- cutree.tw (res)
#' dca <- decorana (danube$spe)
#' par (mfrow = c(1,2))
#' ordiplot (dca, type = 'n', display = 'si', main = 'Modified TWINSPAN')
#' points (dca, col = k)
#' for (i in c(1,2,4)) ordihull (dca, groups = k, show.group = i, col = i,
#'  draw = 'polygon', label = TRUE)
#' ordiplot (dca, type = 'n', display = 'si', main = 'Original assignment\n (Ellenberg 1954)')
#' points (dca, col = danube$env$veg.type)
#' for (i in c(1:3)) ordihull (dca, groups = danube$env$veg.type, 
#'  show.group = unique (danube$env$veg.type)[i], col = i,
#'  draw = 'polygon', label = TRUE)

#' @seealso \code{\link{cutree.tw}}, \code{\link{create.tw.dat}}

#' @export
twinspan <- function (com, modif = F, cut.levels = c(0,2,5,10,20), min.group.size = 5, divisions = 6, no.clusters = 5, diss = 'bray', min.diss = NULL, mean.median = 'mean', ...)
{
 DISS <- c("manhattan", "euclidean", "canberra", "bray", 
               "kulczynski", "gower", "morisita", "horn", "mountford", 
               "jaccard", "raup", "binomial", "chao", "altGower", "cao", 
               "mahalanobis", "total.inertia", "whittaker")
 diss <- DISS[pmatch(diss, DISS)]
 com <- as.data.frame (com)
 species.names <- names (com)
 names (com) <- seq (1, ncol (com))
 if (!modif) classif <- twinspan0 (com, cut.levels = cut.levels, min.group.size = min.group.size, divisions = divisions, ...)
 if (modif) 
 {
   groups01 <- matrix (ncol = no.clusters-1, nrow = nrow (com))
   classif.temp <- list ()
   classif.temp[[1]] <- twinspan0 (com, cut.levels = cut.levels, min.group.size = min.group.size, divisions = 1)
   groups01[,1] <- cutree.tw (classif.temp[[1]], level = 1)-1
   no.clusters.temp <- 2
   while (no.clusters.temp != no.clusters)
   {
    tw.class.level <- as.numeric (as.factor (apply (groups01[, 1:no.clusters.temp-1, drop = F], 1, paste, collapse = '')))
    cluster.heter <- unlist (lapply (sort (unique (tw.class.level)), FUN = function (x) 
    {
      if (diss == 'total.inertia' || diss == 'whittaker') 
        {
        if (diss == 'total.inertia') vegan::cca (com[tw.class.level == x, ])$tot.chi else {com.t <- com > 0; gamma <- sum (colSums (com.t) > 0); alpha <- mean (rowSums (com.t)); (gamma/alpha)-1}
        } else if (mean.median == 'mean') mean (vegan::vegdist (com[tw.class.level == x,], method = diss)) else median (vegan::vegdist (com[tw.class.level == x,], method = diss))
    }))
    sort.by.heter <- sort (unique (tw.class.level))[order (cluster.heter,decreasing = T)]
    no.samples.per.group <- unlist (lapply (sort.by.heter, FUN = function (no) sum (tw.class.level == no)))
    which.most.heter <- sort.by.heter[no.samples.per.group >= min.group.size][1]
    classif.temp[[no.clusters.temp]] <- twinspan0 (com[tw.class.level == which.most.heter,], cut.levels = cut.levels, min.group.size = min.group.size, divisions = 1)
    groups01[,no.clusters.temp] <- groups01[,no.clusters.temp-1]
    groups01[tw.class.level == which.most.heter, no.clusters.temp] <- as.numeric (classif.temp[[no.clusters.temp]]$class)-1
    no.clusters.temp <- no.clusters.temp + 1
   }
   res <- list (order = classif.temp[[1]]$order, plot.no = classif.temp[[1]]$plot.no, class = apply (groups01, 1, FUN = function (x) paste ('*', paste(x, collapse = ''), sep = '')))
   classif <- as.data.frame (res)
   class (classif) <- c('tw', 'data.frame')
 }
 return (classif)
}

twinspan0 <- function (com, cut.levels, min.group.size, divisions, ...)
{
  actual.wd <- getwd ()
  setwd (paste (.libPaths (), '/twinspan/exec/', sep = ''))
  if (is.integer (com[1,1])) com <- sapply (com, as.numeric)  # if the data frame contains integers instead of reals, it converts them to real (because of write.CEP in rioja can't handle integers)
  com <- com[,colSums (com) > 0]
  rioja::write.CEP (com, fName = 'tw.cc!') 
  create.tw.dat (cut.levels = cut.levels, min.group.size = min.group.size, divisions = divisions, ...)
  shell ('tw.bat')
  
  scanned.PUN <- scan (file = 'tw.PUN', what = 'raw')
  if (length (scanned.PUN) == 0) res <- 0 else res <- scanned.PUN[10:(which (scanned.PUN == 'SPECIES')-1)]
  classif <- as.data.frame (matrix (res, ncol = 4, byrow = T))[,-3]
  names (classif) <- c('order', 'plot.no', 'class')
  class (classif) <- c('tw', 'data.frame')
  setwd (actual.wd)
  return (classif)
}  
