# Metadata

```text

Project             : Simulated Healthcare Consultation Reporting
Author              : Jing Liao
Last updated date   : 20-04-2026
Stakeholders        : humans

```

# Quick Entry View

- project summary, see this README
- pipeline design, see `design/DAG.html`
- example output, see `reports/report_quarto.html`

## 1. Purpose

This project demonstrates an end-to-end reporting workflow using R, including data preparation, analysis, and multiple reporting outputs 
(e.g. html, word file and a Shiny app).


## 2. Dependencies

- R version 4.5.0
- Required R packages, details see `R/`

## 3. Project Overview

The analysis explores healthcare consultation services across different provider types:

- GP
- Nurse
- Allied Health
- Dentist

The project focuses on how consultation patterns vary across time and population groups.
The data set is generated via `R/run_generate_data.R` and stored in `data/sample_data.csv`.
All analyses and reports are based on this data set to ensure consistency.

## 4. Architecture/Structure

```text

my_ds_portfolio/portfolio_projects/consultation_reporting/
|----- consultation_reporting.Rproj
|----- README.md
|----- data/
       |----- sample_data.csv
|----- R/
       |----- load_functions.R
       |----- load_global_parameters.R
       |----- load_packages.R
       |----- run_generate_data.R
|----- reports/
       |----- report_quarto_files/ 
       |----- report_quarto.qmd
       |----- report_quarto.html
       |----- report_rmarkdown.Rmd
       |----- report_rmarkdown.html
       |----- Project1_report_template.docx
|----- app/
       |----- app.R
       |----- ui.R
       |----- server.R
|----- design/
       |----- pipeline_visualisation.R
       |----- DAG.html
       |----- DAG_files

```

## 5. Criteria/Business Rules

The sample dataset was simulated based on the following criteria:

1. Consultation dates are defined as the first day of each month in 2024.
2. Service regions include North, Central and South region.
3. Consultation provider types include General Practitioner (GP), Nurse, Allied Health and Dentist.
4. Gender is simplified to Male and Female for demonstration purposes.
5. Age groups are categorised as 18-29, 30-49 and 50+.
6. The number of people receiving consultations and the number of consultations provided per month are generated using discrete uniform distributions.
7. It is assumed that an individual receives fewer than five consultations within a given month.
8. All categorical variables are sampled independently unless otherwise specified.

## 6. Deployment

To reproduce the report locally, simply render `.qmd` or knit `.Rmd` file in `reports/`. 
To reproduce the dashboard, simply hit 'Run App' on the top right corner of the panel in `app/app.R`

## 7. Outputs

This project demonstrates multiple reporting outputs for different audiences:

- HTML report
- Word/PDF report
- Shiny dashboard

For demonstration, the current type of outputs is HTML.

## 8. Known Issues/To Do
R Markdown can knit to Word perfectly fine, but an issue at the moment is Windows (OS) sometimes blocks writing to the .docx file 

## 9. Useful Commands
The design/ folder is used for demonstration purposes only. It is not part of the project pipeline or workflow.
