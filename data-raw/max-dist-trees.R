library("TreeTools", quietly = TRUE, warn.conflicts = FALSE)
library("TreeSearch")

nTip <- 10
set.seed(0)

FindFarTrees <- function (nTip, Distance = TreeDist::ClusteringInfoDistance,
                      tolerance = 0.01) {
  
  pegs <- c(PectinateTree(nTip),
            structure(lapply(rep(nTip, nTip - 1), RandomTree, TRUE),
                      class = 'multiPhylo'))
  score <- sum(Distance(pegs))
  message(signif(score, 5), " is initial score on ", nTip, " leaves.")
  
  repeat {
    oldScore <- score
    for (i in seq_along(pegs)[-1]) {
      moves <- TBRMoves(pegs[[i]])
      newPegs <- pegs
      moveOrder <- sample(seq_along(moves))
      for (j in seq_along(moveOrder)) {
        newPegs[[i]] <- moves[[moveOrder[j]]]
        newScore <- sum(Distance(newPegs))
        if (newScore > score) {
          score <- newScore
          pegs <- newPegs
          message(signif(score, 5), " is new best score at tree ", i, " TBR swap ", j)
          break
        }
      }
    }
    message(signif(score, 5), " found on ", nTip, " leaves after TBR round.\n")
    
    for (i in seq_along(pegs)[-1]) {
      moves <- TreeSearch:::SPRMoves(pegs[[i]])
      newPegs <- pegs
      moveOrder <- sample(seq_along(moves))
      for (j in seq_along(moveOrder)) {
        newPegs[[i]] <- moves[[moveOrder[j]]]
        newScore <- sum(Distance(newPegs))
        if (newScore > score) {
          score <- newScore
          pegs <- newPegs
          message(signif(score, 5), " is new best score at tree ", i, " SPR swap ", j)
          break
        }
      }
    }
    message(signif(score, 5), " found on ", nTip, " leaves after SPR round.\n")
    if (score <= oldScore + tolerance) break
  }
  structure(pegs, class = 'multiPhylo', tip.label = TipLabels(nTip))
}

maxN <- 8
data('pathFarTrees')
if (!exists('pathFarTrees')) pathFarTrees <- vector('list', maxN)
for (i in 5:maxN) {
  if (i > length(pathFarTrees) || is.null(pathFarTrees[[i]])) {
    message("Beginning hunt for path pegs with ", i, " tips")
    pathFarTrees[[i]] <- FindFarTrees(i, TreeDist::PathDist, tolerance = 0.005)
    usethis::use_data(pathFarTrees, overwrite = TRUE)
  }
}

data('ciFarTrees')
if (!exists('ciFarTrees')) ciFarTrees <- vector('list', maxN)
for (i in 5:maxN) {
  if (i > length(ciFarTrees) || is.null(ciFarTrees[[i]])) {
    message("Beginning hunt for CID pegs with ", i, " tips")
    ciFarTrees[[i]] <- FindFarTrees(i, TreeDist::ClusteringInfoDist)
    usethis::use_data(ciFarTrees, overwrite = TRUE)
  }
}
