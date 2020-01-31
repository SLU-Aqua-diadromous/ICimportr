fishing_area <- data.frame(
  SUBDIV = c("22", "23", "24", "25", "26", "27", "28", "29N", "29S", "30", "31"),
  FishingArea = c("27.3.d.22", "27.3.d.23", "27.3.d.24", "27.3.d.25", "27.3.d.26",
                  "27.3.d.27", "27.3.d.28", "27.3.d.29", "27.3.d.29", "27.3.d.30",
                  "27.3.d.31"), stringsAsFactors = FALSE)
#


fleet_key <- read.csv2("data-raw/fleet_key.csv", stringsAsFactors = FALSE,
                  fileEncoding = "ISO-8859-1")
#
usethis::use_data(fishing_area,fleet_key, overwrite = TRUE)
