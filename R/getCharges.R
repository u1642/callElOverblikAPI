#' getCharges
#'
#' This set of functions is handling Token
#'
#'
#' @description This function return pricing data
#'

#' @export

getCharges <-
  function(meteringPoint, data_access_token) {
    path <- "/customerapi/api/meteringpoints/meteringpoint/getcharges/"
    url <- pkg.env$andelenergi.url


    meter_jason <-
      jsonlite::toJSON(list(meteringPoints = list(meteringPoint = meteringPoint)))

    meter_data_url <-
      paste(
        url,
        path,
        sep = ""
      )
    print(meter_data_url)

    httr::content(httr::POST(
      url = meter_data_url,
      httr::content_type_json(),
      httr::accept_json(),
      httr::add_headers(Authorization = paste("Bearer ", data_access_token)),
      body = meter_jason,
      encode = "json"
    ))
    #jsonlite::fromJSON(content(charges$content))
  }
