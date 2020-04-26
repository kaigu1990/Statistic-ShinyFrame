#' Big box for landing page
#'
#' @param title_box Title of box
#' @param image_name Name of image
#' @param button_name Name of button
#' @param description Creating big boxes for main tabs in the landing page (see ui for formatting css)
#'
#' @return
#' @export
lp_main_box <- function(title_box, image_name, button_name, description) {
    div(class = "landing-page-box", div(title_box, class = "landing-page-box-title"), div(description, 
        class = "landing-page-box-description"), div(class = "landing-page-icon", style = paste0("background-image: url(", 
        image_name, ".png); 
          background-size: auto 80%; 
          background-position: center; 
          background-repeat: no-repeat; ")), 
        actionButton(button_name, NULL, class = "landing-page-button"))
}

lp_minor_box <- function(title_box, image_name, button_name, description) {
    div(class = "landing-page-box-about", div(title_box, class = "landing-page-box-title"), div(class = "landing-page-about-icon", 
        style = paste0("background-image: url(", image_name, ".png);
          background-size: auto 80%; 
          background-position: center; 
          background-repeat: no-repeat; ")), 
        actionButton(button_name, NULL, class = "landing-page-button", icon = icon("arrow-circle-right", 
            "icon-lp"), title = description))
}


#-------------------------------------------------------------------------------------#



