#### Preamble ####
# Purpose: Cleans the raw dataset
# Author: Aliyah Maxine Ramos
# Data: 1 April 2023
# Contact: aliyahmaxine.ramos@mail.utoronto.ca
# License: MIT
# Pre-requisites: Must have raw data downloaded.
# Any other information needed? None.


#### Workspace setup ####
library(tidyverse)


#### Clean data ####
### import raw data ###
raw_childbyASLword_data <- read_csv("inputs/data/raw_childbyASLword_data.csv")

### select variables of interest ###
cleaned_vocab_data <-
  raw_childbyASLword_data |>
  select(child_id, age, item_definition, category, value) |>
  mutate(
    production_ability = case_when(
      endsWith(value, "produces") ~ "yes",
      endsWith(value, "understands") ~ "no",
      endsWith(value, "yes") ~ "yes",
      endsWith(value, "no") ~ "no"
    )
  ) |>
  mutate(
    comprehension_ability = case_when(
      endsWith(value, "produces") ~ "no",
      endsWith(value, "understands") ~ "yes",
      endsWith(value, "yes") ~ "yes",
      endsWith(value, "no") ~ "no"
    )
  ) |>
  mutate(
    value = NULL
  ) |>
  rename(
    age_in_months = age,
    vocabulary_item_definition = item_definition,
    item_category = category
  ) |>
  arrange(
    age_in_months
  )


### renaming values in variables to be more comprehensible ###
## renaming child id to simple values under variable: child_id ##
cleaned_vocab_data$child_id [cleaned_vocab_data$child_id == 58253] <- 1
cleaned_vocab_data$child_id [cleaned_vocab_data$child_id == 58250] <- 2
cleaned_vocab_data$child_id [cleaned_vocab_data$child_id == 58251] <- 3
cleaned_vocab_data$child_id [cleaned_vocab_data$child_id == 58252] <- 4
cleaned_vocab_data$child_id [cleaned_vocab_data$child_id == 58254] <- 5
cleaned_vocab_data$child_id [cleaned_vocab_data$child_id == 58255] <- 6


#### Save data ####
write_csv(cleaned_vocab_data, "outputs/data/cleaned_vocab_data.csv")

