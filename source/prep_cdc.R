library(dplyr)
library(readr)

cdc_us <- read_csv(here("data", "resources", "cdc_usa_concentrations.csv"))
cdc_hhs1 <- read_csv(here("data", "resources", "cdc_hhs1_concentrations.csv")) %>%
  mutate(region = "HHS1")

cdc <- bind_rows(cdc_us, cdc_hhs1) %>%
  filter(pango %in% c("BA.4", "BA.5")) %>%
  arrange(week, region, pango)

write_csv(cdc, here("data", "cdc_concentrations.csv"))