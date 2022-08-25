#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
    # mod_cabecalho_server("cabecalho_ui_1")
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
    
    observe({
        
        if(input$InputAreaAtual == "X"){
            output$QuestoesEquipe <- renderUI({
                tagList(
                    shinyWidgets::radioGroupButtons(
                        inputId = "VE_01",
                        label = "1. Pergunta voltada para a equipe de X.",
                        choices = c(
                            1:5
                        ),
                        status = "primary"
                    ),
                    shinyWidgets::radioGroupButtons(
                        inputId = "VE_02",
                        label = "2. Pergunta voltada para a equipe de X.",
                        choices = c(
                            1:5
                        ),
                        status = "primary"
                    ),
                    shinyWidgets::radioGroupButtons(
                        inputId = "VE_03",
                        label = "3. Pergunta voltada para a equipe de X.",
                        choices = c(
                            1:5
                        ),
                        status = "primary"
                    )
                )
            })
        }else if(input$InputAreaAtual == "Y"){
            output$QuestoesEquipe <- renderUI({
                tagList(
                    shinyWidgets::radioGroupButtons(
                        inputId = "VE_01",
                        label = "1. Pergunta voltada para a equipe de Y.",
                        choices = c(
                            1:5
                        ),
                        status = "primary"
                    ),
                    shinyWidgets::radioGroupButtons(
                        inputId = "VE_02",
                        label = "2. Pergunta voltada para a equipe de Y.",
                        choices = c(
                            1:5
                        ),
                        status = "primary"
                    ),
                    shinyWidgets::radioGroupButtons(
                        inputId = "VE_03",
                        label = "3. Pergunta voltada para a equipe de Y.",
                        choices = c(
                            1:5
                        ),
                        status = "primary"
                    )
                )
            })
        }else if(input$InputAreaAtual == "W"){
            output$QuestoesEquipe <- renderUI({
                tagList(
                    shinyWidgets::radioGroupButtons(
                        inputId = "VE_01",
                        label = "1. Pergunta voltada para a equipe de W.",
                        choices = c(
                            1:5
                        ),
                        status = "primary"
                    ),
                    shinyWidgets::radioGroupButtons(
                        inputId = "VE_02",
                        label = "2. Pergunta voltada para a equipe de W.",
                        choices = c(
                            1:5
                        ),
                        status = "primary"
                    ),
                    shinyWidgets::radioGroupButtons(
                        inputId = "VE_03",
                        label = "3. Pergunta voltada para a equipe de W.",
                        choices = c(
                            1:5
                        ),
                        status = "primary"
                    )
                )
            })
        }else if(input$InputAreaAtual == "Z"){
            output$QuestoesEquipe <- renderUI({
                tagList(
                    shinyWidgets::radioGroupButtons(
                        inputId = "VE_01",
                        label = "1. Pergunta voltada para a equipe de Z.",
                        choices = c(
                            1:5
                        ),
                        status = "primary"
                    ),
                    shinyWidgets::radioGroupButtons(
                        inputId = "VE_02",
                        label = "2. Pergunta voltada para a equipe de Z.",
                        choices = c(
                            1:5
                        ),
                        status = "primary"
                    ),
                    shinyWidgets::radioGroupButtons(
                        inputId = "VE_03",
                        label = "3. Pergunta voltada para a equipe de Z.",
                        choices = c(
                            1:5
                        ),
                        status = "primary"
                    )
                )
            })
        }
    })
    
    respostas <- data.frame(matrix(ncol = 15))
    names(respostas) <- c(
        "nome", "data_nascimento", "hrs_trabalho",
        "equipes","outras_equipes", "area_atual",
        "VE_01", "VE_02", "VE_03",
        "V01_01", "V01_02", "V01_03",
        "V02_01", "V02_02", "V02_03"
    )
    observeEvent(
        input$continuar,{
            respostas[,"nome"] <- input$InputNome
            respostas[,"data_nascimento"] <- as.character(input$InputDataNascimento)
            respostas[,"hrs_trabalho"] <- input$InputHrsTrabalho 
            respostas[,"hrs_trabalho"] <- input$InputHrsTrabalho 
            respostas[,"equipes"] <- toString(input$InputEquipes)
            respostas[,"outras_equipes"] <- input$InputOutraArea
            respostas[,"area_atual"] <- input$InputAreaAtual
            respostas[,"VE_01"] <- input$VE_01
            respostas[,"VE_02"] <- input$VE_02
            respostas[,"VE_03"] <- input$VE_03
            respostas[,"V01_01"] <- input$Input_q01_01
            respostas[,"V01_02"] <- input$Input_q01_02
            respostas[,"V01_03"] <- input$Input_q01_03
            respostas[,"V02_01"] <- input$Input_q02_01
            respostas[,"V02_02"] <- input$Input_q02_02
            respostas[,"V02_03"] <- input$Input_q02_03
            output$respostas_final <- renderTable(
                respostas
            )
            print(respostas)
        }
    )
}
