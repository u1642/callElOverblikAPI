#' Validate Request Status
#'
#' Checks if an request have resulted successfully
#'
#' @return "true" or an error message
#'
#' @export
ValidateRequestStatus <- function(list) {
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
