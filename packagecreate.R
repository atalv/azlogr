# package tree -----------------------------------------------------

fs::dir_tree(recurse = 2, regexp="docs|packagecreate.R|metastore_db|*.Rproj*|*.Rhistory|_pkgdown.yml|figures|sysdata.rda|_snaps", invert=TRUE)


# Create backbone of package ------------------------------------------

# usethis::create_tidy_package("C:\\Users\\atal\\Documents\\rpak\\azlogr")

# • `use_git()`
# • `use_github()`
# • `use_tidy_github()`
# • `use_tidy_github_actions()`
# • `use_tidy_github_labels()`
# • `use_pkgdown_github_pages()

# Proprietary license

# usethis::use_proprietary_license("")

# citation("logger")

# usethis::use_news_md()


# Check package

# library(devtools)
devtools::document()
devtools::test()
devtools::check(manual = TRUE)
devtools::load_all()
devtools::unload()
# devtools::build()
devtools::spell_check()
devtools::release()

# R CMD build
# R CMD check --as-cran

# R manual to pdf
# tinytex::install_tinytex()
# Fix latex package dependency
# tinytex::latexmk(file = "path-to-manual-tex-after-r-cmd-check")

# Add Rstudio pandoc.exe, tinytex pdflatex, and Rscript location to PATH
# rmarkdown::find_pandoc()
# tinytex::tinytex_root()

# create R code

# usethis::use_r("logger_level")
# usethis::use_r("set_log_config")


# Test cases for functions defined under /R

# usethis::use_testthat()
# usethis::use_test("logger_level")
# usethis::use_test("set_log_config")


# Test coverage summary

devtools::unload()
covr::package_coverage()
covr::package_coverage(line_exclusions = list("R/zzz.R"))
# covr::package_coverage(function_exclusions = c(".onAttach"))
# covr::report()
# ?covr::azure
usethis::use_coverage("codecov")

# use_github_action("test-coverage")

# HTML site having all documentation - in addition to package helper manuals

# https://rdocs.netlify.app/articles/rdocs_article.html
devtools::document()
# devtools::build_manual()
# usethis::use_pkgdown()
# usethis::use_lifecycle_badge("experimental")
try(devtools::unload(), silent = TRUE)
devtools::build_readme()
# pkgdown::clean_site()
# pkgdown::build_site()
# pkgdown::build_site(preview = FALSE, override = list(mode = "unreleased"))
pkgdown::build_site(preview = FALSE)
# pkgdown::as_pkgdown()[["version"]]
# pkgdown::build_articles(preview = FALSE)


# Rbuildignore files

# usethis::use_build_ignore("[.]xml$", escape = FALSE)


# lint code

lintr::lint_package()
lintr::lint_package(
  linters = lintr::linters_with_defaults(
    line_length_linter = lintr::line_length_linter(120),
    cyclocomp_linter = lintr::cyclocomp_linter(15),
    object_name_linter = lintr::object_name_linter(c('snake_case'
                                                     # , 'camelCase'
                                                     ))
  ),
  # exclude = 'logger_',
  exclusions = list.files(path='R/', pattern = 'hello_', full.names = TRUE)
)


# Define external package dependencies

# testthat, covr, withr, rmarkdown in suggest?
# usethis::use_package("withr", type = "Suggests", min_version = NULL)
usethis::use_package("testthat", type = "Suggests", min_version = "3.1.0")
usethis::use_package("covr", type = "Suggests", min_version = NULL)
usethis::use_package("rmarkdown", type = "Suggests", min_version = NULL)
usethis::use_package("pkgdown", type = "Suggests", min_version = NULL)
usethis::use_package("mockery", type = "Suggests", min_version = NULL)

usethis::use_package("digest", type = "Imports", min_version = NULL)
usethis::use_package("caTools", type = "Imports", min_version = NULL)
usethis::use_package("httr", type = "Imports", min_version = "1.0.0")
usethis::use_package("logger", type = "Imports", min_version = "0.2.0")
usethis::use_package("jsonlite", type = "Imports", min_version = NULL)


# Vignette article

# usethis::use_article("01_setup", "How to use azlogr")
# usethis::use_vignette("how-to-use-azlogr", "How to use azlogr")

# CI actions?
# usethis::use_github_action("pkgdown")
# usethis::use_github_action("lint")
# usethis::use_github_action("render-rmarkdown")
# usethis::use_github_action("test-coverage")
# usethis::use_github_action("check-release")
# usethis::use_github_action_check_standard()

# ---------------------------------------------------------------------------------------------------------
# unloadNamespace("azlogr")
# remove.packages("azlogr")
