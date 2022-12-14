#### BUILD ALL CURBCUT DATA ####################################################


# Load libraries ----------------------------------------------------------
tictoc::tic()
library(cc.buildr)
library(stringr)
library(dplyr)
library(purrr)
library(sf)
future::plan(future::multisession())
invisible(lapply(list.files("dev/data_import", full.names = TRUE), source))


# Base of the study region and dictionaries -------------------------------

# All regions
all_tables <-
  list("CMA" = c("CSD", "CT", "DA", "building"),
       "city" = c("CSD", "CT", "DA", "building"),
       "cmhc" = c("cmhczone"))


# List all the regions geometries to create the master polygon
cancensus_cma_code <- 35535
all_regions <- list(CMA = list(CMA = cancensus_cma_code),
                    city = list(CSD = 3520005),
                    cmhc = get_cmhc_zones(list(CMA = cancensus_cma_code)))

base_polygons <- create_master_polygon(all_regions = all_regions)
crs <- base_polygons$crs

# Create the region dictionary
regions_dictionary <-
  regions_dictionary(
    all_tables = all_tables,
    geo = c("CMA", "city", "cmhc"),
    name = c(CMA = "Metropolitan Area",
             city = "City of Toronto",
             cmhc = "Canada Mortgage and Housing Corporation zones"),
    to_compare = c(CMA = "in the Toronto region",
                   city = "in the City of Toronto",
                   cmhc = "in the Toronto region"),
    pickable = c(CMA = TRUE,
                 city = TRUE,
                 cmhc = FALSE))


# Build scales ------------------------------------------------------------

### Build census scales
census_scales <-
  build_census_scales(master_polygon = base_polygons$master_polygon,
                      regions = base_polygons$province_cancensus_code,
                      levels = c("CSD", "CT", "DA"),
                      crs = crs)

# Switch the City of Toronto for the Wards
wards <- sf::st_read("dev/data/geometry/WARD_WGS84.shp")
wards <- wards[c("AREA_NAME")]
names(wards)[1] <- "name"
wards$type <- "Ward"
wards <- tibble::as_tibble(wards) |> sf::st_as_sf()

census_scales$CSD <- split_scale(destination = census_scales$CSD,
                                 cutting_layer = wards,
                                 DA_table = census_scales$DA,
                                 crs = crs)

# Create the census scales dictionary
scales_dictionary <- census_scales_dictionary(census_scales)
# Switch the CSD scale for borough/city
scales_dictionary[1, ] <- list(scale = "CSD",
                               sing = "ward/city",
                               plur = "wards or cities",
                               slider_title = "Ward/City",
                               place_heading = "{name_2} of {name}",
                               place_name = "{name}")


### Build building scale
# # # From MySQL
# # building <- cc.data::db_read_long_table(table = "buildings",
# #                                          DA_ID = census_scales$DA$ID)
# # qs::qsave(building, file = "dev/data/built/building.qs")
# # From Local
# building <- qs::qread("dev/data/canada_buildings.qs")
# building_ids <- cc.data::db_read_data(table = "buildings_DA_dict",
#                                       column_to_select = "DA_ID",
#                                       IDs = census_scales$DA$ID)
# building_ids <-
#   unlist(sapply(building_ids$IDs, jsonlite::fromJSON, USE.NAMES = FALSE))
# building <- building[building$ID %in% building_ids, ]
# building <- qs::qsave(building, "dev/data/built/building.qs")
building <- qs::qread("dev/data/built/building.qs")

# Add building scale to the dictionary
scales_dictionary <-
  append_scale_to_dictionary(scales_dictionary,
                             scale = "building",
                             sing = "dissemination area",
                             plur = "dissemination areas",
                             slider_title = "Building",
                             place_heading = "{name}",
                             place_name = "The dissemination area around {name}")

### Build CMHC scale
cmhczone <- get_cmhc_zones(list(CMA = cancensus_cma_code))
cmhczone <- additional_scale(additional_table = cmhczone,
                             DA_table = census_scales$DA,
                             ID_prefix = "cmhc",
                             name_2 = "CMHC zone",
                             crs = crs)
scales_dictionary <-
  append_scale_to_dictionary(scales_dictionary,
                             scale = "cmhczone",
                             sing = "CMHC zone",
                             plur = "CMHC zones",
                             slider_title = "CMHC zone",
                             place_heading = "CMHC zone of {name}",
                             place_name = "{name}")


# Consolidate scales ------------------------------------------------------

all_scales <- c(census_scales,
                list(building = building),
                list(cmhczone = cmhczone))

scales_consolidated <- consolidate_scales(all_tables = all_tables,
                                          all_scales = all_scales,
                                          regions = base_polygons$regions,
                                          crs = crs)


# Verify conformity -------------------------------------------------------

verify_dictionaries(all_tables = all_tables,
                    regions_dictionary = regions_dictionary,
                    scales_dictionary = scales_dictionary)


# Create the modules and variables tables ---------------------------------

scales_variables_modules <-
  append_empty_variables_table(scales_consolidated = scales_consolidated)
scales_variables_modules <-
  append_empty_modules_table(scales = scales_variables_modules)


