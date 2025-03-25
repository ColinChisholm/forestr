#' BC: British Columbia
#' 
#' An 'sf' polygon of the province of British Columbia, Canada
#' 
#' @source `bcmaps::bc_bound()` or https://github.com/bcgov/bcmaps/
"bc"


#' Baselayers 
#' 
#' A dataframe BC Data Catalog layers to queried https://catalogue.data.gov.bc.ca/.  Includes a human readable name and the BC Data ID. 
#' 
#' @source Data layers from the BC Data Catalog.  See the package "bcdata"
"baselayers"



#' Aleza 
#' 
#' A polygon of the gross tenure area of the [Aleza Lake Research Forest](https://alrf.unbc.ca). For simplicity the park in the middle is not included.
#' @examples 
#' aleza 
#' 
#' plot(aleza, main = "Aleza Lake Research Forest")
"aleza"

#' blk: Block 
#'
#' Gross area of block 1 from the Aleza Lake Research Forest.  Harvested in the winter of 2002 - 2003.  
#' 
#' @example
#' plot(blk["Block"], main = "Block 1 (2003)")
