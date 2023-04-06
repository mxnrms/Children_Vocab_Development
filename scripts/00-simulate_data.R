#### Preamble ####
# Purpose: Simulates the desired data.
# Author: Aliyah Maxine Ramos
# Data: 29 March 2023
# Contact: aliyahmaxine.ramos@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to know where to get Children Vocabulary Development data.
# Any other information needed? None.


#### Workspace setup ####
library(tidyverse)


#### Simulate data ####
set.seed(853)

simulated_vocab_data <-
  tibble(
    # use 1 through 50 to represent the identification of each child + repeat each child_id for every unique vocab_word
    child_id = rep(c(1:50), each = 4),
    # randomly assigned age (in months) for each child_id
    age_months = rep(c(floor(runif(n = 50, min = 1, max = 36))), each = 4),
    # every child_id should be assessed each vocab_word
    vocab_word = rep(c("cat", "dog", "eat", "sleep"), times = 50),
    # each vocab_word is categorized
    category = rep(c(rep(c("animals"), times = 2), rep(c("actions"), times = 2)), times = 50),
    # every child_id should be assessed whether they produced vocab_word
    production = sample(
      x = c(
        "YES",
        "NO"
      ),
      size = 200,
      replace = TRUE
    ),
    # every child_id should be assessed whether they produced vocab_word
    comprehension = sample(
      x = c(
        "YES",
        "NO"
      ),
      size = 200,
      replace = TRUE
    )
  ) |> 
    mutate(age_months = as.integer(age_months))

head(simulated_vocab_data)

