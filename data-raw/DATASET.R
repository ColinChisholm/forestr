## Baselayers 
## Make edits to csv and save

## read the data 
baselayers <- read.csv("./data-raw/baselayers.csv")


## save to the live public folder
usethis::use_data(baselayers, overwrite = TRUE)
