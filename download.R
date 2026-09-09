library(tidyverse)
library(tidycensus)

if (!dir.exists("data")) {
  dir.create("data", recursive = TRUE)
}

api_key <- Sys.getenv("CENSUS_API_KEY")

if (api_key != "") {
  census_api_key(api_key, install = FALSE)

  sarasota_race <- get_decennial(
    geography = "county",
    state = "12",
    county = "115",
    variables = c(
      total_pop = "P2_001N",
      white = "P2_005N",
      black = "P2_006N",
      native_american = "P2_007N",
      asian = "P2_008N",
      pacific_islander = "P2_009N",
      hispanic_latino = "P2_002N"
    ),
    year = 2020,
    output = "wide"
  ) |>
    select(name, total_pop, white, black, native_american, asian, pacific_islander, hispanic_latino)
} else {
  if (!file.exists("data/sarasota_race.csv")) {
    stop("CENSUS_API_KEY is not set, and no existing data/sarasota_race.csv file was found.")
  }

  sarasota_race <- read_csv("data/sarasota_race.csv")
}

write_rds(sarasota_race, "data/sarasota_race.rds")
write_csv(sarasota_race, "data/sarasota_race.csv")

