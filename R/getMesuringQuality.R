#' getMesuringQuality
#'
#' This function translate from the quality code A1 .. A5 to text
#' Code = A01 DK translation = Korrigeret UK translation = Adjusted Tekst =  Korrigeret
#'
#'
#' @description This functionen can only take one variable, not vector or dataframe, use lapply
#'
#' @param core The quality code from the metering observation
#' @param lang The language you want returned e.g. DK or UK, default = UK
#' @return text Translated quality code
#' @export
getMesuringQuality <- function(code, lang = "UK") {
  # Return the quality text
  index = (Quantity.quality$Code == code)
  result = Quantity.quality[index,lang]

  if(length(result)) {
    return(result)
  } else
  {
    return("ERROR")
  }
}
