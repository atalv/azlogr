
<!-- README.md is generated from README.Rmd. Please edit that file -->

# azlogr

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/azlogr)](https://CRAN.R-project.org/package=azlogr)
[![Codecov test
coverage](https://codecov.io/gh/atalv/azlogr/branch/main/graph/badge.svg)](https://app.codecov.io/gh/atalv/azlogr?branch=main)
<!-- badges: end -->

The goal of `azlogr` is to enable logging in R and easily send the
logging messages to Azure Log Analytics workspace in real-time. It also
shows the logging message on R console, which makes it easier to see the
logs in the same pace where R codes are executed. It will be easier for
somebody to retrieve the historical logs in Azure Log Analytics, if
needed, and compare.

This is an extension of the `logger` package, see this article:
`vignette("Intro", package = "logger")` for an introduction about that
package. You may set the logging threshold using
`logger::log_threshold()` function from `logger` package while
initiating a session.

Moreover, there is an option provided to add additional custom meta-data
while logging, which can be helpful at times.

## Installation

You can install the development version of azlogr from
[GitHub](https://github.com/) with:

``` r
install.packages("devtools")
devtools::install_github("atalv/azlogr")
```

## Example

Below is shown a simple way to use the logging mechanism.

``` r
library(azlogr)
logger_info("logging info", log_to_azure = FALSE)
```

Please refer the vignette article `vignette("how-to-use-azlogr")` to
know more on how to configure Azure Log Analytics workspace credentials
and use this package.