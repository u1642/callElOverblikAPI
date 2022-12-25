#' extractPeriodObservations
#'
#' This set of functions extract the time serie data recieved from ger time serie data
#'
#'
#' @description
#'
#' @param meter This is your meter number identifying your meter e.g. "123456789012356789"
#' @param period This is the period fetched from getTimeSerie
#' @return dataframe Returns dataframe with observations
#' @export
extractPeriodObservations <- function(meter, period) {
  observation <- dataframeElOverblik()

  for (d in period) {
    start_date <-
      as.POSIXct(d$timeInterval$start, format = "%Y-%m-%dT%H:%M:%OSZ", tz = "UTC")
    end_date <-
      as.POSIXct(d$timeInterval$end, format = "%Y-%m-%dT%H:%M:%OSZ", tz = "UTC")

    resolution <- d$resolution

    for (p in d$Point) {
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
      # We are adding data to an data frame outside the function
      # This need to be changed since we cant write to the parrent scope
      observation[nrow(observation) + 1,] <- point_observation
    }
  }
  observation
}
