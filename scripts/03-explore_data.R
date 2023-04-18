#### Preamble ####
# Purpose: Explore and understand the dataset by creating data visualizations.
# Author: Aliyah Maxine Ramos
# Data: 30 March 2023
# Contact: aliyahmaxine.ramos@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to know where to get Children Vocabulary Development data.
# Any other information needed? None.


#### Workspace setup ####
library(tidyverse)
library(broom)
library(modelsummary)


#### Explore data ####
### exploring the variables of interest ###

# 1 ## each child's by word overall assessment ##
cleaned_vocab_data |>
  ggplot(mapping = aes(x = child_id, fill = overall_assessment)) +
  geom_bar() +
  labs(
    x = "Child ID",
    y = "Number of Observations",
    fill = "Assessment of Ability",
    title = "Children's Ability to Understand/Produce ASL Words"
  )


# 2 ## each child's amount of produced words ##
produced_ASL_words <-
  cleaned_vocab_data |>
  filter(production_ability == "YES")

produced_ASL_words |>
  ggplot(mapping = aes(x = child_id)) +
  geom_bar(fill = "purple") +
  labs(
    x = "Child ID",
    y = "Number of ASL Words Produced",
    title = "Children's Ability to Produce ASL Words"
  )


# 3 ## each child's amount of produced action words ##
produced_action_words <-
  cleaned_vocab_data |>
    filter(production_ability == "YES", item_category == "action_words")

produced_action_words |>
  ggplot(mapping = aes(x = child_id)) +
  geom_bar(fill = "blue") +
  labs(
    x = "Child ID",
    y = "Number of Action Words Produced",
    title = "Children's Ability to Produce ASL Action Words"
  )


# 4 ## each child's amount of produced time words ##
produced_time_words <-
  cleaned_vocab_data |>
    filter(production_ability == "YES", item_category == "time_words")

produced_time_words |>
  ggplot(mapping = aes(x = child_id)) +
  geom_bar(fill = "blue") +
  labs(
    x = "Child ID",
    y = "Number of Time Words Produced",
    title = "Children's Ability to Produce ASL Time Words"
  )


# 5 ## each child's amount of produced question words ##
produced_question_words <-
  cleaned_vocab_data |>
  filter(production_ability == "YES", item_category == "question_words")

produced_question_words |>
  ggplot(mapping = aes(x = child_id)) +
  geom_bar(fill = "blue") +
  labs(
    x = "Child ID",
    y = "Number of Time Question Produced",
    title = "Children's Ability to Produce ASL Question Words"
  )


# 6 ## each child's amount of produced descriptive words ##
produced_descriptive_words <-
  cleaned_vocab_data |>
  filter(production_ability == "YES", item_category == "descriptive_words")

produced_descriptive_words |>
  ggplot(mapping = aes(x = child_id)) +
  geom_bar(fill = "blue") +
  labs(
    x = "Child ID",
    y = "Number of Time Descriptive Produced",
    title = "Children's Ability to Produce ASL Descriptive Words"
  )


# 7 ## summary statistics table
library(modelsummary)
summary_stats_vocab_data <-
  cleaned_vocab_data |>
  mutate(
    vocabulary_item_definition = NULL
  ) |>
  datasummary_skim(type = "categorical")

# present summary statistics table
summary_stats_vocab_data



