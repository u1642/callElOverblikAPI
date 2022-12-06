#' Get Is Alive
#'
#' Checks if ElOverblik endpoint is alive
#'
#'
#' @examples
#' #bmi.vals <- rnorm(n = 50, mean = 25, sd = 3)
#'
#' @export
#'
getIsAlive <- function() {
  url <- pkg.env$andelenergi.url
  path <- "/customerapi/api/isalive"

  endpoinntIsAlive <-
    httr::GET(
      url = url,
      path = path)

  rawToChar(endpoinntIsAlive$content)
  }
