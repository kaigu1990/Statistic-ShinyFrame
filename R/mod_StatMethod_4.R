# Module UI
  
#' @title   mod_StatMethod_4_ui and mod_StatMethod_4_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_StatMethod_4
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_StatMethod_4_ui <- function(id){
  ns <- NS(id)
  tabPanel(
    title = "StatMethod_4", icon = icon("external-link-square-alt"), value = "StatMethod4",
    column(
      width = 4, offset = 4,
      img(src = "building.jpg", style = "vertical-align: middle; width: 500px")
    )
  )
}
    
# Module Server
    
#' @rdname mod_StatMethod_4
#' @export
#' @keywords internal
    
mod_StatMethod_4_server <- function(input, output, session){
  ns <- session$ns
}
    
## To be copied in the UI
# mod_StatMethod_4_ui("StatMethod_4_ui_1")
    
## To be copied in the server
# callModule(mod_StatMethod_4_server, "StatMethod_4_ui_1")
 
