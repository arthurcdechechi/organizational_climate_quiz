#' engajamento UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_engajamento_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' engajamento Server Functions
#'
#' @noRd 
mod_engajamento_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_engajamento_ui("engajamento_ui_1")
    
## To be copied in the server
# mod_engajamento_server("engajamento_ui_1")
