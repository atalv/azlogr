test_that("if incorrect authorization generate warning", {
  mockery::stub(logger_level, ".post_data", list(status_code = 300))
  mockery::stub(logger_level, "httr::content", "testmock")
  expect_warning(logger_level(logger::INFO, "logging message info",
                              log_to_azure = TRUE),
                 "Could not post to Azure log analytics")
})
test_that("posting to AZ log analytics works", {
  mockery::stub(logger_level, ".post_data", list(status_code = 200))
  expect_error(logger_level(logger::INFO, "logging message info",
                            log_to_azure = TRUE),
               NA)
})
test_that("catch error as warn if POST to AZ unsuccessful, console print ok", {
  expect_warning(logger_level(logger::INFO, "logging message",
                              log_to_azure = TRUE),
                 "Some error happened while sending POST request",
                 ignore.case = TRUE)
  expect_match(capture.output(logger_info("logging message info",
                                          log_to_azure = FALSE),
                              type = "message"),
               "logging message info")
})
test_that("logging to console works", {
  expect_match(capture.output(logger_info("logging message info",
                                          log_to_azure = FALSE),
                              type = "message"),
               "logging message info")
  expect_match(capture.output(logger_warn("logging message warn",
                                          log_to_azure = FALSE),
                              type = "message"),
               "logging message warn")
  expect_match(capture.output(logger_error("logging message error",
                                           log_to_azure = FALSE),
                              type = "message"),
               "logging message error")
})
test_that("additional field works", {
  set_log_config(c("level", "msg", "country", "state"),
                 list(country="in", state="hr"))
  expect_match(capture.output(logger_info("logging message info",
                                          log_to_azure = FALSE),
                              type = "message"),
               "logging message info.+country.+in.+state.+hr")
  set_log_config()
})
test_that("enforce ascii works", {
  set_log_config(enforce_ascii = TRUE)
  expect_match(capture.output(logger_info("logging non-ascii Żzz",
                                          log_to_azure = FALSE),
                              type = "message"),
               "logging non-ascii <U\\+017B>zz")
  set_log_config(enforce_ascii = FALSE)
  expect_match(capture.output(logger_info("logging non-ascii Żzz",
                                          log_to_azure = FALSE),
                              type = "message"),
               "logging non-ascii Żzz")
  set_log_config()
})
