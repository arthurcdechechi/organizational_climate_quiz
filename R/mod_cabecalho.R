#' cabecalho UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_cabecalho_ui <- function(id){
  ns <- NS(id)
  tagList(
    h2("Informações Iniciais"),
    br(),
    textInput(
      inputId = "InputNome",
      label = "1. Qual o seu nome?",
      placeholder = "Insira o seu nome: "
    ),
    br(),
    dateInput(
      inputId = "InputDataNascimento",
      label = "2. Qual a sua data de nascimento? ",
      format = "dd-mm-yyyy",
      min = "1922-01-01",
      autoclose = TRUE
    ),
    br(),
    numericInput(
      inputId = "InputHrsTrabalho",
      label = "3. Qual sua carga horária de trabalho diária? ",
      min = 1,
      max = 8,
      step = 1,
      value = 5
    ),
    br(),
    shinyWidgets::checkboxGroupButtons(
      inputId = "InputEquipes",
      label = "4. Em quais equipes você já trabalhou?",
      choiceNames = c(
        "Dados",
        "Primeira Infância",
        "Transição Escola-Trabalho",
        "Moove",
        "Outra(s)"
      ),
      choiceValues = c(
        1:5
      ),
      direction = "vertical",
      status = "primary"
    ),
    uiOutput('outra_area'),
    br()
  )
}
    
#' cabecalho Server Functions
#'
#' @noRd 
mod_cabecalho_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    observe({
      if(5 %in% input$InputEquipes){
        output$outra_area <- renderUI({
          textInput(
            inputId = "InputOutraArea",
            label = "Qual(is) outra(s) área(s)? ",
            value = input$InputOutraArea
          )
        })
      } else {
        output$outra_area <- renderUI({HTML('')})
      }
    })
  })
}
    
## To be copied in the UI
# mod_cabecalho_ui("cabecalho_ui_1")
    
## To be copied in the server
# mod_cabecalho_server("cabecalho_ui_1")
