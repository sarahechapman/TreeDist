#' Hierarchical Variation of Information distance
#' 
#' Calculate the hierachicical variation of information distance
#' 
#' Explain here how the hierachical variation of information distance works
#' @export
HierachicalVariation <- function (tree1, tree2 = NULL) {
  library(reticulate)
  setwd("~")
  source_python("documents/GitHub/TreeDist/R/hit.py")
  treeA <- ape::write.tree(tree1)
  treeB <- ape::write.tree(tree2)
  VariationInformation <- HVI(treeA, treeB)
  VariationInformation
  setwd("~")
}
