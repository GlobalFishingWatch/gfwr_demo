library(gfwr)
library(tmap)
library(tidyr)
library(dplyr)

?get_event()

test_polygon <- sf::st_bbox(c(xmin = -70, xmax = -40, ymin = 10, ymax = 25),
                            crs = 4326) |>
  sf::st_as_sfc() |>
  sf::st_as_sf()


tmap_mode("view")
tm_basemap() +
tm_shape(test_polygon) +
tm_borders()

get_event(event_type = 'FISHING',
          start_date = "2020-10-01",
          end_date = "2020-10-31",
          region = test_polygon,
          region_source = 'USER_SHAPEFILE',
          key = gfw_auth())



# port visits
get_event(event_type = "PORT_VISIT",
          #vessels = c("8c7304226-6c71-edbe-0b63-c246734b3c01"),
          start_date = "2017-01-26",
          end_date = "2022-12-31",
          confidence = c(2), # only for port visits
          key = gfw_auth())


get_event(event_type = "PORT_VISIT",
          vessels = c("8c7304226-6c71-edbe-0b63-c246734b3c01"),
          start_date = "2017-01-26",
          end_date = "2017-12-31",
          confidence = c(3), # only for port visits
          key = gfw_auth())


#encounters
get_event(event_type = "ENCOUNTER",
          vessels = c("8c7304226-6c71-edbe-0b63-c246734b3c01"),
          start_date = "2012-01-30",
          end_date = "2024-02-04",
          key = gfw_auth())
View(.Last.value)

# fishing
get_event(event_type = "FISHING",
          vessels = c("9b3e9019d-d67f-005a-9593-b66b997559e5"),
          start_date = "2017-01-26",
          end_date = "2023-02-04",
          key = gfw_auth())
# GAPS
get_event(event_type = "GAP",
          vessels = c("e0c9823749264a129d6b47a7aabce377",
                      "8c7304226-6c71-edbe-0b63-c246734b3c01"),
          start_date = "2017-01-26",
          end_date = "2023-02-04",
          key = gfw_auth()) %>%
  mutate(event = unnest_wider(event_info))

View(.Last.value)

     # loitering
get_event(event_type = "LOITERING",
          vessels = c("e0c9823749264a129d6b47a7aabce377",
                      "8c7304226-6c71-edbe-0b63-c246734b3c01"),
          start_date = "2017-01-26",
          end_date = "2023-02-04",
          key = gfw_auth())
# encounter type
get_event(event_type = "ENCOUNTER",
          encounter_types = "CARRIER-FISHING",
          start_date = "2020-01-01",
          end_date = "2020-01-31",
          key = gfw_auth())
# vessel types
get_event(event_type = "ENCOUNTER",
          vessel_types = c("CARRIER", "FISHING"),
          start_date = "2020-01-01",
          end_date = "2020-01-31",
          key = gfw_auth())
# fishing events in Senegal EEZ
get_event(event_type = 'FISHING',
          start_date = "2020-10-01",
          end_date = "2020-12-31",
          region = 8371,
          region_source = 'EEZ',
          flags = 'CHN',
          key = gfw_auth())

# fishing events in user shapefile
test_polygon <- sf::st_bbox(c(xmin = -70, xmax = -40, ymin = -10, ymax = 5),
                            crs = 4326) |>
  sf::st_as_sfc() |>
  sf::st_as_sf()
get_event(event_type = 'FISHING',
          start_date = "2022-01-01",
          end_date = "2024-01-01",
          region = test_polygon,
          region_source = 'USER_SHAPEFILE',
          key = gfw_auth())
