#### Preamble ####
# Purpose: Test simulated data.
# Author: Aliyah Maxine Ramos
# Data: 4 April 2023
# Contact: aliyahmaxine.ramos@mail.utoronto.ca
# License: MIT
# Pre-requisites: Create simulated data.
# Any other information needed? None.


#### Workspace setup ####
library(tidyverse)

#### Test data ####
# test 1
simulated_vocab_data$vocab_word |>
  class() == "character"

# test 2
simulated_vocab_data$child_id |>
  max() == 50

# test 3
simulated_vocab_data$child_id |>
  class() == "integer"

# test 4
  # variable
  num_uniq <-
    simulated_vocab_data$production |>
      unique()
length(num_uniq) == 2
