# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

#' Get Metering Point Information
#'
#' This function is not finished yet, but should get all the meering point that i have acess to
#' I haven testet that correct data is returned when retrieving multiple meteringPointID, since I have only access to one
#'
#'
#' @param data_access_token The data_access_token i provided bye get_data_access_token(refreshtoken)
#' @return List the function return a list of objects taht contain datapoint information
#' @export

getMeteringPointInfo <-
  function(data_access_token) {
    path <-
      "/customerapi/api/meteringpoints/meteringpoints?includeAll=true"
    raw_metering_point_info <- httr::GET(
      url = pkg.env$andelenergi.url,
      path = path,
      httr::accept_json(),
      httr::add_headers(Authorization = paste("Bearer ", data_access_token))
    )
    jsonlite::fromJSON(rawToChar(raw_metering_point_info$content))$result
  }

