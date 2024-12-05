# Installation instructions
# Check/install remotes
install.packages("remotes")

## Account in Global Fishing Watch and token
install.packages("usethis")

# Edit r_environ with token
usethis::edit_r_environ()
# Copy your token in the file that will open:
#GFW_TOKEN = "eyJhb..."
#Save and close the file, then restart the R session (menu: Session/Restart R).


# Install the package-----

# Install package from GitHub
remotes::install_github("GlobalFishingWatch/gfwr",
                        dependencies = TRUE,
                        build_vignettes = TRUE)

# load package (all subsequent scripts will start from HERE)
library(gfwr)

# a simple test search
get_vessel_info(query = 224224000,
                search_type = "search",
                key = gfw_auth())

# install if necessary
library(dplyr)
library(ggplot2)
library("tidyr")
library("sf")
library("rnaturalearth")
library("rnaturalearthdata")


