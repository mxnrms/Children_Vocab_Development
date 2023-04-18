#### Preamble ####
# Purpose: Models the data to provide inferential statistics.
# Author: Aliyah Maxine Ramos
# Data: 17 April 2023
# Contact: aliyahmaxine.ramos@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to know where to get Children Vocabulary Development data.
# Any other information needed? None.


#### Workspace setup ####
library(tidyverse)


#### Read data ####
# EXAMPLE
# analysis_data <- read_csv("outputs/data/analysis_data.csv")

# MINE
vocab_analysis_data <- read_csv("outputs/data/cleaned_vocab_data.csv")


#### Model data ####
# EXAMPLE
# first_model <-
#   stan_glm(
#     formula = flying_time ~ length + width,
#     data = analysis_data,
#     family = gaussian(),
#     prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
#     prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
#     prior_aux = exponential(rate = 1, autoscale = TRUE),
#     seed = 853
#   )

# MINE
model_producedASLwords_data <-
  cleaned_vocab_data |>
  mutate(value = case_when(
    value == "neither" ~ 0,
    value == "understands" ~ 1,
    value == "produces" ~ 2,
    value == "understands & produces" ~ 3
  ))

produced_ASL_words_model <-
  lm(
    value ~ age,
    data = model_producedASLwords_data
  )

summary(produced_ASL_words_model)


#### Save model ####
# EXAMPLE
# saveRDS(
#   first_model,
#   file = "outputs/models/first_model.rds"
# )

