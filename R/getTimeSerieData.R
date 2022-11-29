#' getTimeSeriesData
#'
#' This set of functions is handling Token
#'
#'
#' @description This function retrieves timesere data from ElOverblik
#'
#' @param meteringPoint The number you have recieved from you r provider
#' @param data_access_token Data Access Token created by getDataAccessToken
#' @param dateFrom start data from where we retrieve data
#' @param dateTo end date from which we retrieve data, note dateFrom - dateTo should not be greater than 720 days
#' @param aggregation see manual
#' @return data_access_token This is the token you have to use for each call to andelenergi API
#' @export

getTimeSeriesData <-
  function(meteringPoint,
           data_access_token ,
           dateFrom,
           dateTo,
           aggregation = "Actual") {
    path <- "/customerapi/api/meterdata/gettimeseries/"
    url <- pkg.env$andelenergi.url

    # Input validation
    stopifnot(assertive::assert_is_a_string(meteringPoint))
    stopifnot(assertive::assert_is_a_string(data_access_token))
    stopifnot(lubridate::is.POSIXct(dateFrom))
    stopifnot(lubridate::is.POSIXct(dateTo))
    match.arg(aggregation = c("Actual", "Quarter", "Hour", "Day", "Month", "Year"))

    timeseries_data <- data.frame(dateFrom, dateTo, aggregation)
    meter_jason <-
      jsonlite::toJSON(list(meteringPoints = list(meteringPoint = meteringPoint)))

    meter_data_url <-
      paste(
        url,
        path,
        timeseries_data$dateFrom,
        "/",
        timeseries_data$dateTo,
        "/",
        timeseries_data$aggregation,
        sep = ""
      )

    httr::POST(
      url = meter_data_url,
      httr::content_type_json(),
      httr::accept_json(),
      httr::add_headers(Authorization = paste("Bearer ", data_access_token)),
      body = meter_jason,
      encode = "json"
    )
  }
