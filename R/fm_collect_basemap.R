#' Collect Basemap Data from BC
#'
#' Collects essential transportation and water related layers for an area of
#' interest from [BC Data](https://catalogue.data.gov.bc.ca).  This function is
#' a wrapper for `bcdata`.
#'
#' @param aoi A `sf` polygon.
#' @param outdir A filepath to where the data should be saved. Either relative
#' to the working directory or an absolute path.
#' @param type desired spatial data structure.  Geopackage (gpkg) is the default.
#'
#' @return Spatial data is saved to the output directory.  A data.frame is returned indicating what data was received.
#'
#' @examples#'
#' fm_collect_basemap(aoi = fm_aoi(), outdir = "./out", type = "gpkg")

#' @export


fm_collect_basemap <- function(aoi, outdir = "./out", type = "gpkg") {

  layers <- baselayers

  return(layers)
}
