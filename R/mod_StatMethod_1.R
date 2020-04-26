# Module UI
  
#' @title   mod_StatMethod_1_ui and mod_StatMethod_1_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_StatMethod_1
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_StatMethod_1_ui <- function(id){
  ns <- NS(id)
  
  tabPanel(
    title = "StatMethod_1", icon = icon("area-chart"), value = "StatMethod1",
    sidebarPanel(
      width = 4,
      column(
        width = 6,
        actionButton(ns("help_outlier"), label = "Help", icon = icon("question-circle"), class = "down")
      ),
      column(
        width = 6,
        actionButton(ns("defs_outlier"), label = "Definitions", icon = icon("info"), class = "down")
      ),
      
      column(
        width = 12,
        
        shiny::hr(),
        div(
          title = "Select a data file. Click in this box, choose one file you want to input this tool.",
          p(
            tags$b("Step 1. Select a data file "),
            p("(The file format could be .csv or comma-separated)")
          ),
          
          div(
            tags$style(".shiny-input-container {margin-bottom: 0px} #file_progress { margin-bottom: 5px }"),
            fileInput(
              inputId = ns("file"), label = NULL, buttonLabel = "Upload...",
              placeholder = "No file selected...", width = "75%",
              accept = c("text/csv", "text/comma-separated-values,text/plain")
            ),
            prettySwitch(
              inputId = ns("checkData"),
              label = "Check Data",
              status = "success",
              fill = TRUE
            )
          )
        ),
        
        shiny::hr(),
        div(
          title = "Select what methods you want to apply for.",
          p(
            tags$b("Step 2. Select methods of identifying outliers."),
            p("(You can select one or more method below)")
          ),
          
          tags$style(HTML(
            ".btn-primary, .btn-primary:hover, .btn-primary:active, .btn-primary:visited {
                       background-color: #4da6ff !important;
                     }"
          )),
          checkboxGroupButtons(
            inputId = ns("outlierMethod"),
            width = "120%",
            individual = TRUE,
            choices = c("Method1", "Method2"), status = "primary",
            checkIcon = list(
              yes = tags$i(
                class = "fa fa-check-square",
                style = "color: white"
              ),
              no = tags$i(
                class = "fa fa-square-o",
                style = "color: white"
              )
            )
          )
        ),
        
        shiny::hr(),
        div(
          title = "Comfirm that you are ready to start executing the program.",
          p(tags$b("Step 3. Decide to execute the program.")),
          
          actionButton(
            inputId = ns("confirm"),
            label = "Confirm"
          ),
          
          snackbar(
            id = ns("mysnackbar"),
            message = "Wait a monment...",
            style = "background-color:#4da6ff; color:white; padding:5px 5px 5px 5px;  position:fixed;left: calc(5% + 100px);"
          )
        ),
        
        shiny::hr(),
        div(
          title = "Download statistical report!",
          p(tags$b("Step 4. Download this statistical report.")),
          
          downloadButton(
            outputId = ns("download_outlier_report"),
            label = "Download report"
          )
        )
      )
    ),
    
    mainPanel(
      width = 8,
      div(
        class = "depr-text-box",
        div(class = "title", p(tags$b("The results of ..."))),
        div(
          class = "content",
          tags$ul(
            tags$li(class = "li-custom", p("Method1: ......")),
            tags$li(class = "li-custom", p("Method2: ......"))
          )
        )
      ),
      
      conditionalPanel(
        condition = 'input.confirm > 0 && input.outlierMethod.includes("Method1")',
        ns = ns,
        column(
          width = 12,
          gradientBox(
            title = h3("Method: Method1", style = "color:#4da6ff;"),
            icon = "fa-line-chart",
            width = 10,
            align = "center",
            gradientColor = "primary",
            boxToolSize = "sm",
            footer = div(
              style = "text-align:center;",
              div(
                h4("....."),
                DT::dataTableOutput(ns("tableFoot1"), width = "80%"),
                style = "font-size: 98%; width: 75%; display:inline-block; text-align: left"
              )
            ),
            tabBox(
              title = "Plot and Table",
              side = "right",
              width = 12,
              selected = "Visualization",
              id = ns("tabset1"),
              tabPanel(
                title = "Table",
                DTOutput(ns("tb1"))
              ),
              tabPanel(
                title = "Visualization",
                dropdownButton(
                  label = "Controls",
                  icon = icon("sliders"),
                  status = "primary",
                  circle = FALSE,
                  sliderInput(
                    inputId = ns("cutoff"),
                    label = "Choose a cutoff for visual check",
                    min = 0, max = 2, value = 0, step = 0.1
                  )
                ),
                plotlyOutput(ns("plot_dev"))
              )
            )
          )
        )
      ),
      
      conditionalPanel(
        condition = 'input.confirm > 0 && input.outlierMethod.includes("Method2")',
        ns = ns,
        column(
          width = 12,
          gradientBox(
            title = h3("Method: Method2", style = "color:#4da6ff;"),
            icon = "fa-line-chart",
            width = 10,
            align = "center",
            gradientColor = "primary",
            boxToolSize = "sm",
            footer = div(
              style = "text-align:center;",
              div(
                h4("......"),
                DT::dataTableOutput(ns("tableFoot2"), width = "80%"),
                style = "font-size: 98%; width: 75%; display:inline-block; text-align: left"
              )
            ),
            tabBox(
              title = "......",
              side = "right",
              width = 12,
              selected = "Absolute",
              id = ns("tabset1"),
              tabPanel(
                title = "Relative",
                plotlyOutput(ns("plot_relative")),
                br(),
                DTOutput(ns("tb2_relative"), width = "90%")
              ),
              tabPanel(
                title = "Absolute",
                plotlyOutput(ns("plot_absolute")),
                br(),
                DTOutput(ns("tb2_absolute"), width = "90%")
              )
            )
          )
        )
      )
    )
  )
}
    
# Module Server
    
#' @rdname mod_StatMethod_1
#' @export
#' @keywords internal
    
mod_StatMethod_1_server <- function(input, output, session){
  ns <- session$ns
}
    
## To be copied in the UI
# mod_StatMethod_1_ui("StatMethod_1_ui_1")
    
## To be copied in the server
# callModule(mod_StatMethod_1_server, "StatMethod_1_ui_1")
 
