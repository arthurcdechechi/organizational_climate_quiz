#' trabalho_equipe UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_trabalho_equipe_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' trabalho_equipe Server Functions
#'
#' @noRd 
mod_trabalho_equipe_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_trabalho_equipe_ui("trabalho_equipe_ui_1")
    
## To be copied in the server
# mod_trabalho_equipe_server("trabalho_equipe_ui_1")
