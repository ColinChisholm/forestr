% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fm_sample_plan.R
\name{fm_sample_grid}
\alias{fm_sample_grid}
\title{Create a sample plan}
\usage{
fm_sample_grid(input, spacing)
}
\arguments{
\item{input}{a \code{sf} polygon or multi-polygon object.}

\item{method}{Options include: \code{grid} (specified grid distance), \code{regular} (regularly spaced on a grid based on the desired number of plots), or \code{random} if a \code{min_dis} is specified the points are generated based on a grid of that distance.}

\item{n}{An integer specifying how many sample points to create.}

\item{grid}{An integer specifying how many units to place points apart from one another.
Only to be used with \code{"grid"} method.  It is recommended to use a \code{utm} based projection.}

\item{min_dis}{Optional, a minimum distance that random plots need to be from one another.  Using this method will cause plots to be selected off of a regular grid.}
}
\value{
Returns a point \code{sf} object
}
\description{
Using an \code{sf} polygon a point sample plan is generated.  Options allow for a target number of sample points or a specific density of points.  Points can be located along a regular grid or placed randomly.
}
\examples{
point   <- data.frame(lat = 53.893, long = -122.813) |> 
  sf::st_as_sf(coords = c("long", "lat")) |> 
  st_set_crs(4326)

aoi   <- point |> 
  sf::st_transform(3005) |> 
  sf::st_buffer(500)

fm_sample_plan(input = aoi,
               method = "grid")
}
