#' extractPeriodObservationsOptimized
#'
#' DO NOT USE THIS FUNCTION, I's for test use only
#' This set of functions extract the time serie data recieved from ger time serie data
#'
#'
#' @description DON'T USE THIS FUNCTION
#'
#' @param meter This is your meter number identifying your meter e.g. "123456789012356789"
#' @param period This is the period fetched from getTimeSerie
#' @return dataframe Returns dataframe with observations
#' @export
extractPeriodObservationsOptimized <- function(meter, period) {
  # Define the data
  observation <- dataframeElOverblik()

  for (d in period) {
    getBasicData(d)

    for (p in d$Point) {
      # We are adding data to an data frame outside the function
      # This need to be changed since we cant write to the parrent scope
      observation[nrow(observation) + 1,] <- getObservation(p)
    }
  }
  observation
}


getBasicData <- function(d) {
  start_date <-
    as.POSIXct(d$timeInterval$start, format = "%Y-%m-%dT%H:%M:%OSZ", tz = "UTC")
  end_date <-
    as.POSIXct(d$timeInterval$end, format = "%Y-%m-%dT%H:%M:%OSZ", tz = "UTC")

  resolution <- d$resolution
}

getObservation <- function(p) {
  point_observation <-
    data.frame(
      meter,
      start_date,
      end_date,
      p$position,
      resolution,
      p$out_Quantity.quantity,
      p$out_Quantity.quality
    )
}
