#' getTimeSeriesData
#'
#' This set of functions is handling Token
#'
#'
#' @description This function retrieves timesere data from ElOverblik
#'
#' @param meter This is your meter number
#' @param period This is the period fetched from getTimeSerie
#' @return dataframe Returns dataframe with observations
#' @export
extractPeriodObservations <- function(meter, period) {
  observation <-
    pkg.env$dataframeElOverblik()

  for (d in period) {
    start_date <-
      as.POSIXct(d$timeInterval$start, format = "%Y-%m-%dT%H:%M:%OSZ", tz = "UTC")
    end_date <-
      as.POSIXct(d$timeInterval$end, format = "%Y-%m-%dT%H:%M:%OSZ", tz = "UTC")

    resolution <- d$resolution

    for (p in d$Point) {
      point_observation <- dataframeElOverblik

      # We are adding data to an data frame outside the function
      # This need to be changed since we cant write to the parrent scope
      observation[nrow(observation) + 1, ] <- point_observation
    }
  }
  observation
}
