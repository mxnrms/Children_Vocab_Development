#### Preamble ####
# Purpose: Downloads and saves the data from Wordbank (an open database of children's vocabulary development)
# Author: Aliyah Maxine Ramos
# Data: 29 March 2023
# Contact: aliyahmaxine.ramos@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to know where to get Children Vocabulary Development data.
# Any other information needed? None.


#### Workspace setup ####
library(tidyverse)


#### Download data ####
# read in the datasets

# by child summary raw data
raw_bychildsummary_data <- 
  read_csv(
    file = "wordbank_by-child_summary_data.csv"
  )

# by word (in American Sign Language) produces by child raw data
raw_byASLwordproduce_data <- 
  read_csv(
    file = "wordbank_by-word-produce_ASL_summary_data.csv"
  )

# by word (in American Sign Language) understood by child raw data
raw_byASLwordunderstand_data <- 
  read_csv(
    file = "wordbank_by-word-understand_ASL_summary_data.csv"
  )

# full child by word (in American Sign Language) raw data
raw_childbyASLword_data <- 
  read_csv(
    file = "wordbank_full-child-by-word_ASL_data.csv"
  )


#### Save data ####
write_csv(raw_bychildsummary_data, "inputs/data/raw_bychildsummary_data.csv") 

write_csv(raw_byASLwordproduce_data, "inputs/data/raw_byASLwordproduce_data.csv") 

write_csv(raw_byASLwordunderstand_data, "inputs/data/raw_byASLwordunderstand_data.csv") 

write_csv(raw_childbyASLword_data, "inputs/data/raw_childbyASLword_data.csv") 
         