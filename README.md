[![Lifecycle:Experimental](https://img.shields.io/badge/Lifecycle-Experimental-339999)](Redirect-URL) *The project is in the very early stages of development. The codebase will be changing frequently. Currently, the scripts below are aspirational ... so don't count on them being there yet. I list them because I want them, and I have some code that can be adapted to this package. One day they will all be here.*

# Forest Management Tools

## Operational and Strategic Forest Planning tools (in development).

## Installation

`remotes::install_github("cchisholm/forestr")`

## Documentation

*pending*

------------------------------------------------------------------------

## Overview

### Operational tools

#### Site Plans

-   `fm_polygon_summary()` -- create a summary report of the areas within a polgon. Useful when creating site plans to generate tabular data following edits to spatial data.

#### GPS data management

-   `fm_avenza_pts()` -- processes GPS point data from Avenza. Generates a formatted table for easier review.
-   `fm_gpx_export()` -- convert data to GPX format

### Strategic and landscape level planning

These tools are highly dependent on the [`bcdata` package](https://github.com/bcgov/bcdata).

#### Basemap aquisition

-   `fm_collect_basemap()` -- Collects essential data from the BC Data Center (BCDC) including: water and transportation features. Also provides a QGIS map
-   `fm_collect_forest_layers()` -- Collects BCDC forest management layers (e.g. historical RESULTS forest cover and activies, and FTA openings, and area based tenures).
-   `fm_collect_vri()` -- Collects *Vegetation Resource Inventory* data. Note that different version of the VRI are available from the BCDC. This queries the ????? dataset.
-   `fm_collect_custom_bcdc()` -- Collects a user specified BCDC layer

#### Estate planning (aka Timber Supply Review)

-   `fm_collect_aoi_overlap()` -- Intended for use with a *Frontcounter BC: Area of Interest Evaluation Report* (see: [Frontcounter BC](frontcounterbc.gov.bc.ca)). Collects much of the data that overlaps the area of interest.
-   `fm_resultant()` -- cuts new data into a resultant (e.g. Visual Quality Objective polygon becomes a attribute in the resultant)

### Other utilities

-   `fm_tile_raster()` -- large raster data can be difficult to use. This function creates a set pf spatial polygons that can be used to tile the input raster (e.g. facilitate loading smaller portions of a large raster.
-   `fm_sample_plan()` -- creates a sampling plan for regular grid, regularly placed, or randomly placed survey/sample points in a polygon.
-   `fm_zonal_stats()` -- Zonal statistics of raster values in a polygon.

------------------------------------------------------------------------

### License

    Copyright 2022 Colin E. Chisholm

    Licensed under the Apache License, Version 2.0 (the &quot;License&quot;);
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an &quot;AS IS&quot; BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and limitations under the License.
