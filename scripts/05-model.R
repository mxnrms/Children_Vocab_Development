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
## simulated code
set.seed(853)

number_of_observations <- 200
expected_relationship <- 8.3
early_age <- 12
age_threshhold <- 36

sim_vocab_data_model <-
  tibble(
    age_in_months = runif(
      n = number_of_observations,
      min = early_age,
      max = age_threshhold
    ),
    noise = rnorm(n = number_of_observations, mean = 0, sd = 20),
    prod_words = age_in_months * expected_relationship + noise
  ) |>
  mutate(
    age_in_months = round(x = age_in_months, digits = 1),
    prod_words = round(x = prod_words, digits = 1)
  ) |>
  select(-noise)

sim_vocab_data_model

# panel a
sim_vocab_data_model |>
  ggplot(aes(x = age_in_months, y = prod_words)) +
  geom_point(alpha = 0.5) +
  labs(
    x = "age",
    y = "words produced"
  ) +
  theme_classic()

# panel b
sim_vocab_data_model |>
  ggplot(aes(x = age_in_months, y = prod_words)) +
  geom_point(alpha = 0.5) +
  geom_smooth(
    method = "lm",
    se = FALSE,
    color = "black",
    linetype = "dashed",
    formula = "y ~ x"
  )
  labs(
    x = "age",
    y = "words produced"
  ) +
  theme_classic()
  
# panel c
  sim_vocab_data_model |>
    ggplot(aes(x = age_in_months, y = prod_words)) +
    geom_point(alpha = 0.5) +
    geom_smooth(
      method = "lm",
      se = TRUE,
      color = "black",
      linetype = "dashed",
      formula = "y ~ x"
    )
  labs(
    x = "age",
    y = "words produced"
  ) +
    theme_classic()
  
sim_vocab_data_model_true <-
  lm(
    prod_words ~ age_in_months,
    data = sim_vocab_data_model
  )

summary(sim_vocab_data_model_true)
modelsummary(sim_vocab_data_model_true)


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


