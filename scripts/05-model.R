#### Preamble ####
# Purpose: Models of the data that provide inferential statistics.
# Author: Aliyah Maxine Ramos
# Data: 17 April 2023
# Contact: aliyahmaxine.ramos@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to know where to get Children Vocabulary Development data.
# Any other information needed? None.


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(modelsummary)


#### Read data ####
vocab_analysis_data <- read_csv("outputs/data/cleaned_vocab_data.csv")


#### Model data ####
## mutating character values under production_ability variable to be numeric values ##
model_producedASLwords_data <-
  cleaned_vocab_data |>
  filter(production_ability == "YES") |>
  mutate(production_ability = case_when(production_ability == "YES" ~ 1))

#   vocab_analysis_data |>
#   mutate(
#     production_ability = case_when(
#       production_ability == "NO" ~ 0,
#       production_ability == "YES" ~ 1
#     )
#   )

# LINEAR MODEL
produced_ASLwords_model <-
  lm(
    production_ability ~ age_in_months,
    data = model_producedASLwords_data
  )

# GENERALIZED LINEAR MODELS
# produced_ASLwords_model_one <-
#   stan_glm(
#     formula = production_ability ~ age_in_months,
#     data = model_producedASLwords_data,
#     family = gaussian(),
#     prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
#     prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
#     prior_aux = exponential(rate = 1, autoscale = TRUE),
#     seed = 853
#   )

## summary
# LINEAR MODEL
summary(produced_ASLwords_model)
modelsummary(produced_ASLwords_model)
# GENERALIZED LINEAR MODELS
# summary(produced_ASLwords_model_one)
# modelsummary(produced_ASLwords_model_one)


### GRAPHS ###
model_producedASLwords_data |>
  ggplot(aes(x = age_in_months, y = production_ability)) +
  geom_point(alpha = 0.5) +
  labs(
    x = "age",
    y = "production ability"
  ) +
  theme_classic()


#### Save model ####
# LINEAR MODEL
saveRDS(
  produced_ASLwords_model,
  file = "outputs/models/produced_ASLwords_model.rds"
)
# GENERALIZED LINEAR MODELS
# saveRDS(
#   produced_ASLwords_model_one,
#   file = "outputs/models/produced_ASLwords_model_one.rds"
# )


