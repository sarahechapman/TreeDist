#' Set of maximum distance trees
#' 
#' Sets of trees with _n_ leaves comprising the sequentially-numbered pectinate
#' tree, and _n_ - 1 trees chosen to maximise the sum of the distances between 
#' each pair of trees.
#' 
#' # Distance methods
#' 
#' Distance methods presently calculated include:
#' 
#' - 'ciFarTrees': Clustering information distance: entries 5 to 
#' `r 4L + sum(!sapply(TreeDist::ciFarTrees, is.null))`.
#' 
#' - 'pathFarTrees': Path distance: entries 5 to 
#' `r 4L + sum(!sapply(TreeDist::pathFarTrees, is.null))`.
#' 
#' The Robinson--Foulds metric is not supported, due to its rapid saturation:
#' the maximum distance is too readily encountered.
#' 
#' 
#' # Search procedure
#' 
#' An initial list was obtained by selecting trees at random, in addition to
#' the pectinate tree.  Taking each tree in turn, all trees one TBR or SPR 
#' move away were considered in turn; if the candidate replacement tree led to
#' a greater total distance, it was retained and the next tree considered.
#' This process was repeated until no swap increase distance by greater than a 
#' nominal increment.
#' 
#' As this search process is heuristic, it is possible that a set of trees
#' with a larger total distance exists.
#' 
#' @name maximum-distance-trees
#' @template MRS
#' @keywords data
NULL

#' @rdname maximum-distance-trees
'ciFarTrees'

#' @rdname maximum-distance-trees
'pathFarTrees'