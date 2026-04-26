

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