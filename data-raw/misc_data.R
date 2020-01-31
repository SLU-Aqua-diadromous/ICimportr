fishing_area <- data.frame(
  SUBDIV = c("22", "23", "24", "25", "26", "27", "28", "29N", "29S", "30", "31"),
  FishingArea = c("27.3.c.22", "27.3.c.23", "27.3.c.24", "27.3.c.25", "27.3.c.26",
                  "27.3.c.27", "27.3.c.28", "27.3.c.29", "27.3.c.29", "27.3.c.30",
                  "27.3.c.31"), stringsAsFactors = FALSE)
#


fleet_key <- read.csv2("data-raw/fleet_key.csv", stringsAsFactors = FALSE,
                  fileEncoding = "ISO-8859-1")
#
usethis::use_data(fishing_area,fleet_key, overwrite = TRUE)
