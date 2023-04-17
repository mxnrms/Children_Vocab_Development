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

# full child by word (in American Sign Language) raw data
raw_childbyASLword_data <- 
  read_csv(
    file = "http://52.26.82.213/instrument_data/_w_b72732490a194ec3873751f91bd3c8d8313e5b057d197dda/session/e43e4b55e70aae25d700a68369b8277a/download/download_data?w=b72732490a194ec3873751f91bd3c8d8313e5b057d197dda"
  )


#### Save data ####
write_csv(raw_childbyASLword_data, "inputs/data/raw_childbyASLword_data.csv") 
         