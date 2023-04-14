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


#### Save data ####
write_csv(cleaned_vocab_data, "outputs/data/cleaned_vocab_data.csv")

