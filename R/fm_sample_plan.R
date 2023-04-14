#' Create a sample plan
#' 
#' Using an `sf` polygon a point sample plan is generated.  Options allow for a target number of sample points or a specific density of points.  Points can be located along a regular grid or placed randomly. 
#' 
#' @param input  a `sf` polygon or multi-polygon object.  
#' @param method Options include: `grid` (specified grid distance), `regular` (regularly spaced on a grid based on the desired number of plots), or `random` if a `min_dis` is specified the points are generated based on a grid of that distance.  
#' @param n      An integer specifying how many sample points to create.  
#' @param grid   An integer specifying how many units to place points apart from one another.  
#'               Only to be used with `"grid"` method.  It is recommended to use a `utm` based projection.
#' @param min_dis Optional, a minimum distance that random plots need to be from one another.  Using this method will cause plots to be selected off of a regular grid.
#' 
#' @return Returns a point `sf` object 
#' @examples 
#' point   <- data.frame(lat = 53.893, long = -122.813) |> 
#'   sf::st_as_sf(coords = c("long", "lat")) |> 
#'   st_set_crs(4326)
#' 
#' aoi   <- point |> 
#'   sf::st_transform(3005) |> 
#'   sf::st_buffer(500)
#' 
#' fm_sample_plan(input = aoi,
#'                method = "grid")


fm_sample_grid <- function(input, spacing) {
  
  grid <- sf::st_make_grid(input, spacing) ## 
  grid <- sf::st_cast(grid, "POINT")       ## extract verticies 
  
  grid <- sf::st_intersection(grid, input) ## only return points in the aoi
  pts  <- sf::st_as_sf(grid)
  return(pts)
}


fm_sample_regular <- function(input, n) {
  pts <- sf::st_sample(input, size = n, type = "regular", exact = T)
  pts <- sf::st_as_sf(pts)
  if(nrow(pts) != n) {warning(paste0("Number of points returned (", nrow(pts),  ") does not equal number requested (", n, ")"))}
  return(pts)
}

fm_sample_random <- function (input, n, min_dis) {
  if(is.null(min_dis)) { 
    st_as_sf(st_sample(input, size = n, type = "random")) 
    
    } else {
  
    pot <- fm_sample_grid(input, spacing = min_dis)
    pot <- sf::st_as_sf(pot)
    pts <- pot[sample(1:nrow(pot), n),]
    return(pts)
    }
}


#' @export

fm_sample_plan  <- function(input, 
                            method  = "grid", 
                            n       = NULL,
                            grid    = 100,
                            min_dis = NULL
) {
  
  if (method == "grid") {
    if (!is.null(n)) { warning("n is not used with this method 'grid' and will be ignored")}
    fm_sample_grid(input, spacing = grid)
  } else 
    if (method == "regular") {
    fm_sample_regular(input, n)
  } else 
    if (method == "random") {
    fm_sample_random(input, n, min_dis)  
  }
  # warning(paste('"', method, '"', "is not a valid methodology exiting"))
}

# ## plots on a specified grid 
# g1 <- fm_sample_plan(input, method = "grid", grid = 100) 
# 
# plot(input) 
# plot(g1, add = T)
# 
# ## specified number of plots placed at regular intervals
# g2 <- fm_sample_plan(input, method = "regular", n = 100) 
# 
# plot(input) 
# plot(g2, add = T)
# 
# 
# ## random plots with minimum distance 
# g3 <- fm_sample_plan(input, method = "random",
#                      n = 30, 
#                      min_dis = 30)
# 
# plot(input)
# plot(g3, add = T)  
# 
# 
# ## random plots no minimum distance
# g4 <- fm_sample_plan(input, method = "random",
#                      n = 30, 
#                      min_dis = 30)
# 
# plot(input)
# plot(g3, add = T)  
