library(shiny)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(

  # Application title
  headerPanel("Data and Plots"),

  # Sidebar with controls to provide a caption, select a dataset, and 
  # specify the number of observations to view. Note that changes made
  # to the caption in the textInput control are updated in the output
  # area immediately as you type
  sidebarPanel(
    selectInput("dataset", "Choose a dataset:", 
                choices = c("rock", "pressure", "cars")),

    numericInput("obs", "Number of observations to view:", 10),
    
    radioButtons("dist", "Distribution type:",
                 list("Normal" = "norm",
                      "Uniform" = "unif",
                      "Log-normal" = "lnorm",
                      "Exponential" = "exp")),
    br(),

    sliderInput("n", 
                "Number of observations:", 
                 value = 500,
                 min = 1, 
                 max = 1000)
    ),


  # Show the caption, a summary of the dataset and an HTML table with
  # the requested number of observations
  mainPanel(
    tabsetPanel(
      tabPanel("Data Summary", verbatimTextOutput("summary")), 
      tabPanel("Plot", plotOutput("plot")), 
      tabPanel("Table", tableOutput("view"))
    )
  )
))
