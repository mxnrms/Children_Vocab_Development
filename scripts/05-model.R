#### Preamble ####
# Purpose: Models of the data to generate inferential statistics.
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
## creating simulated data for the model
set.seed(853)

number_of_observations <- 200
# calculated (linear slope relationship) from known independent and dependent values
expected_relationship <- 8.3
# age_in_months minimum
early_age <- 12
# age_in_months maximum
age_limit <- 36

sim_prod_data <-
  tibble(
    age_in_months = floor(runif(
      n = number_of_observations,
      min = early_age,
      max = age_limit
    )),
    noise = rnorm(n = number_of_observations, mean = 0, sd = 20),
    prod_words = age_in_months * expected_relationship + noise
  ) |>
  mutate(
    age_in_months = round(x = age_in_months, digits = 1),
    prod_words = round(x = prod_words, digits = 1)
  ) |>
  select(-noise)

# present 
sim_prod_data

# panel a
sim_prod_data |>
  ggplot(aes(x = age_in_months, y = prod_words)) +
  geom_point(alpha = 0.5) +
  labs(
    x = "age",
    y = "words produced"
  ) +
  theme_classic()

# panel b
sim_prod_data |>
  ggplot(aes(x = age_in_months, y = prod_words)) +
  geom_point(alpha = 0.5) +
  geom_smooth(
    method = "lm",
    se = FALSE,
    color = "black",
    linetype = "dashed",
    formula = "y ~ x"
  ) +
  labs(
    x = "age",
    y = "words produced"
  ) +
  theme_classic()
  
# panel c
sim_prod_data |>
  ggplot(aes(x = age_in_months, y = prod_words)) +
  geom_point(alpha = 0.5) +
  geom_smooth(
    method = "lm",
    se = TRUE,
    color = "black",
    linetype = "dashed",
    formula = "y ~ x"
  ) +
  labs(
    x = "age",
    y = "words produced"
  ) +
  theme_classic()
  
sim_prod_vocab_model <-
  lm(
    prod_words ~ age_in_months,
    data = sim_prod_data
  )

summary(sim_prod_vocab_model)
modelsummary(sim_prod_vocab_model)



#### Save model ####
# LINEAR MODEL
saveRDS(
  sim_prod_vocab_model,
  file = "outputs/models/sim_prod_vocab_model.rds"
)


