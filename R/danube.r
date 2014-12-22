#' @title Danube Meadow Dataset (Ellenberg)
#' 
#' @description Vegetation samples of meadow communities, sampled in the wide surrounding of Danube river valley in southern Germany (Ellenberg 1956).
#' 
#' @details
#' 
#' Dataset represents an example of phytocoenological data of meadow communities, sampled along the gradient of increased biomass of Arrhenatherum elatius. Biomass (not cover) of each species was estimated, using the approach of Knapp (1929) - as a percentage proportion of total biomass, estimated for the whole plot (estimations were checked against real weightings of fresh biomass in the field). Therefore, sum of species values in each plot are close to 100 percent; the percentage proportion of openings within the plots were also recorded, together with plot area and hay yield (see Environmental data).
#' 
#' The original table contains 25 plots (10-25 m2) and 94 species. In the original table, samples are sorted along increasing dominance of Arrhenatherum elatius. In Mueller-Dombois & Ellenberg (1974), three vegetation types are distinguished using manual table sorting (for details see Environmental variables).
#' 
#' This dataset has been used in numerous studies to demonstrate functionality of various methods of analysing community data. Hill (1979) used it as an example dataset for TWINSPAN, Hill & Gauch (1980) used it to demonstrate DCA.
#' 
#' Environmental variables include:
#' \itemize{
#' \item \code{area}  Releve area [m2]
#' \item \code{openings}	Openings in vegetation [\% area]
#' \item \code{yield}	Hay yield [kgx100/ha]
#' \item \code{veg.type}	Vegetation type (A, B, C or D, see details below)
#' \item \code{Light, Temp, Cont, Moist, React, Nutr}	Mean Ellenberg indicator values for light, temperature, continentality, moisture, soil reaction and nutrients (calculated as mean of species indicator values not weighted by species biomass)}
#' Vegetation types (variable \code{danube$env$veg.type}) are according to Table 9.7 in Mueller-Dombois & Ellenberg (1974). The codes A, B and C stands for:
#' \itemize{
#' \item A - \emph{Bromus-Arrhenatherum} community
#' \item B - \emph{Geum-Arrhenatherum} community
#' \item C - \emph{Cirsium-Arrhenatherum} community
#' \item D - releve 19, which has been deleted from the original Ellenberg's table, since its composition is quite different (contains \emph{Arrhenatherum elatius} and \emph{Festuca pratensis}, but other dominant species are \emph{Phalaris arundinacea} and \emph{Glyceria fluitans})}
#' @usage data (danube)
#' @format
#'  \code{danube} is a structured list with these items:
#'  \itemize{
#'  \item \code{spe} Compositional matrix of all species (sample x species, \% biomass)
#'  \item \code{env} environmental (header) variables, including calculated mean Ellenberg indicator values
#'  \item \code{ell} list of species Ellenberg indicator values for all species (species x indicator values, according to Ellenberg et al. 1992)}
#' @name danube
#' @docType data
#' @author Ellenberg (1956), Mueller-Dombois & Ellenberg (1974). Data used here comes from R package \code{dave} written by Otto Wildi (dataset \code{mveg}) with source citing also Mueller-Dombois & Ellenberg (1974). Species names have been changed from abbreviations used in \code{dave} into full names according to the Mueller-Dombois & Ellenberg (1974). 
#' @references
#' 
#' Ellenberg H. (1956): Aufgaben und Methoden in der Vegetationskunde. In: H. Walter, Einfuhrung in die Phytologie IV/1, Stuttgart.
#' 
#' Ellenberg H., Weber H.E., Dull R., Wirth V., Werner W. & Paulissen D. (1992): Zeigerwerte von Pflanzen in Mitteleuropa. \emph{Scripta Geobotanica}, 18: 1-248.
#' 
#' Hill M.O. (1979): \emph{TWINSPAN: A FORTRAN Program for Arranging Multivariate Data in an Ordered Two-way Table by Classification of the Individuals and Attributes.} Cornell University, Ithaca, NY.
#' 
#' Hill M.O. & Gauch H.G. (1980): Detrended correspondence analysis: An improved ordination technique. \emph{Vegetatio}, 42: 47-58. 
#' 
#' Mueller-Dombois D. & Ellenberg H. (1974): \emph{Aims and Methods of Vegetation Ecology}. John Wiley & Sons, New York, Chichester, Brisbane, Toronto.
NULL