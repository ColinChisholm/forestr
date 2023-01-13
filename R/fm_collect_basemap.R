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

  layers <- forestr:::baselayers

  layers <- fm_collect(aoi, outdir, type, layers)

  return(layers)
}



fm_collect <- function(aoi, outdir, type, layers) {
  layers$Received <- as.logical(NA)

  if(!exists(outdir)) {dir.create(outdir, recursive = TRUE)}


  ## Collect the data
  for (i in 1:nrow(layers)) {
    # i <- 1
    # print(layers)
    print(layers$Name[i])

    ## collect the data
    dat <- bcdata::bcdc_query_geodata(layers$BCID[i], crs = 3005) %>%
      bcdata::filter(bcdata::INTERSECTS(aoi)) %>%
      bcdata::collect() %>%
      {if(nrow(.) > 0) sf::st_intersection(., aoi) else .}

    if (nrow(dat) == 0) {
      print(paste0("No ", Basemap_dict[i], " features in the area of interest."))
      layers$Recevied[i] <- FALSE
    } else{


      sf::st_write(dat,
                   dsn = paste0(outdir, layers$Name[i], ".", type),
                   layer = layers$Name[i],
                   delete_dsn = TRUE)
      layers$Recevied[i] <- TRUE
    }
  }
  return(layers)
}


