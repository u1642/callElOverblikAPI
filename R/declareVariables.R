#' Global variables
pkg.env <- new.env(parent = emptyenv())
pkg.env$andelenergi.url <- "https://api.eloverblik.dk"


# out_Quantity.quality
A01 <- c(
  "A01",
  "Korrigeret",
  "Adjusted",
  "Will no longer be used after February 2020. Until then it specifies energy quantities 13/13 Doc.19/11830-2 Offentlig/public which are calculated by Dat-aHub."
)

A02 <- c(
  "A02",
  "Mangler",
  "Not available",
  "Specifies that the grid oper-ator has submitted a “miss-ing indicator” to DataHub for the specific position, meaning that the energy quantity is not available. Therefore, no quantity will be returned for the specific position."
)

A03 <- c(
  "A03",
  "Estimeret",
  "Estimated",
  "Specifies that the grid oper-ator has submitted the quantity to DataHub as an estimate."
)

A04 <- c(
  "A04",
  "Målt",
  "As provided",
  "Specifies that the grid oper-ator has submitted the quantity to DataHub as measured."
)


A05 <- c(
  "A05",
  "Ufuldstændig",
  "Incomplete",
  "Is applied to an aggregated energy quantity if at least one of the quantities in-cluded in the aggregation has been submitted to Data-Hub with a “missing indica-tor”, meaning that the quantity is not available (as described under code A02).
"
)

Quantity.quality <- as.data.frame(rbind(c(A01),c(A02),c(A03),c(A04),c(A05)))

pkg.env$Quantity.quality <- Quantity.quality


