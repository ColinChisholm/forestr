#' Export Spatial Data to GPX format
#' 
#' Takes an `sf` object and saves in to GPX format for use with GPS units. 
#' 
#' @param input a `sf` object to be saved as GPX.  _NOTE: currently only supports POINT objects
#' @param name  Attribute to use to name the points.
#' @param outname Name of the output file
#' 
#' @return a Boolean to confirm the successsful creation of the output file. 
#' 
#' 

# name <- st_read("~/")
#' @export

fm_export_gpx <- function(input, name, outname) {
  print(paste("this is a test"))
  
  
}
