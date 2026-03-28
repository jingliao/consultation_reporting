
library(shiny)
library(dplyr)
library(ggplot2)
library(readr)

df <- read_csv("../data/sample_data.csv", 
               show_col_types = FALSE)

ui <- fluidPage(
  titlePanel("Healthcare Consultation Dashboard"),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "Provider",
                  label = "Select provider type:",
                  choices = c("All", sort(unique(df$provider_type))),
                  selected = "All"),
      selectInput(inputId = "Region",
                  label = "Select region:",
                  choices = c("All", sort(unique(df$region))),
                  selected = "All")
    ),
    mainPanel(
      plotOutput("plot_trend"),
      br(),
      plotOutput("plot_age")
    )
  )
)

server <- function(input, 
                   output,
                   session){
  
  data_filtered <- reactive({
    
    data <- df
    
    if(input$Provider != "All"){
      data <- data |>
        filter(provider_type == input$Provider)
    }
    if(input$Region != "All"){
      data <- data |>
        filter(region == input$Region)
    }
    
    data
    
  })
  
  output$plot_trend <- renderPlot({
    df_trend <- data_filtered() |>
      group_by(month) |>
      summarise(total_consultations = sum(n_consultations),
                .groups = "drop")
    
    ggplot(df_trend,
           aes(x = month,
               y = total_consultations)
           ) +
      geom_line() +
      labs(title = paste("Monthly consultations:", 
                         input$Provider),
           x = "Month",
           y = "Total consultations")
  })
  
  output$plot_age <- renderPlot({
    
    df_age <- data_filtered() |>
      group_by(age_group) |>
      summarise(total_consultations = sum(n_consultations),
                .groups = "drop")
    
    ggplot(df_age,
           aes(x = age_group,
               y = total_consultations)
           ) +
      geom_col() +
      labs(title = paste("Consultations by age group:", 
                         input$Provider),
           x = "Age group",
           y = "Total consultations")
  })
}

shinyApp(ui = ui,
         server = server)

# placeholder: before you commence, go back to qmd, rmd and readme and review it