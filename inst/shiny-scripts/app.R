ui <- fluidPage(
  # App title ----
  titlePanel(tags$h1(tags$b("FastRPA:"),"Plant Root Measurement filtering, analysis and interpretation")),

  # Sidebar layout with input and output definitions ----
  sidebarLayout(

    # Sidebar panel for inputs ----
    sidebarPanel(

      tags$p("The shiny app allows user to choose a input file, the app
             will plot the root measurements with respect to treatment type and gene lines."),

      tags$p("Input file MUST be of .csv format"),

      # input
      fileInput("file1", "Choose FASTA file", accept = c("text/csv", "text/comma-separated-values,text/plain",".csv")),

      # actionButton
      actionButton(inputId = "button1", label = "Start!"),

      br(),

    ), # End of side pannel

    mainPanel(

      # Output: Tabet
      tabsetPanel(type = "tabs",
                  tabPanel("Plot",
                           plotOutput("plot"), verbatimTextOutput('textOut')),
                  tabPanel("Data table", dataTableOutput('textOut1'))
      )
    )
  )
)



#req(input$file1)

# Define server logic for random distribution app ----
server <- function(input, output) {

  #press the start button lead to running this reaction
  processInput <- eventReactive(eventExpr = input$button1, {

    req(input$file1)
    inFile <- input$file1
    printer <- createRootBarG(inFile$datapath)
    #check file existence
  })

  #result plot output
  output$plot <- renderPlot ({
    createRootBarG(processInput())
  })

  # #text output
  # output$textOut <- renderPrint({
  #   if (! is.null(processInput()))
  #     processInput()$printer
  # })

  # #Data frame output
  # output$textOut1 <- renderDataTable({
  #   if (! is.null(processInput()))
  #     processInput()
  # })

}
shinyApp(ui = ui, server = server)


