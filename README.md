# Healthcare Consultation Reporting

This project demonstrates an end-to-end reporting workflow using R, including data preparation, analysis, and multiple reporting outputs.

## Project Overview

The analysis explores healthcare consultation services across different provider types:

- GP
- Nurse
- Allied Health
- Dentist

The project focuses on how consultation patterns vary across time and population groups.

## Outputs

This project produces three types of reporting outputs:

1. **HTML Report**
   - Analytical view with multiple visualisation
   - Used for exploration and insight generation
   
2. **Word Report**
   - Condensed version for stakeholder communication
   - Focuses on key findings and summary metrics
   
3. **(Next step) Shiny App**
   - Interactive dashboard for exploring consultation patterns
   
## Key Features

- Data aggregation using 'dplyr'
- Visualisation using 'ggplot2'
- Report generation using Quarto / R Markdown
- Structured project layout for reproducibility

## Example Insights

- Allied Health services account for the largest share of consultations
- Healthcare consultation services varies across provider types and over time
- Differences are observed across age groups

## Project Structure
consultation_reporting/
  |---- data/
  |---- R/
  |---- reports/
  |---- templates/
  |---- app/
  
## How to run

To reproduce the report locally:

```r
quarto::quarto_render("reports/report.qmd")
```
Alternatively, open the file in RStudio and click Render.
