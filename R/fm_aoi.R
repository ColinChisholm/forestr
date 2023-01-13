#' Create an area of interest
#'
#' Creates an area of interest interactively.  Simply call the function
#'
#' @param xmin,xmax longitude minimum and maximum extents (negative for west)
#' @param ymin,ymax latitude minimum and maximum extents in degrees (negative for south)
#' @param basemap a Leaflet basemap. Default is . Other providers include: `CartoDB.Positron`, `Esri.WorldImagery`, `Esri.DeLorme`
#' @param epsg EPSG code for returned projection information.  Defaults to BC Albers (epsg 3005)
#'
#' @return Returns an sf object.
#'
#'
#' @examples
#'aoi <- fm_aoi(xmin = -139, ymin = 49, xmax = -114, ymax = 60, epsg = 3005)
#'
#'
#' @export

fm_aoi <- function(xmin = -139, ymin = 49, xmax = -114, ymax = 60,
                 basemap = "GeoportailFrance.orthos",
                 epsg = 3005) {

  d <- leaflet::leaflet() %>%
    leaflet::fitBounds(xmin, ymin,  xmax, ymax, options = list()) %>%     ## set to extent of BC
    leaflet::addProviderTiles(basemap) %>%
    mapedit::editMap()

  aoi <- sf::st_transform(d$finished, epsg)
  return(aoi)
}

