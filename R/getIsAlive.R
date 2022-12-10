#' Get Is Alive
#'
#' Checks if ElOverblik endpoint is alive.
#' If we are experiencing more traffic than we can handle, this endpoint may return HTTP 503. The status currently
#' refreshes every 60 seconds.
#'
#' @return "true" or an http status code
#'
#' @export
getIsAlive <- function() {
  url <- pkg.env$andelenergi.url
  path <- "/customerapi/api/isalive"

  endpoinntIsAlive <-
    httr::GET(
      url = url,
      path = path)

  if (endpoinntIsAlive$status_code == "200") {
    rawToChar(endpoinntIsAlive$content)
  } else {
    print(sprintf("Error code: %d",endpoinntIsAlive$status_code))
  }


  }
