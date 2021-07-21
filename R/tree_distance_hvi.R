#' Hierarchical Variation of Information distance
#' 
#' Calculate the hierachicical variation of information distance
#' 
#' Explain here how the hierachical variation of information distance works
#' @export
HierachicalVariation <- function (tree1, tree2 = NULL) {
  library(reticulate)
  setwd("..")
  source_python("hit.py")
  VariationInformation <- HVI(tree1,tree2)
  VariationInformation
}
