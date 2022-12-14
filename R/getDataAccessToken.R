#' getDataAccessToken
#'
#' This set of functions is handling Token
#'
#'
#' @description Authentication and authorization are handled by using bearer tokens. To get started a refresh token is required. A refresh token for customer API access can be created in the Eloverblik web portal after logging in with NemID as a private or business customer. The token is a long text string (JWT token), which must be copied and stored for use with the system that needs to ac-cess the API. When a refresh token is obtained, the token endpoint can be accessed to create a short-lived data access token (valid for 24 hours).
#'
#' @param refreshtoken The refesh toke should be created at andelenergi.dk
#' @return data_access_token This is the token you have to use for each call to andelenergi API
#' @export

getDataAccessToken <- function(refreshtoken) {
  token <- refreshtoken
  url <- pkg.env$andelenergi.url
  path <- "/customerapi/api/token"

    raw_data_access_token <-
    httr::GET(
      url = url,
      path = path,
      httr::accept_json() ,
      httr::add_headers(Authorization = paste("Bearer ", token)))

  jsonlite::fromJSON(rawToChar(raw_data_access_token$content))$result
}


