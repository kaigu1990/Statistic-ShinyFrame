# Module UI
  
#' @title   mod_Home_ui and mod_Home_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_Home
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_Home_ui <- function(id){
  ns <- NS(id)
  
  tabPanel(
    title = " Home",
    icon = icon("home"),
    mainPanel(
      width = 11,
      style = "margin-left:4%; margin-right:4%",
      fluidRow(
        column(8, (
          h3("Welcome to the XXX Stat-profiles", style = "margin-top:0px;")
        )),
        column(
          3,
          offset = 1,
          actionButton(
            ns("jump_to_tutorial"),
            label = "Help: Take tutorial of the tool",
            icon = icon("question-circle"),
            class = "down"
          )
        ),
        br(),
        br(),
        br()
      ),
      
      fluidRow(
        # StatMethod_1 box
        column(
          width = 4,
          class = "landing-page-column",
          br(),
          # spacing
          lp_main_box(
            image_name = "StatMethod_1_images",
            button_name = ns("jump_to_StatMethod_1"),
            title_box = "StatMethod_1",
            description = "About ......"
          )
        ),
        
        # StatMethod_2 box
        column(
          width = 4,
          class = "landing-page-column",
          br(),
          # spacing
          lp_main_box(
            image_name = "StatMethod_2_images",
            button_name = ns("jump_to_StatMethod_2"),
            title_box = "StatMethod_2",
            description = "About ......"
          )
        ),
        
        # StatMethod_3 box
        column(
          width = 4,
          class = "landing-page-column",
          br(),
          # spacing
          lp_main_box(
            image_name = "StatMethod_3_images",
            button_name = ns("jump_to_StatMethod_3"),
            title_box = "StatMethod_3",
            description = "About ......"
          )
        )
      ),
      
      fluidRow(
        # StatMethod_4 box
        column(
          width = 4, offset = 2,
          class = "landing-page-column",
          br(),
          # spacing
          lp_main_box(
            image_name = "StatMethod_4_images",
            button_name = ns("jump_to_StatMethod_4"),
            title_box = "StatMethod_4",
            description = "About ......"
          )
        ),
        
        # StatMethod_5 box
        column(
          width = 4,
          class = "landing-page-column",
          br(),
          # spacing
          lp_main_box(
            image_name = "StatMethod_5_images",
            button_name = ns("jump_to_StatMethod_5"),
            title_box = "StatMethod_5",
            description = "About ......"
          )
        )
      ),
      
      fluidRow(
        column(
          width = 4,
          class = "landing-page-column",
          br(),
          lp_minor_box(
            image_name = "landing_button_about",
            button_name = ns("jump_to_about"),
            title_box = "About",
            description = "About Tool Profiles"
          )
        ),
        
        column(
          width = 4,
          class = "landing-page-column",
          br(),
          lp_minor_box(
            image_name = "landing_button_calendar",
            button_name = ns("jump_to_updates"),
            title_box = "Updates",
            description = "Find out which modules have been updated in the last 90 days"
          )
        ),
        
        column(
          width = 4,
          class = "landing-page-column",
          br(),
          lp_minor_box(
            image_name = "landing_button_technical_resources",
            button_name = ns("jump_to_definitions"),
            title_box = "Definitions",
            description = "Find out about indicator definitions and data sources"
          )
        )
      )
    )
  )
}
    
# Module Server
    
#' @rdname mod_Home
#' @export
#' @keywords internal
    
mod_Home_server <- function(input, output, session){
  ns <- session$ns
  
  rv <- reactiveValues(
    jump_to_StatMethod_1 = NULL,
    jump_to_StatMethod_2 = NULL,
    jump_to_StatMethod_3 = NULL,
    jump_to_StatMethod_4 = NULL,
    jump_to_StatMethod_5 = NULL,
    jump_to_about = NULL,
    jump_to_definitions = NULL,
    jump_to_tutorial = NULL
  )
  
  observe({
    rv$jump_to_StatMethod_1 <- input$jump_to_StatMethod_1
    rv$jump_to_StatMethod_2 <- input$jump_to_StatMethod_2
    rv$jump_to_StatMethod_3 <- input$jump_to_StatMethod_3
    rv$jump_to_StatMethod_4 <- input$jump_to_StatMethod_4
    rv$jump_to_StatMethod_5 <- input$jump_to_StatMethod_5
    rv$jump_to_about <- input$jump_to_about
    rv$jump_to_definitions <- input$jump_to_definitions
    rv$jump_to_tutorial <- input$jump_to_tutorial
  })
  
  
  #----------------------------------------------------------------------#
  # Update Models
  updates_modal <- modalDialog(
    fluidRow(column(
      width = 12,
      p(
        div("Continuously update and develop our tool",
            style = "color:0E3E5D; font-size:20px; width: 90%; text-align: left; "
        )
      ),
      br(),
      br(),
      p(
        h5("Recent indicator updates include:",
           style = "width: 90%; text-align: left; font-weight: bold;"
        )
      )
    )),
    size = "l",
    align = "center",
    easyClose = TRUE,
    fade = TRUE,
    footer = modalButton("Close (Esc)")
  )
  
  observeEvent(input$jump_to_updates, {
    showModal(updates_modal)
  })
  
  return(rv)
}
    
## To be copied in the UI
# mod_Home_ui("Home_ui_1")
    
## To be copied in the server
# callModule(mod_Home_server, "Home_ui_1")
 
