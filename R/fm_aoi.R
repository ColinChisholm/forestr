#' Create an area of interest
#'
#' Creates an area of interest interactively.  Simply call the function
#'
#' @param xmin,xmax longitude minimum and maximum extents (negative for west)
#' @param ymin,ymax latitude minimum and maximum extents in degrees (negative for south)
#' @param basemap a Leaflet basemap
#'
#' @return Returns an sf object.
#'
#' @examples
#'aoi <- fm_aoi(xmin = -139, ymin = 49, xmax = -114, ymax = 60)
#'
#'
#' @export

fm_aoi <- function(xmin = -139, ymin = 49, xmax = -114, ymax = 60,
                 basemap = "GeoportailFrance.orthos") { ##Other Providers: "CartoDB.Positron", "Esri.WorldImagery", "Esri.DeLorme"
  d <- leaflet::leaflet() %>%
    leaflet::fitBounds(xmin, ymin,  xmax, ymax, options = list()) %>%     ## set to extent of BC
    leaflet::addProviderTiles(basemap) %>%
    mapedit::editMap()
  return(d$finished)
}
