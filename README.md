# Sequential Meta-Analysis Research Trace (SMART)
This repository contains the R code illustrating the Sequential Meta-Analysis Research Trace (SMART), as introduced in The Sequential Nature of Science: Quantifying Learning from a Sequence of Studies (Mikhaeil, Green, & Blei, 2025). [Read the full paper on arXiv](https://arxiv.org/abs/2511.14996).

The code is organized in the following way:

1) Practical Implementation (`Vignette.Rmd`): A guided walkthrough featuring simple examples of how to apply SMART to standard meta-analysis datasets.

2) Reproducibility (`Figures.Rmd`): The exact scripts needed to recreate every figure found in the original paper.

## Installation

Install the required R packages, then install CmdStan:

```r
install.packages(c("tidyverse", "fastDummies", "posterior", "transport", "rstanarm", "gridExtra", "metafor", "knitr", "latex2exp", "rmarkdown"))
install.packages("cmdstanr", repos = c("https://stan-dev.r-universe.dev", getOption("repos")))
cmdstanr::install_cmdstan()
```
