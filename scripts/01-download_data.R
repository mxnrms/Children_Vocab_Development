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
    file = "http://52.26.82.213/admin_data/_w_499609db8d10f9c28e2b843c5d50e927fa4b96b36822f528/session/541eab6cb64a464d0e2cc430090a329c/download/download_data?w=499609db8d10f9c28e2b843c5d50e927fa4b96b36822f528"
  )

# by word (in American Sign Language) produces by child raw data
raw_byASLwordproduce_data <- 
  read_csv(
    file = "http://52.26.82.213/item_data/_w_a3c33c5d3a496ccb2178cb9a750c7783c6611f67d3232da0/session/118fda5689db2b7bca58741f277378c1/download/download_all?w=a3c33c5d3a496ccb2178cb9a750c7783c6611f67d3232da0"
  )

# by word (in American Sign Language) understood by child raw data
raw_byASLwordunderstand_data <- 
  read_csv(
    file = "http://52.26.82.213/item_data/_w_a3c33c5d3a496ccb2178cb9a750c7783c6611f67d3232da0/session/118fda5689db2b7bca58741f277378c1/download/download_all?w=a3c33c5d3a496ccb2178cb9a750c7783c6611f67d3232da0"
  )

# full child by word (in American Sign Language) raw data
raw_childbyASLword_data <- 
  read_csv(
    file = "http://52.26.82.213/instrument_data/_w_e11d0976e4a99f0e60a2c467c9d18a5b9f5e0a6893cc4ea4/session/64a3fa200c2be09d15a78e74622a4f74/download/download_data?w=e11d0976e4a99f0e60a2c467c9d18a5b9f5e0a6893cc4ea4"
  )


#### Save data ####
write_csv(raw_bychildsummary_data, "inputs/data/raw_bychildsummary_data.csv") 

write_csv(raw_byASLwordproduce_data, "inputs/data/raw_byASLwordproduce_data.csv") 

write_csv(raw_byASLwordunderstand_data, "inputs/data/raw_byASLwordunderstand_data.csv") 

write_csv(raw_childbyASLword_data, "inputs/data/raw_childbyASLword_data.csv") 
         