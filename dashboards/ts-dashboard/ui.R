shinyUI(fluidPage(
  theme = shinythemes::shinytheme('cosmo'),
  titlePanel("Egovernments TSM"),
  sidebarLayout(
    sidebarPanel(
      width = 4,
      fluidRow(
        selectInput(
          "dataSet", label = h5("Data Set"),
          choices = c(names(datasets))
        )
      ), 
      fluidRow(
        selectInput(
          "method", label = h5("Modeling Method"),
          choices = c("ARIMA")
        )
      ),
      fluidRow(
        h5("Preprocessing Parameters"),
        checkboxInput("adjustForSeasonality", "Adjust for seasonality", value=F),
        h5("ARIMA Parameters"),
        sliderInput("ARIMA.p", label="p", min=1, max=18, value = 1),
        sliderInput("ARIMA.d", label="d", min=0, max=12, value = 0),
        sliderInput("ARIMA.q", label="q", min=1, max=18, value = 1)
      )
    ),
    mainPanel(
      plotOutput("plotForecast"),
      plotOutput("plotRaw"),
      plotOutput("plotTs"),
      tableOutput("displayMetrics")
    )
  )
))