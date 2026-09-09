library(tidyverse)
library(primer.data)

# Filter 2020 Decennial Census data for Sarasota County, FL
sarasota_race <- census |>
  filter(str_detect(name, "Sarasota"))

# Save data
write_rds(sarasota_race, "data/sarasota_race.rds")
write_csv(sarasota_race, "data/sarasota_race.csv")

