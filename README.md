# Metadata

Project : Healthcare Consultation Reporting
Author  : Jing Liao
Last updated date  : 20-04-2026
Stakeholders       : 

## 1. Purpose

This project demonstrates an end-to-end reporting workflow using R, including data preparation, analysis, and multiple reporting outputs (i.e. html, word file and a Shiny app).

## 2. Dependencies

- R version 4.5.0
- Required R packages, see R/ (dep/?)

## 3. Project Overview

The analysis explores healthcare consultation services across different provider types:

- GP
- Nurse
- Allied Health
- Dentist

The project focuses on how consultation patterns vary across time and population groups.

## 4. Architecture/Structure

my_ds_portfolio/portfolio_projects/consultation_reporting/
|----- README.md
|----- data/
       |----- sample_data.csv
|----- R/
       |----- load_functions.R
       |----- load_global_parameters.R
       |----- load_packages.R
|----- reports/
       |----- report_quarto_files/ 
       |----- report_quarto.qmd
       |----- report_quarto.html
       |----- report_rmarkdown.Rmd
       |----- report_rmarkdown.html
       |----- Project1_report_template.docx (template for rmakdown word output)
|----- app/
       |----- app.R

## 5. Criteria/Business Rules


## 6. Deployment


## 7. Outputs


To reproduce the report locally:

```r
quarto::quarto_render("reports/report.qmd")
```
Alternatively, open the file in RStudio and click Render.

This project produces three types of reporting outputs:

1. **HTML Report**
   - Analytical view with multiple visualisation
   - Used for exploration and insight generation
   
2. **Word Report**
   - Condensed version for stakeholder communication
   - Focuses on key findings and summary metrics
   
3. **Shiny App**
   - Interactive dashboard for exploring consultation patterns
   - The Shiny app allows users to interactively explore consultation trends and age-group breakdowns by provider type and region
   
## 8. Known Issues/To Do

## 9. Useful Commands

## Example Insights

- Allied Health services account for the largest share of consultations
- Healthcare consultation services varies across provider types and over time
- Differences are observed across age groups
