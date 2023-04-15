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
# raw_bychildsummary_data <- read_csv("inputs/data/raw_bychildsummary_data.csv")
# raw_byASLwordproduce_data <- read_csv("inputs/data/raw_byASLwordproduce_data.csv")
# raw_byASLwordunderstand_data <- read_csv("inputs/data/raw_byASLwordunderstand_data.csv")
raw_childbyASLword_data <- read_csv("inputs/data/raw_childbyASLword_data.csv")

### select variables of interest ###
cleaned_vocab_data <-
  raw_childbyASLword_data |>
    select(child_id, age, item_definition, category, value)

### renaming values in variables to be more comprehensible ###
## renaming value: 'yes' under variable: value ##
cleaned_vocab_data$value [cleaned_vocab_data$value == "yes"] <- "understands & produces"
cleaned_vocab_data$value [cleaned_vocab_data$value == "no"] <- "neither"

## renaming child id to simple values under variable: child_id ##
cleaned_vocab_data$child_id [cleaned_vocab_data$child_id == 58253] <- 1
cleaned_vocab_data$child_id [cleaned_vocab_data$child_id == 58250] <- 2
cleaned_vocab_data$child_id [cleaned_vocab_data$child_id == 58251] <- 3
cleaned_vocab_data$child_id [cleaned_vocab_data$child_id == 58252] <- 4
cleaned_vocab_data$child_id [cleaned_vocab_data$child_id == 58254] <- 5
cleaned_vocab_data$child_id [cleaned_vocab_data$child_id == 58255] <- 6


#### Save data ####
write_csv(cleaned_vocab_data, "outputs/data/cleaned_vocab_data.csv")

