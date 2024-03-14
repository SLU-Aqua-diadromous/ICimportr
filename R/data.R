#' Table to map SUBDIV to FishingArea
#'
#' \describe{
#' \item{SUBDIV}{character, ICES subdivisions in the Baltic sea}
#' \item{FishingArea}{character, corresponding fishing area used in Intercatch}
#' }
"fishing_area"

#' Table to map HaV REDSKKOD to WGBAST metier
#'
#' \describe{
#' \item{metier}{character, metier used in Intercatch defined by WGBAST}
#' \item{gear}{character, gear name in Swedish defined by HaV}
#' \item{gear_code}{numeric, gear code defined by HaV}
#' \item{UnitEffort}{character, code for the unit for effort used for this gear type. Used in Intercatch (defined by WGBAST)}
#' }
"fleet_key"