# Build the datasets ------------------------------------------------------

# future::plan(list(future::tweak(future::multisession,
#                                 workers = 4),
#                   future::tweak(future::multisession,
#                                 workers = length(cc.data::census_years))))

scales_variables_modules <-
  ba_census_data(scales_variables_modules = scales_variables_modules,
                 region_DA_IDs = census_scales$DA$ID,
                 crs = crs,
                 housing_module = TRUE)
census_variables <- get_census_vectors_details()

scales_variables_modules <-
  ru_vac_rate(scales_variables_modules = scales_variables_modules,
              crs = crs, geo_uid = cancensus_cma_code)
scales_variables_modules <-
  ru_canale(scales_variables_modules = scales_variables_modules,
            crs = crs,
            region_DA_IDs = census_scales$DA$ID)
scales_variables_modules <-
  ru_canbics(scales_variables_modules = scales_variables_modules,
             crs = crs,
             region_DA_IDs = census_scales$DA$ID)


# Toronto-specific pages
scales_variables_modules <- 
  build_and_append_tree(scales_variables_modules = scales_variables_modules, 
                        crs = crs)
scales_variables_modules <- 
  build_and_append_tree_sqkm(scales_variables_modules = scales_variables_modules, 
                             crs = crs)



scales_variables_modules$scales <- 
  cc.buildr::reorder_columns(scales_variables_modules$scales)

qs::qsavem(census_scales, scales_variables_modules, crs, census_variables,
           scales_dictionary, regions_dictionary, all_tables, base_polygons,
           file = "dev/data/built/scales_variables_modules.qsm")
qs::qload("dev/data/built/scales_variables_modules.qsm")

# Postal codes ------------------------------------------------------------

# postal_codes <- build_postal_codes(census_scales$DA$ID)
# qs::qsave(postal_codes, "data/postal_codes.qs")


# Map zoom levels ---------------------------------------------------------

map_zoom_levels <- map_zoom_levels_create_all(all_tables = all_tables)

map_zoom_levels_save(data_folder = "data/", map_zoom_levels = map_zoom_levels)


# Tilesets ----------------------------------------------------------------

# tileset_upload_all(all_scales = scales_variables_modules$scales,
#                    map_zoom_levels = map_zoom_levels,
#                    prefix = "to",
#                    username = "sus-mcgill",
#                    access_token = .cc_mb_token)
# 
# tileset_labels(CSD_table = scales_variables_modules$scales$CMA$CSD,
#                prefix = "to",
#                username = "sus-mcgill",
#                access_token = .cc_mb_token)
# 
# street <- cc.data::db_read_data(table = "streets", 
#                                 column_to_select = "DA_ID", 
#                                 IDs = census_scales$DA$ID)
# qs::qsave(street, "dev/data/built/street.qs")
# street <- qs::qread("dev/data/built/street.qs")
# 
# tileset_streets(master_polygon = base_polygons$master_polygon,
#                 street = street,
#                 crs = crs,
#                 prefix = "to",
#                 username = "sus-mcgill",
#                 access_token = .cc_mb_token)



# Did you know ------------------------------------------------------------

# variables <- scales_variables_modules$variables
# source("dev/other/dyk.R")
# qs::qsave(dyk, "data/dyk.qs")


# Produce colours ---------------------------------------------------------

source("dev/other/colours.R")


# Write stories -----------------------------------------------------------

# source("dev/pages/stories.R", encoding = "utf-8")
# qs::qsavem(stories, stories_mapping, file = "data/stories.qsm")


# Save variables ----------------------------------------------------------

qs::qsave(scales_variables_modules$variables, file = "data/variables.qs")


# Build data scripts ------------------------------------------------------

lapply(list.files("dev/pages", full.names = TRUE), 
       create_page_script, overwrite = TRUE) |> 
  invisible()


# Save SQLite data --------------------------------------------------------

save_buildings_sqlite(all_scales = scales_variables_modules$scales)

save_all_scales_sqlite(data_folder = "data/", 
                       all_scales = scales_variables_modules$scales,
                       variables = scales_variables_modules$variables)


# Save .qsm ---------------------------------------------------------------

save_short_tables_qs(data_folder = "data/", 
                     all_scales = scales_variables_modules$scales)
save_geometry_export(data_folder = "data/", 
                     all_scales = scales_variables_modules$scales)


# Save other global data --------------------------------------------------

qs::qsave(census_variables, file = "data/census_variables.qs")
qs::qsave(scales_variables_modules$modules, file = "data/modules.qs")
qs::qsave(scales_dictionary, file = "data/scales_dictionary.qs")
qs::qsave(regions_dictionary, file = "data/regions_dictionary.qs")
qs::qsave(scales_variables_modules$scales[[1]][[1]] |> 
            sf::st_transform(crs) |> 
            sf::st_union() |> 
            sf::st_centroid() |> 
            sf::st_transform(4326) |> 
            sf::st_coordinates() |> 
            as.numeric(), file = "data/map_loc.qs")
tictoc::toc()


# Deploy app --------------------------------------------------------------

renv::activate()
heroku_deploy("cc-toronto")
