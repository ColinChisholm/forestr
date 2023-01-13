#' Collect  Data from BC
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
#' @examples
#' fm_collect_basemap(aoi = fm_aoi(), outdir = "./out", type = "geojson")
#' fm_collect_
#' @export


fm_collect_basemap <- function(aoi, outdir = "./out", type = "geojson") {
  
  if(!exists(outdir)) {dir.create(outdir, recursive = TRUE)}
  
  layers <- forestr:::baselayers ## internal data
  
  layers$Received <- as.logical(NA)

  for (i in 1:nrow(layers)) {
    lname <- layers$Name[i]
    lBCID <- layers$BCID[i]
    
    layers$Received[i] <- fm_collect(aoi, outdir, type, lname, lBCID)
  }

  return(layers)
}



fm_collect <- function(aoi, outdir, type, lname, lBCID) {
  
  print(paste("Retrieving: ", lname))

  ## collect the data
  dat <- bcdata::bcdc_query_geodata(lBCID, crs = 3005) %>%
    bcdata::filter(bcdata::INTERSECTS(aoi)) %>%
    bcdata::collect() %>%
    {if(nrow(.) > 0) sf::st_intersection(., aoi) else .}

  if (nrow(dat) == 0) {
    print(paste0("No ", lname, " features in the area of interest."))
    return(FALSE)
  } else{

    sf::st_write(dat,
                 dsn = paste0(outdir, lname, ".", type),
                 layer = lname,
                 delete_dsn = TRUE)
    return(TRUE)
  }
}




