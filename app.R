pkgs <- c(
  "shiny", "shinyWidgets", "shinyjs", "shinythemes", "ggthemes", "shinydashboard",
  "shinydashboardPlus", "DT", "plotly", "shinyFeedback", "waiter",
  "rmarkdown", "ggplot2", "dplyr", "tidyr"
)

for (i in 1:length(pkgs)) {
  suppressMessages(suppressWarnings(library(pkgs[i], character.only = TRUE)))
}

sapply(list.files("./R", full.names = T), source)


#------------------------------------------------------------------------------------------#

# Header ----
ui <- tagList( # needed for shinyjs
  useShinyjs(), # include shinyjs
  useShinydashboardPlus(), # include useShinydashboardPlus
  useShinyFeedback(), # include shinyFeedback
  use_waiter(), # include waiter
  useShinyFeedback(), # include ShinyFeedback
  useSweetAlert(), # include useSweetAlert
  # useTablerDash(), # include tablerDash in shinyWidgets
  # introjsUI(),   # required to enable introjs scripts
  navbarPage(
    id = "intabset", # needed for landing page
    title = div(
      tags$a(img(src = "Github.png", height = 45), href = "https://www.google.com/"),
      style = "position: relative; top: -13px;"
    ), # Navigation bar
    windowTitle = "Stat-profiles", # title for browser tab
    # theme = shinytheme("default"), #Theme of the app (blue navbar)
    collapsible = TRUE, # tab panels collapse into menu in small screens
    header =
      tags$head( # CSS styles
        # cookie_box, ##Cookie box
        tags$link(rel = "shortcut icon", href = "favicon.ico"), # Icon for browser tab
        # Including Google analytics and Cookie control
        # includeScript("google-analytics.js"),
        # HTML('<script src="https://cc.cdn.civiccomputing.com/8/cookieControl-8.x.min.js"></script>'),
        # includeScript("cookie-control.js"),
        includeCSS("www/styles.css"),
        HTML("<base target='_blank'>") # to make external links open a new tab
      ),

    #----------------------------------------------------------------------#
    # Load main ui modules
    mod_Home_ui("Home_ui_1"),
    mod_StatMethod_1_ui("StatMethod_1_ui_1"),
    mod_StatMethod_2_ui("StatMethod_2_ui_1"),
    mod_StatMethod_3_ui("StatMethod_3_ui_1"),
    mod_StatMethod_4_ui("StatMethod_4_ui_1"),
    mod_StatMethod_5_ui("StatMethod_5_ui_1"),
    mod_info_module_ui("info_module_ui_1")
  )
)

server <- function(input, output, session) {

  #----------------------------------------------------------------------#
  # Main tools in Server logic module
  home_res <- callModule(mod_Home_server, "Home_ui_1")
  StatMethod_1_res <- callModule(mod_StatMethod_1_server, "StatMethod_1_ui_1")
  StatMethod_2_res <- callModule(mod_StatMethod_2_server, "StatMethod_2_ui_1")
  StatMethod_3_res <- callModule(mod_StatMethod_3_server, "StatMethod_3_ui_1")
  StatMethod_4_res <- callModule(mod_StatMethod_4_server, "StatMethod_4_ui_1")
  StatMethod_5_res <- callModule(mod_StatMethod_5_server, "StatMethod_5_ui_1")
  info_res <- callModule(mod_info_module_server, "info_module_ui_1")

  #----------------------------------------------------------------------#
  # Page jumps
  observeEvent(home_res$jump_to_StatMethod_1, {
    updateTabsetPanel(session, "intabset", selected = "StatMethod1")
  })

  observeEvent(home_res$jump_to_StatMethod_2, {
    updateTabsetPanel(session, "intabset", selected = "StatMethod2")
  })

  observeEvent(home_res$jump_to_StatMethod_3, {
    updateTabsetPanel(session, "intabset", selected = "StatMethod3")
  })
  
  observeEvent(home_res$jump_to_StatMethod_4, {
    updateTabsetPanel(session, "intabset", selected = "StatMethod4")
  })
  
  observeEvent(home_res$jump_to_StatMethod_5, {
    updateTabsetPanel(session, "intabset", selected = "StatMethod5")
  })

  observeEvent(home_res$jump_to_about, {
    updateTabsetPanel(session, "intabset", selected = "about")
  })

  observeEvent(home_res$jump_to_definitions, {
    updateTabsetPanel(session, "intabset", selected = "definitions")
  })

  observeEvent(home_res$jump_to_tutorial, {
    updateTabsetPanel(session, "intabset", selected = "tutorial")
  })
}

shinyApp(ui, server)
