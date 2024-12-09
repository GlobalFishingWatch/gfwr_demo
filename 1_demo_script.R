# assuming the package is installed
# library(remotes)
# install_github("GlobalFishingWatch/gfwr")
# Load
library(gfwr)

# Load other packages we will use
library(dplyr)
library(rnaturalearth)
library(rnaturalearthdata)
library(ggplot2)
library(tidyr)

# Help for the package
?gfwr
help(gfwr) # or highlight with your mouse and press F1

# a simple query
example <- get_vessel_info(query = 431782000, #length 1
                           search_type = "search",
                           key = gfw_auth())

# query is the first parameter, and both search_type = "search"
# and key = gfw_auth() are already the defaults, so this is equivalent to:
# get_vessel_info(431782000)

names(example) # seven slots with information than can be assessed using $ or example["dataset"]
example$dataset #the API dataset

# AIS information in selfReportedInfo:

View(example$selfReportedInfo)

# check index to understand how many vessels and how vesselIds group together
example$selfReportedInfo[, c("index", "vesselId")]

# Registry information in registryInfo
example$registryInfo
View(example$registryInfo)

# Check other slots: authorizations, owners,
# Check the identity vignette for search_type = "id" examples


## Fishing effort ----
data(test_shape) # a shapefile we created for testing purposes
plot(test_shape)
test_shape

# it's an sf object and you can use any sf object from disk reading it with sf::read_sf()11

# a simple search from the help:

fishing_effort <- get_raster(spatial_resolution = 'LOW',
                             temporal_resolution = 'MONTHLY',
                             start_date = '2021-01-01',
                             end_date = '2021-10-01',
                             group_by = "FLAG",
                             region = test_shape,
                             region_source = 'USER_SHAPEFILE')

fishing_effort
unique(fishing_effort$flag) #several flags in this dataset

# We showed how group_by = "VESSEL_ID" "GEARTYPE" and "FLAGANDGEARTYPE" return different columns
# Same as different temporal resolutions


# We have also pre-loaded areas EEZ, MPA, RFMO---

get_region_id(region_name = "COL", region_source = "EEZ")
get_region_id(region_name = "Nazca", region_source = "MPA")$id

# You just need to add the id and set region_source = "MPA", "EEZ" and "RFMO"
fishing_effort <- get_raster(spatial_resolution = 'LOW',
                             temporal_resolution = 'MONTHLY',
                             start_date = '2021-01-01',
                             end_date = '2021-10-01',
                             group_by = "VESSEL_ID",
                             region = 555745302,
                             region_source = 'MPA',
                             key = gfw_auth(),
                             print_request = TRUE)

# The maps vignette has more information about how to build maps.
