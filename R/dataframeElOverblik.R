#' getTimeSeriesData
#'
#' This set of functions is handling Token
#'
#'
#' @description This function retrieves timesere data from ElOverblik
#'
#' @return dataframe Function returns dataframe, the DF doen contains but ensures at al modules uses the same FD
#' @export
dataframeElOverblik <-
  function() {
    df <- stats::setNames(
      data.frame(matrix(ncol = 7, nrow = 0)),
      c(
        "meter",
        "start",
        "end",
        "position",
        "resolution",
        "quantity",
        "quality"
      )
    )
    df$start <- as.POSIXct(df$start)
    df$end <- as.POSIXct(df$end)

    # Return dataframe template
    return(df)
  }
