## Basemap layers
Basemap <- c("WHSE_BASEMAPPING.GBA_RAILWAY_TRACKS_SP",
             "digital-road-atlas-dra-master-partially-attributed-roads",
             "38bd1ad2-2449-430d-98ce-03a757f9a606", #"freshwater-atlas-coastlines",
             "freshwater-atlas-lakes",
             "freshwater-atlas-islands",
             "freshwater-atlas-rivers",
             "freshwater-atlas-stream-network",
             "freshwater-atlas-wetlands"
)

## Shortnames -- used in naming output files
Basemap_dict <- c("Rails",
                  "Roads",
                  "Water-Coastline",
                  "Water-Lakes",
                  "Water-Islands",
                  "Water-Rivers",
                  "Water-Streams",
                  "Water-Wetlands")


baselayers <- data.frame(Name = Basemap_dict,
                         BCID = Basemap)

usethis::use_data(baselayers)
usethis::use_data(baselayers, internal = TRUE)
