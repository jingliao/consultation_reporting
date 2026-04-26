#################### Header Start ####################
# Title : generate a sample data and save it as .csv 
# Author: Jing Liao
# Date created : 22/03/2026
# Date modified: 24/04/2026
#################### Header End   ####################

library(here)

source(here("R", "load_packages.R"))

source(here("R", "load_functions.R"))

samples <- func_create_sample_data()

write.csv(samples, "data/sample_data.csv", row.names = FALSE)
