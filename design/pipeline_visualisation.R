#################### Header Start ####################
# Title : Pipeline visualisation using Directed Acyclic Graph (DAG)
# Author: Jing Liao
# Date created : 25/04/2026
# Date modified: 25/04/2026
# Context      :
# This script is independent from the project structure. 
# It aims to demonstrate the pipeline design for the project.
#################### Header End   ####################

# [0.0] requiredd packages ----

library(visNetwork)
library(dplyr)
library(htmlwidgets)

# [1.0] node definition ----

nodes <- data.frame(id = c("load_pacakges",
                           "load_functions",
                           "load_global_parameters",
                           "run_generate_data",
                           "sample_data",
                           "rmarkdown_html_report",
                           "quarto_html_report",
                           "rmarkdown_word_report",
                           "shiny_app",
                           "ui",
                           "server"),
                    label = c("load_pacakges.R",
                              "load_functions.R",
                              "load_global_parameters.R",
                              "run_generate_data.R",
                              "sample_data.csv",
                              "rmarkdown_html_report.R",
                              "quarto_html_report.R",
                              "rmarkdown_word_report.R",
                              "app.R",
                              "ui.R",
                              "server.R"),
                    group = c("setup",
                              "setup",
                              "setup",
                              "sample",
                              "data",
                              "output",
                              "output",
                              "output",
                              "output",
                              "setup",
                              "setup")
                    )

edges <- data.frame(from = c("load_pacakges",
                             "load_functions",
                             "run_generate_data",
                             "load_global_parameters",
                             "load_global_parameters",
                             "load_global_parameters",
                             "load_global_parameters",
                             "sample_data",
                             "sample_data",
                             "sample_data",
                             "sample_data",
                             "ui",
                             "server"),
                    to = c("load_global_parameters",
                           "load_global_parameters",
                           "sample_data",
                           "rmarkdown_html_report",
                           "quarto_html_report",
                           "rmarkdown_word_report",
                           "shiny_app",
                           "rmarkdown_html_report",
                           "quarto_html_report",
                           "rmarkdown_word_report",
                           "shiny_app",
                           "shiny_app",
                           "shiny_app")
                    )

visN <- visNetwork(nodes, edges) |>
  visGroups(groupname = "setup", color = "#D9EAF7") |>
  visGroups(groupname = "sample", color = "#FDE9D9") |>
  visGroups(groupname = "data", color = "#E2F0D9") |>
  visGroups(groupname = "output", color = "#EADCF8") |>
  visEdges(arrows = "to") |>
  visOptions(highlightNearest = TRUE, nodesIdSelection = TRUE) |>
  visLayout(hierarchical = list(enabled = TRUE,
                                direction = "LR",
                                sortMethod = "directed")
            ) |>
  visInteraction(navigationButtons = TRUE)
  
saveWidget(visN, "design/DAG.html", selfcontained = TRUE)

