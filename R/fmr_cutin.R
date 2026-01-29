#' Cut feature in
#'
#' Utility for creating a resultant file.  Cut in a new feature and apply attributes
#'
#' @param rb sf polygon layer -- the current resultant build.  Generally this starts with a forest inventory layer to which new layers are cut in.
#' @param newf sf polygon of a _new feature_ to be added to the resultant.   
#' @param nfid a character string. Name of the feature.  Creates an new field/ column in the output resultant layer.
#' @param nfat Attribute to be populated under nfid.  Field name from `nf`, character string, default is `TRUE`
#'
#' @return Returns an sf object.
#'
#'
#' @examples
#' aoi <- fm_aoi(extent = bc, epsg = 3005)
#'
#'
#' @export

fmr_cutin <- function(rb,
                      newf,
                      nfid,
                      nfat = T) {
  ## add test that the features overlap
  
  ## test set up 
  # library(forestr)
  
  # core <- "~/workspace/2026/ALRF/TSR/data/ALRF_CORE.gpkg"
  # # st_layers(core)
  # vri <- st_read("~/workspace/2026/ALRF/TSR/data/2026-01-14_vri-updated.gpkg")
  # ogma <- st_read(core, "OGMA", quiet = T)
  # ogma <- st_transform(ogma, st_crs(vri))
  # 
  # rslt <- fmr_cutin(vri, ogma, "OGMA", T)
  # 
  # rb <- vri
  # newf <- ogma
  # nfid <- "OGMA"
  # nfat <- T
  # 
  # rb <- rslt
  # newf <- dat
  # nfid <- "t2"
  # nfat <- T
  # # 
  # 
  ## maintain or create attributes
  if (nfat %in% names(newf)) {
    newf <- newf %>% dplyr::select(all_of(nfat))
  } else {
    newf <- newf %>% dplyr::select() 
    newf[nfid] <- nfat
    # newf <- st_as_sf(newf)
  }
  
  ## copy rb data in new feature 
  # newf <- st_union(newf) %>% sf::st_intersection(st_union(rb))
  newf <- newf %>% sf::st_intersection(rb)
  # newf <- st_set_geometry(newf, "POLYGON")
  
  
  
  ## cut out new feature geometry from rb
  rb <- rb %>% sf::st_difference(sf::st_union(newf))
  
  ## FIX geometry naming #######################
  if (attr(rb, "sf_column") != "geometry") {
    rb <- rename_geometry(rb, "geometry")
  }
  
  if (attr(newf, "sf_column") != "geometry") {
    newf <- rename_geometry(newf, "geometry")
  }
  ##############################################
  
  ## add attribute to rb
  rb[nfid] <- NA
  
  
  
  rn <- rbind(rb, newf)

    
  return(rn)
}


rename_geometry <- function(g, name){
  current = attr(g, "sf_column")
  names(g)[names(g)==current] = name
  st_geometry(g)=name
  g
}
