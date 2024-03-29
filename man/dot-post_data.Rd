% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/logger_level.R
\name{.post_data}
\alias{.post_data}
\title{Build and send a request to the POST API of 'Azure Log Analytics'}
\usage{
.post_data(customer_id, shared_key, body, log_type)
}
\arguments{
\item{customer_id}{\code{customer_id} of the 'Azure Log Analytics' workspace}

\item{shared_key}{\code{shared_key} of the 'Azure Log Analytics' workspace}

\item{body}{Content or message to be logged in JSON format}

\item{log_type}{Log-Type as defined in 'Azure Log Analytics' document, for
custom logging}
}
\value{
Returns the HTTP response object
}
\description{
Build and send a request to the POST API of 'Azure Log Analytics'
}
