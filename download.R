library(tidyverse)
library(tidycensus)

# 2020 Decennial Census variables for race and ethnicity
race_vars <- c(
  total = "P1_001N",
  white = "P1_003N",
  black = "P1_004N",
  native_american = "P1_005N",
  asian = "P1_006N",
  pacific_islander = "P1_007N",
  hispanic_latino = "P2_002N"
)

# Download race data by census tract for Sarasota County, FL
sarasota_race <- get_decennial(
  geography = "tract",
  variables = race_vars,
  year = 2020,
  state = "FL",
  county = "Sarasota",
  output = "wide"
)

# Save data
write_rds(sarasota_race, "data/sarasota_race.rds")
write_csv(sarasota_race, "data/sarasota_race.csv")
