#' Generate One or several Header Information (HI) records
#'
#' \code{HI_record} returns comma separated text line(s) to be used in a files imported into
#' ICES InterCatch database. See  \url{http://datsu.ices.dk/web/selRep.aspx?Dataset=76}.
#' To reduce the risk of enter data in the wrong place we recommend that you always use
#' named parameter list when calling this function
#'
#' @param Country character vector (mandatory)
#' @param Year numeric vector (mandatory)
#' @param SeasonType character vector. Keywords defined by ICES see doc (mandatory)
#' @param Season numeric vector (mandatory)
#' @param Fleet character vector. Keywords defined by ICES see doc (mandatory)
#' @param AreaType character vector. Keywords defined by ICES see doc (mandatory)
#' @param FishingArea character vector. Keywords defined by ICES see doc (mandatory)
#' @param DepthRange currently not used. Set to NA by default (optional)
#' @param UnitEffort character vector. Keywords defined by ICES see doc (optional)
#' @param Effort numeric vector (optional)
#' @param AreaQualifier currently not used. Set to NA by default (optional)
#'
#' @return
#' A comma separated text string in InterCatch HI format
#'
#' @examples
#'  HI_record(Country = "SE", Year = 2019, SeasonType = "Month", Season = 6, Fleet = "FYK_C",
#'  AreaType = "SubDiv", FishingArea = "27.d.3.31", UnitEffort = "gd", Effort = NA)
#'
HI_record <- function(Country, Year, SeasonType, Season, Fleet, AreaType, FishingArea,
                      DepthRange = NA, UnitEffort, Effort, AreaQualifier = NA) {
  # InterCatch Header information
  # For each  year, month, fleet, FishingArea combitation in the data the IC-import file
  # have one HI record. Each HI can have one or more SI and SD records describing the catch.
  effort <- ifelse(is.na(Effort), -9, round(Effort,0))
  return(
    sprintf('HI,%s,%d,%s,%d,%s,%s,%s,%s,%s,%d,%s',
            Country, Year, SeasonType, Season, Fleet, AreaType, FishingArea,
            DepthRange, UnitEffort, effort, AreaQualifier)
  )
}

#'  Generate One or several Species Information (SI) records
#'
#' \code{SI_record} returns comma separated text line(s) to be used in a files imported into
#' ICES InterCatch database. See  \url{http://datsu.ices.dk/web/selRep.aspx?Dataset=76}.
#' To reduce the risk of enter data in the wrong place we recommend that you always use
#' named parameter list when calling this function

#' @param Country  character vector (mandatory)
#' @param Year Season numeric vector (mandatory)
#' @param SeasonType  character vector. Keywords defined by ICES see doc (mandatory)
#' @param Season Season numeric vector (mandatory)
#' @param Fleet  character vector. Keywords defined by stock coordinator see doc (mandatory)
#' @param AreaType  character vector. Keywords defined by ICES see doc (mandatory)
#' @param FishingArea  character vector. Keywords defined by ICES see doc (mandatory)
#' @param DepthRange currently not used. Set to NA by default (optional)
#' @param Species  character vector. Keywords defined by ICES see doc (mandatory)
#' @param Stock  character vector. Keywords defined by ICES see doc (default NA)
#' @param CatchCategory  character vector. Keywords defined by ICES see doc (default L)
#' @param ReportingCategory character vector. Keywords defined by ICES see doc (default R)
#' @param DataToFrom character vector. Keywords defined by ICES see doc (default NA)
#' @param Usage  character vector. Keywords defined by ICES see doc (default H)
#' @param SamplesOrigin character vector. Keywords defined by ICES see doc (default NA)
#' @param QualityFlag character vector. Keywords defined by ICES see doc (default NA)
#' @param UnitCATON character vector. Keywords defined by ICES see doc (mandatory)
#' @param CATON numeric vector (mandatory)
#' @param OffLandings numeric vector (optional)
#' @param varCATON numeric vector (optional)
#' @param InfoFleet character vector (optional)
#' @param InfoStockCoordinator character vector (optional)
#' @param InfoGeneral character vector (optional)
#'
#' @return
#'  Comma separated text string(s) in InterCatch SI format
#'
#'
#' @examples
#' SI_record(Country = "SE", Year = 2020, SeasonType = "Month", Season = 6, Fleet = "MIS_R",
#' AreaType = "SubDiv", Fishing Area = "27.d.3.29", Species = "TRS", UnitCATON = "kg", CATON = 16)
SI_record <- function(Country, Year, SeasonType, Season, Fleet, AreaType, FishingArea,
                      DepthRange = NA, Species, Stock = NA, CatchCategory = "L",
                      ReportingCategory = "R", DataToFrom = NA, Usage = "H", SamplesOrigin = NA,
                      QualityFlag = NA, UnitCATON, CATON, OffLandings = -9, varCATON = -9,
                      InfoFleet = NA, InfoStockCoordinator = NA, InfoGeneral = NA) {
  return(
    sprintf('SI,%s,%d,%s,%d,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%.1f,%d,%d,%s,%s,%s',
            Country, Year, SeasonType, Season, Fleet, AreaType, FishingArea,
            DepthRange, Species, Stock, CatchCategory,
            ReportingCategory, DataToFrom, Usage, SamplesOrigin,
            QualityFlag, UnitCATON, round(CATON, 1), OffLandings, varCATON,
            InfoFleet, InfoStockCoordinator, InfoGeneral))
}

