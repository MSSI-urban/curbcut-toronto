#### SUS GLOBALS ###############################################################


# Platform dependant ------------------------------------------------------

site_name <- "Curbcut Toronto"
city_name <- "Toronto"
site_url <- "https://toronto.curbcut.ca"
stories_page <- "Toronto stories"
tileset_prefix <- "to"
mapbox_username <- "sus-mcgill"

default_region <- "CMA"
# For a location lock placeholder in advanced options
default_random_address <- "27 King's College Cir, Toronto, ON"

map_zoom <- 9.1


# Packages ----------------------------------------------------------------

suppressPackageStartupMessages({
  library(shiny)
  library(shinyjs)
  library(shinyWidgets)

  library(rdeck)
  library(ggplot2)
  library(stringr)

  library(qs)
  library(glue)
  library(metathis)
  
  library(RSQLite)
  library(curl)
  library(tableHTML)
  
  library(sever)
})

# Shiny options -----------------------------------------------------------

options(shiny.fullstacktrace = TRUE)
options(shiny.useragg = TRUE)
shinyOptions(cache = cachem::cache_disk(file.path(dirname(tempdir()), "cache")))

# Data --------------------------------------------------------------------

# Load all .qs and .qsm files that are in the root of the data folder
data_files <- list.files("data", full.names = TRUE)
invisible(lapply(data_files[grepl("qsm$", data_files)], 
                 qload, env = .GlobalEnv))
invisible(lapply(data_files[grepl("qs$", data_files)], 
                 \(x) {
                   object_name <- gsub("(data/)|(\\.qs)", "", x)
                   assign(object_name, qread(x), envir = .GlobalEnv)
                   }))

# Connect to the SQLite databases
dbs <- list.files("data", full.names = TRUE)
dbs <- subset(dbs, grepl(".sqlite$", dbs))
lapply(dbs, \(x) {
  connection_name <- paste0(stringr::str_extract(x, "(?<=/).*?(?=\\.)"), "_conn")
  assign(connection_name, dbConnect(SQLite(), x), envir = .GlobalEnv)
}) |> invisible()


# Global variables --------------------------------------------------------

census_min <- 
  variables$dates[variables$source == "Canadian census"] |> 
  unlist() |> 
  unique() |> 
  min() |> 
  as.numeric()

census_max <- 
  variables$dates[variables$source == "Canadian census"] |> 
  unlist() |> 
  unique() |> 
  max() |> 
  as.numeric()


# Modules ready -----------------------------------------------------------

unique_themes <- unique(modules$theme)[unique(modules$theme) != ""]
display_mods <- modules[modules$theme != "", ]
mods_rdy <- 
  sapply(unique_themes, \(x) {
    thm <- display_mods[display_mods$theme == x, ]
    ids <- thm$id
    names(ids) <- thm$nav_title
    ids
  }, simplify = FALSE, USE.NAMES = TRUE)


# Map defaults ------------------------------------------------------------

map_token <- paste0("pk.eyJ1Ijoic3VzLW1jZ2lsbCIsImEiOiJjbDBxMTcyNWwyNTl0M2",
                    "RtZzRremNxOHA3In0.V2Ah5lxy-3RZlF2QKOvIjg")
options(rdeck.mapbox_access_token = map_token)
map_base_style <- "mapbox://styles/sus-mcgill/cl0reqoz4000z15pekuh48ld6"
map_style_building <- "mapbox://styles/sus-mcgill/cl2bwtrsp000516rwyrkt9ior"

first_level_choropleth <- 
  sapply(ls()[grepl("map_zoom_levels_", ls())], \(x) names(get(x)[1]),
         USE.NAMES = FALSE) |> unique()
  
all_choropleth <- 
  sapply(sapply(ls()[grepl("map_zoom_levels_", ls())], get,
                USE.NAMES = FALSE), names,
         USE.NAMES = FALSE) |> unlist() |> unique()

# Set up fonts ------------------------------------------------------------

systemfonts::register_font(
  name = "SourceSansPro",
  plain = "www/fonts/SourceSansPro-Regular.ttf",
  italic = "www/fonts/SourceSansPro-Italic.ttf",
  bold = "www/fonts/SourceSansPro-Bold.ttf",
  bolditalic = "www/fonts/SourceSansPro-BoldItalic.ttf")
