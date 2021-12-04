ui <- fluidPage(
  # App title ----
  titlePanel(tags$h1(tags$b("FastRPA:"),"Plant Root Measurement filtering, analysis and interpretation")),

  # Sidebar layout with input and output definitions ----
  sidebarLayout(

    # Sidebar panel for inputs ----
    sidebarPanel(

      tags$p("The shiny app allows user to choose a input file, the app
             will plot the root measurements with respect to treatment type and gene lines."),

      tags$p("NOTE: Input and Output file MUST be of .csv format"),

      selectInput("functionType", "Select which function to use", c("filterData", "analyseRootData", "createRootBarG")),

      tags$br(),
    #), #closing bracket for sidbarPanel
    tags$p("-------------------------------------------------"),


#================== Input for function 1: filterData() ==================
    #sidebarPanel(
       tags$h5("Use parameter inputs if you wish to use function filterData()"),
       #inputFile
       fileInput("fileFunc1In", "Choose a .csv input file for filterData() ", accept = c("text/csv", "text/comma-separated-values,text/plain",".csv")),

      #vector input for ROI's
      selectizeInput(
        "roi"
        , "Enter the ROIs to filter by filterData()"
        , choices = NULL
        , multiple = TRUE
        , options = list(create = TRUE)
      ),

    #the root lines for the selected rois
     textInput("rootLines", "Enter the name for the Root Lines of ROIs", "ex. BTR34.1"),

    #the root treatment for the selected rois
   textInput("rootTreatment", "Enter the name for the Root Treatment of ROIs", "ex. MEX"),

   #outputFile
   fileInput("fileFunc1Out", "Choose the .csv output file for filterData() ", accept = c("text/csv", "text/comma-separated-values,text/plain",".csv")),

    #), #closing for 2nd sidebarPanel


tags$p("-------------------------------------------------"),



#================== Input for function 2: analyseRootData() ==================
       tags$p("Use the following parameters to use function analyseRootData()"),
      # input


tags$p("-------------------------------------------------"),
#================== Input for function 3: createRootBarG() ==================
      tags$p("Use theses parameter inputs if you wish to use function createRootBarG()"),
      # input
      fileInput("file1", "Choose FASTA file", accept = c("text/csv", "text/comma-separated-values,text/plain",".csv")),


tags$p("-------------------------------------------------"),
#================== Action button: Start! ==================
      # actionButton
      actionButton(inputId = "button1", label = "Start!"),

      br(),

    ), # End of side pannel

    mainPanel(

      # Output: Tabet
      tabsetPanel(type = "tabs",
                  tabPanel("filterData", textOutput('textOut2'), dataTableOutput('textOut3')),
                  tabPanel("analyseRootData", dataTableOutput('textOut1')),
                  tabPanel("CreateRootBarG",
                           plotOutput("plot"), verbatimTextOutput('textOut'))

      )
    )
  )
)





# Define server logic for random distribution app ----
server <- function(input, output) {

  #press the start button lead to running this reaction
  processInput <- eventReactive(eventExpr = input$button1, {
    #req(input$file1)


    if (input$functionType == "createRootBarG"){
      createRootBarG(input$file1$datapath)
    }
    else if (input$functionType == "filterData"){

      dt <- filterData(input$fileFunc1In$datapath, as.numeric(input$roi), input$rootLines, input$rootTreatment, input$fileFunc1Out$datapath)
      dt
      complete <- "process complete"
      print(complete)
    }

  })

  # text output for analyseRootBarG
  output$plot <- renderPlot ({
    processInput()$outputPlot
    #createRootBarG(processInput()$path)
  })

  # text output for createRooBarG
  output$textOut <- renderPrint({
    if (! is.null(processInput()))
      processInput()$outputText
  })

  # output$textOut2 <- renderPrint({
  #   processInput()
  # })
  #
  # #Data frame output
  # output$textOut3 <- renderDataTable({
  #   if (! is.null(processInput()))
  #     processInput()
  # })

}

shinyApp(ui = ui, server = server)


