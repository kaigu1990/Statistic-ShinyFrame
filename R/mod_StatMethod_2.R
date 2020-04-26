# Module UI
  
#' @title   mod_StatMethod_2_ui and mod_StatMethod_2_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_StatMethod_2
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_StatMethod_2_ui <- function(id){
  ns <- NS(id)
  
  tabPanel(
    title = "StatMethod_2", icon = icon("fas fa-vial"), value = "StatMethod2",
    column(
      width = 4, offset = 4,
      img(src = "building.jpg", style = "vertical-align: middle; width: 500px")
    )
  )
}
    
# Module Server
    
#' @rdname mod_StatMethod_2
#' @export
#' @keywords internal
    
mod_StatMethod_2_server <- function(input, output, session){
  ns <- session$ns
}
    
## To be copied in the UI
# mod_StatMethod_2_ui("StatMethod_2_ui_1")
    
## To be copied in the server
# callModule(mod_StatMethod_2_server, "StatMethod_2_ui_1")
 
