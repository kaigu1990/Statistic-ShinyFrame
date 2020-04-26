#' Title
#'
#' @param id 
#'
#' @return
#' @export
#'
#' @examples
resource_cont <- function(id){
  mainPanel(
    width = 8,
    h3("Resources", style = "color:black; margin-bottom: 30px"),
    p("We list a number of resources that help you to understand better the profiles. "),
    tags$ul(
      # Link to user guide
      tags$li(
        class= "li-custom",
        tags$a(href="https://www.google.com", "User quick reference guide", class="externallink"),
        " - Learn how to use and get the most out of the tool"
      ),
      # Link to timetable of updates
      tags$li(
        class= "li-custom",
        tags$a(href="https://www.google.com", "Timetable of updates", class="externallink"),
        " - List of available indicators, date of last update and expected next update"
      )
    )
  )
}