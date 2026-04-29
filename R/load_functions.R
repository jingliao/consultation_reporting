#################### Header Start ####################
# Title : functions for this project 
# Author: Jing Liao
# Date created : 22/03/2026
# Date modified: 24/04/2026
#################### Header End   ####################

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


# ingest data frame and apply consistent formation for flex table output

func_df_to_flex <- function(func_df){
  
  func_df_flex <- func_df |>
    flextable() |>
    theme_box() |>
    align(align = "center", part = "header") |>
    align(align = "center", part = "body") |>
    fontsize(part = "all", size = 9) |>
    font(fontname = "Calibri", part = "all") |>
    bg(bg = "steelblue", part = "header") |>
    color(color = "white", part = "header") |>
    padding(padding.top = 2, part = "body") |>
    padding(padding.bottom = 2, part = "body") |>
    autofit()
  
  return(func_df_flex)
  
}

# force flex object to fit on page width
# source from https://stackoverflow.com/questions/57175351/flextable-autofit-in-a-rmarkdown-to-word-doc-causes-table-to-go-outside-page-mar

func_FitFlextableToPage <- function(ft, pgwidth){
  
  ft_out <- ft |> 
    autofit()
  ft_out <- width(ft, 
                  width = dim(ft_out)$widths*pgwidth / (flextable_dim(ft_out)$widths)
  )
  
  return(ft_out)
  
}