#'  Generate One or several Species data (SD) records
#'
#' @param Country  character vector (mandatory)
#' @param Year Season numeric vector (mandatory)
#' @param SeasonType  character vector. Keywords defined by ICES see doc (mandatory)
#' @param Season Season numeric vector (mandatory)
#' @param Fleet  character vector. Keywords defined by stock coordinator see doc (mandatory)
#' @param AreaType  character vector. Keywords defined by ICES see doc (mandatory)
#' @param FishingArea  character vector. Keywords defined by ICES see doc (mandatory)
#' @param DepthRange currently not used. Set to NA by default (optional)
#' @param Species  character vector. Keywords defined by ICES see doc (mandatory)
#' @param Stock  character vector. Keywords defined by ICES see doc (default NA)
#' @param CatchCategory  character vector. Keywords defined by ICES see doc (default L)
#' @param ReportingCategory character vector. Keywords defined by ICES see doc (default R)
#' @param Sex character vector. Keywords defined by ICES see doc (default N)
#' @param CANUMtype character vector. Value "age" or "lngt" (mandatory)
#' @param AgeLength  numeric vector (mandatory)
#' @param PlusGroup  numeric vector (optional)
#' @param SampledCatch numeric vector (optional)
#' @param NumSamplesLngt numeric vector (optional)
#' @param NumSamplesMeas numeric vector (optional)
#' @param NumSamplesAge numeric vector (optional)
#' @param NumAgeMeas numeric vector (optional)
#' @param unitMeanWeight character vector. Value "g" or "kg" (mandatory)
#' @param unitCANUM character vector. Value "k", "m" or "n" (mandatory)
#' @param unitAgeOrLength character vector. Value "cm", "mmm", "wr" or "year" (mandatory)
#' @param UnitMeanLength character vector. Value "cm", "cm" or "na" (default "na")
#' @param Maturity character vector. Value "I", "M" or NA (default NA)
#' @param NumberCaught numeric vector (mandatory)
#' @param MeanWeight numeric vector (mandatory)
#' @param MeanLength numeric vector (optional)
#' @param varNumLanded numeric vector (optional)
#' @param varWgtLanded numeric vector (optional)
#' @param varLgtLanded numeric vector (optional)
#'
#' @return
#'  Comma separated text string(s) in InterCatch SD format
#'
#'
#' @examples
#' SD_record(Country = "SE", Year = 2019, SeasonType = "Month", Season = 7,
#' Fleet = "FYK_C", AreaType = "Subdiv", FishingArea = "27.d.c.29",
#' Species = "SAL", CANUMtype = "age", AgeLength = 0,
SD_record <- function(Country, Year, SeasonType, Season, Fleet, AreaType, FishingArea,
                      DepthRange = NA, Species, Stock = NA, CatchCategory = "L",
                      ReportingCategory = "R", Sex = "N", CANUMtype, AgeLength,
                      PlusGroup = -9, SampledCatch = -9, NumSamplesLngt = -9,
                      NumSamplesMeas = -9, NumSamplesAge = -9, NumAgeMeas = -9,
                      unitMeanWeight, unitCANUM, unitAgeOrLength, UnitMeanLength = "na",
                      Maturity = NA, NumberCaught, MeanWeight, MeanLength = -9,
                      varNumLanded = -9, varWgtLanded = -9, varLgtLanded = -9) {
  return(
    sprintf('SD,%s,%d,%s,%d,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%d,%d,%d,%d,%d,%d,%d,%s,%s,%s,%s,%s,%d,%f,%f,%d,%d,%d',
            Country, Year, SeasonType, Season, Fleet, AreaType, FishingArea,
            DepthRange = NA, Species, Stock = NA, CatchCategory = "L",
            ReportingCategory = "R", Sex = "N", CANUMtype, AgeLength,
            PlusGroup = -9, SampledCatch = -9, NumSamplesLngt = -9,
            NumSamplesMeas = -9, NumSamplesAge = -9, NumAgeMeas = -9,
            unitMeanWeight, unitCANUM, unitAgeOrLength,UnitMeanLength = "na",
            Maturity = NA, NumberCaught, MeanWeight, MeanLength = -9,
            varNumLanded = -9, varWgtLanded = -9, varLgtLanded = -9))
}
