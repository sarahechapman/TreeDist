[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)<!--[![Project Status: Inactive – The project has reached a stable, usable state but is no longer being actively developed; support/maintenance will be provided as time allows.](http://www.repostatus.org/badges/latest/inactive.svg)](http://www.repostatus.org/#inactive)-->
[![Build Status](https://travis-ci.com/ms609/TreeDist.svg?branch=master)](https://travis-ci.com/ms609/TreeDist)
[![codecov](https://codecov.io/gh/ms609/TreeDist/branch/master/graph/badge.svg)](https://codecov.io/gh/ms609/TreeDist)
[![CRAN Status Badge](http://www.r-pkg.org/badges/version/TreeDist)](https://cran.r-project.org/package=TreeDist)
[![CRAN Downloads](http://cranlogs.r-pkg.org/badges/TreeDist)](https://cran.r-project.org/package=TreeDist)
[![DOI](https://zenodo.org/badge/98171642.svg)](https://zenodo.org/badge/latestdoi/98171642)

# TreeDist
This package implements a suite of metrics that quantify the topological 
distance between pairs of unweighted phylogenetic trees.  
The metrics generally fall in the category of "generalized Robinson-Foulds
distances": they are based on comparing partitions between trees, and thus
reflect the relationship data within trees, with no reference to branch lengths.

The Robinson-Foulds distance simply tallies the number of bipartition splits
(loosely, clades) that occur in both trees -- any clades that are not perfectly 
identical are assigned a score of zero, however similar or different they are.
By overlooking potential similarities between almost-identical bipartitions, 
this conservative approach has undesirable properties.

'Generalized' RF metrics pair each bipartition in one tree with a similar
bipartition in the other.  Each pair of partitions is assigned a similarity 
score; the sum of these scores in the optimal partition matching 
then describes the similarity between two trees. 

Different ways of calculating the the similarity between a pair of partitions 
lead to different tree distance metrics, implemented in the functions below:


* `MutualClusteringInfo`, `MutualPhylogeneticInfo`
    Smith (forthcoming) scores matchings based on the amount of information
    that one partition contains about the other.  The Mutual Phylogenetic
    Information imposes arboreal matching: i.e. a pair of splits that cannot
    both exist on a single tree are assigned zero similarity.  The Mutual 
    Clustering Information metric is more forgiving, and exhibits more 
    desirable behaviour; it is the recommended metric for tree comparison.
    (Its complement, `VariationOfClusteringInfo`, returns a tree 
    distance.)

* `NyeTreeSimilarity`
    Nye _et al._ (2006)score matchings according to the size of the largest 
    bipartition that is consistent with both of them, normalized against 
    the Jaccard index.
   
* `MatchingSplitDistance` 
    Bogdanowicz and Giaro (2012), and independently Lin _et al._ (2012), count 
    the number of 'mismatched' terminals in a pair of bipartitions.

The package also implements the variation of the path distance 
proposed by Kendal and Colijn (2016) (function `KendallColijn`).

# Installation


Install and load the library from CRAN as follows:
```
#TODO: submit to CRAN!
install.packages('TreeDist')
library('TreeDist')
```

If you're feeling brave, you can install the development version thus:
```r
if(!require(devtools)) install.packages("devtools")
devtools::install_github('ms609/TreeDist')
```
# Documentation

(#TODO will become live on submission to CRAN)
- [Package functions](https://CRAN.R-project.org/package=TreeDist/TreeDist.pdf) reference manual
- [Tree distances](https://CRAN.R-project.org/package=TreeDist/vignettes/tree-distances.html)

# See also

Other tree distance functions are implemented in:

* [ape](http://ape-package.ird.fr/):
    - `cophenetic.phylo`: Cophenetic distance
    - `dist.topo`: Path (topological) distance, Robinson-Foulds distance.
* [phangorn](https://cran.r-project.org/package=phangorn)
    - `treedist`: SPR, Robinson-Foulds and path distances.
* [Quartet](http://ms609.github.io/Quartet/): Quartet and Triplet distances, 
  using the tqDist algorithm.
* [distory] (unmaintained): Geodistic distance

# References

 - #TODO to follow.