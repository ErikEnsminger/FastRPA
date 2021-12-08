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
      tags$p("NOTE 2: filterData() and analyseRootData() will not automatically
             export generated Data to output file. To download data click 'Download .csv' on the right, once the functions were run"),
      selectInput("functionType", "Select which function to use", c("filterData", "analyseRootData", "createRootBarG")),

      tags$br(),

    #), #closing bracket for sidbarPanel
    tags$p("-------------------------------------------------"),


#================== Input for function 1: filterData() ==================
    #sidebarPanel(
       tags$h5("Use the following paramter inputs if you wish to use function filterData()"),
       #inputFile
       fileInput("fileFunc1In", "Choose a .csv input file for filterData() ", accept = c("text/csv", "text/comma-separated-values,text/plain",".csv")),

      #vector input for ROI's
    textAreaInput("list","Enter list of ROIs (1 space between numbers)", "3 4 5"),
    #the root lines for the selected rois
     textInput("rootLines", "Enter the name for the Root Lines of ROIs", "BTR34.1"),

    #the root treatment for the selected rois
   textInput("rootTreatment", "Enter the name for the Root Treatment of ROIs", "MEX"),

   #outputFile
   fileInput("fileFunc1Out", "Choose the .csv output file for filterData() ", accept = c("text/csv", "text/comma-separated-values,text/plain",".csv")),

    #), #closing for 2nd sidebarPanel


tags$p("-------------------------------------------------"),



#================== Input for function 2: analyseRootData() ==================
       tags$h5("Use the following inputs to use function analyseRootData()"),
      # input
      fileInput("fileFunc2In", "Choose the .csv output file for analyseRootData() ", accept = c("text/csv", "text/comma-separated-values,text/plain",".csv")),
      textInput("controlTreatment", "Enter the Control Treatment", "WES"),
      fileInput("fileFunc2Out", "Choose the .csv output file for analyseRootData() ", accept = c("text/csv", "text/comma-separated-values,text/plain",".csv")),


tags$p("-------------------------------------------------"),
#================== Input for function 3: createRootBarG() ==================
      tags$h5("Use theses parameter inputs if you wish to use function createRootBarG()"),
      # input
      fileInput("file1", "Choose .csv file for createRootBarG() ", accept = c("text/csv", "text/comma-separated-values,text/plain",".csv")),


tags$p("-------------------------------------------------"),
#================== Action button: Start! ==================
      # actionButton
      actionButton(inputId = "button1", label = "Start!"),

      br(),


    ), # End of side pannel

    mainPanel(

      downloadButton("downloadb", "Download .csv"),

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

      filterData(input$fileFunc1In$datapath,as.numeric(strsplit(input$list,' ')[[1]]), input$rootLines, input$rootTreatment, input$fileFunc1Out$datapath)
      # complete <- "process complete"
      # print(complete)
      # print(as.numeric(input$roi))
    }
    else { #this means that input$functionType == "filterData" is TRUE
      analyseRootData(input$fileFunc2In$datapath, input$controlTreatment, input$fileFunc2Out$datapath)

      #write.csv(df2, file = outputFile, row.names=FALSE)
      }

  })

  # text output for analyseRootBarG
  output$plot <- renderPlot ({
    validate(need(input$functionType=="createRootBarG", message=FALSE))
    processInput()$outputPlot
    #createRootBarG(processInput()$path)
  })


  # text output for createRooBarG
  output$textOut <- renderPrint({
    validate(need(input$functionType=="createRootBarG", message=FALSE))
    if (! is.null(processInput()))
      processInput()$outputText
  })


  #Data frame output for filterData
  output$textOut3 <- renderDataTable({
    validate(need(input$functionType=="filterData", message=FALSE))
    if (! is.null(processInput()))
      processInput()
      #write.csv(processInput()$df2, file = input$fileFunc1Out$datapath, row.names = FALSE)
  })

  output$downloadb <- downloadHandler(

    #if (! is.null(processInput()))
    filename = function() {
      #paste(input$fileFunc1Out, ".csv")
      paste0("fileToBeExported", ".csv")
      },

    content = function(file) {
      write.csv(processInput(), file, row.names = FALSE)

    })


  #Data frame output for analyseRootData
  output$textOut1 <- renderDataTable({
    validate(need(input$functionType=="analyseRootData", message=FALSE))
    if (! is.null(processInput()))
      processInput()
  })

}

shinyApp(ui = ui, server = server)

# [END]

