#################### Header Start ####################
# Title : functions for this project 
# Author: Jing Liao
# Date created : 22/03/2026
# Date modified: 22/03/2026
#################### Header End   ####################

library(dplyr)
library(tidyr)

func_create_sample_data <- function(){
  
  months <- seq.Date(as.Date("2024-01-01"),
                     as.Date("2024-12-01"),
                     by = "month")
  
  expand.grid(month = months,
              region = c("North", "Central", "South"),
              provider_type = c("GP", "Nurse", "Allied Health", "Dentist"),
              gender = c("Female", "Male"),
              age_group = c("18-29", "30-49", "50+")) |>
    as_tibble() |>
    mutate(n_people = sample(20:150, 
                             n(), 
                             replace = TRUE),
           n_consultations = n_people * sample(1:4,
                                               n(),
                                               replace = TRUE)
           )
  
}

