#' Title
#'
#' @param id 
#'
#' @return
#' @export
#'
#' @examples
about_cont <- function(id) {
    mainPanel(width = 8, h3("About", style = "color:black;", style = "margin-bottom: 30px"), p("This profiles tool allows users to explore the various different datasets "), 
        p("The profiles are intended to......"), p("If you have any trouble accessing any information on this site or have any further questions or feedback relating to the data or the tool, then please contact us at: ", 
            tags$b(tags$a(href = "mailto:gukai1212@163.com", "gukai1212.@163.com", class = "externallink")), 
            "and we will be happy to help."))
}
