#' Get Metering Point Information
#'
#' The purpose of this function is to extract the information related to the Metering Point
#'
#' @description The purpose of this function is to extract the information related to the Metering Point.
#' this extraction provides the following attributes.
#' * \[streetCode\] Street code – part of metering point location address.
#' * \[streetName\] Street name – part of metering point location address.
#' * \[ buildingNumber\] Building number – part of metering point location address.
#' * \[floorId\] Floor id – part of metering point location address.
#' * \[roomId\] Room id – part of metering point location address.postcode String
#' * \[municipalityCode\]
#' * \[locationDescription\]
#' * \[settlementMethod\]
#' * \[firstConsumerPartyName\]
#' * \[secondConsumerPartyName\]
#' * \[settlementMethod\]
#' * \[meterReadingOccurrence\]
#' * \[meterNumber\]
#' * \[meterNumber\]
#' * \[consumerStartDate\]
#' @md
#'
#'
#' meteringPointId,typeOfMP,balanceSupplierName,postcode,cityName,hasRelation,consumerCVR,dataAccessCVR,childMeteringPoints)
#'
#'
#'
#'
#' @param data_access_token The data_access_token i provided by get_data_access_token(refreshtoken)
#' @return A list containing
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

