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


#### Explore data ####
### exploring the variables of interest ###

# 1 ## each child's by word value ##
cleaned_vocab_data |>
  ggplot(mapping = aes(x = child_id, fill = value)) +
  geom_bar() +
  labs(
    x = "Child ID",
    y = "Number of Observations",
    fill = "Ability",
    title = "Children's Ability to Understand/Produce ASL Words"
  )


# 2 ## each child's amount of produced words ##
produced_ASL_words <-
  cleaned_vocab_data |>
  filter(value == "produces")

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
    filter(value == "produces", category == "action_words")

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
    filter(value == "produces", category == "time_words")

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
  filter(value == "produces", category == "question_words")

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
  filter(value == "produces", category == "descriptive_words")

produced_descriptive_words |>
  ggplot(mapping = aes(x = child_id)) +
  geom_bar(fill = "blue") +
  labs(
    x = "Child ID",
    y = "Number of Time Descriptive Produced",
    title = "Children's Ability to Produce ASL Descriptive Words"
  )



### MODEL ###