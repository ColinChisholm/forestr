#' Create an area of interest
#'
#' Creates an area of interest interactively.  Simply call the function
#'
#' @param extent An sf object to define the extent
#' @param basemap a Leaflet basemap. Default is . Other providers include: `CartoDB.Positron`, `Esri.WorldImagery`, `Esri.DeLorme`.  See also: https://leaflet-extras.github.io/leaflet-providers/preview/
#' @param epsg EPSG code for returned projection information.  Defaults to BC Albers (epsg 3005)
#'
#' @return Returns an sf object.
#'
#'
#' @examples
#' aoi <- fm_aoi(extent = bc, epsg = 3005)
#'
#'
#' @export

fm_aoi <- function(extent = bc,
                 basemap = "Esri.WorldImagery",
                 epsg = 3005) {

  aoi <- mapview(bc, hide = T,
                 map.types = c(basemap, "Esri.NatGeoWorldMap" ,"OpenStreetMap.DE")) %>% 
    mapedit::editMap()
  
  aoi <- sf::st_transform(aoi$finished, epsg)
  return(aoi)
}

