library(here)

source(here("R", "load_global_parameters.R"))

df <- read_csv(here("data", "sample_data.csv"),
               show_col_types = FALSE
               )

source(here("app", "uiR"))
source(here("app", "server.R"))

shinyApp(ui = ui,
         server = server)
