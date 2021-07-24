#' Hierarchical Variation of Information distance
#' 
#' Calculate the hierachicical variation of information distance
#' 
#' Explain here how the hierachical variation of information distance works
#' @export
#' @import reticulate
HierachicalVariation <- function (tree1, tree2=NULL) {
  library(reticulate)
  source_python(system.file('hit.py', package='TreeDist'))
  treeA <- ape::write.tree(tree1)
  treeB <- ape::write.tree(tree2)
  VariationInformation <- HVI(treeA, treeB)
  VariationInformation
}