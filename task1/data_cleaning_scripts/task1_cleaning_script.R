library(tidyverse)

# cleaning variables
decathlon <- janitor::clean_names(read_rds("raw_data/decathlon.rds"))

# creating name column for row names and standardising names
decathlon <- decathlon %>% 
  tibble::rownames_to_column("name") %>%
  mutate(name = str_to_title(name))

# creating rds file of cleaned data
write_rds(decathlon, "decathlon_cleaned.rds")




