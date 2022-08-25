#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
    fluidPage(
        theme = shinythemes::shinytheme("united"),
        titlePanel(
            "Pesquisa: Clima Organizacional"
        ),
        navlistPanel(
            fluid = TRUE,
            tabPanel(
                "",
                h4("Olá!"),
                br(),
                h4("Iremos realizar uma avaliação para conhecer melhor as suas percepções sobre o seu local de trabalho. Com esta avaliação, pretendemos traçar planos de ação com o intuito de trazer melhorias à empresa."),
                br(),
                h4("Serão aplicados: um questionário com dados iniciais, e duas escalas: a Escala de Clima Organizacional e a Escala de Satisfação no Trabalho. Pedimos para que você reserve um tempo para responder com calma e seja o mais verdadeiro(a) possível."),
                br(),
                h4("As respostas são anônimas, trazendo resultados gerais e não individuais.")
            ),
            tabPanel(
                "Informações Gerais",
                h2("Informações Gerais"),
                br(),
                textInput(
                    inputId = "InputNome",
                    label = "1. Qual o seu nome?",
                    placeholder = "Insira o seu nome: "
                ),
                br(),
                dateInput(
                    startview = "year",
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
                    label = "4. Em quais equipes da nossa empresa você já trabalhou?",
                    choiceNames = c(
                        "X",
                        "Y",
                        "W",
                        "Z",
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
            ),
            tabPanel(
                "Atividades",
                h2("Atividades"),
                br(),
                h5("1. Qual a sua equipe atual?"),
                shinyWidgets::pickerInput(
                    inputId = "InputAreaAtual",
                    choices = c(
                        "X",
                        "Y",
                        "W",
                        "Z"
                    ),
                    options = list(
                        title = "Escolha a equipe:",
                        style = "primary"
                    )
                ),
                uiOutput(
                    "QuestoesEquipe"
                )
            ),
            tabPanel(
                "Engajamento",
                h2("Engajamento"),
                br(),
                h5("Em uma escala de 1 a 5, onde:"),
                h5("1. Discordo Fortemente"),
                h5("2. Discordo"),
                h5("3. Nem concordo, nem discordo"),
                h5("4. Concordo"),
                h5("5. Concordo Fortemente"),
                br(),
                shinyWidgets::radioGroupButtons(
                    "Input_q01_01",
                    label = "1. O quanto você sente orgulho do que realiza
        na empresa e compartilha esse sentimento?",
                    choices = c(
                        1:5
                    ),
                    selected = 1,
                    status = "primary"
                ),
                shinyWidgets::radioGroupButtons(
                    "Input_q01_02",
                    label = "2. O quanto você sabe gerenciar o tempo
        e priorizar os desafios e ações corretamente?",
                    choices = c(
                        1:5
                    ),
                    selected = 1,
                    status = "primary"
                ),
                shinyWidgets::radioGroupButtons(
                    "Input_q01_03",
                    label = "3. O quanto você recomendaria esta organização
        como um ótimo lugar para trabalhar?",
                    choices = c(
                        1:5
                    ),
                    selected = 1,
                    status = "primary"
                ),
                br()
            ),
            tabPanel(
                "Trabalho em Equipe",
                h2("Trabalho em Equipe"),
                br(),
                h5("Em uma escala de 1 a 5, onde:"),
                h5("1. Discordo Fortemente"),
                h5("2. Discordo"),
                h5("3. Nem concordo, nem discordo"),
                h5("4. Concordo"),
                h5("5. Concordo Fortemente"),
                br(),
                shinyWidgets::radioGroupButtons(
                    "Input_q02_01",
                    label = "1. O quanto você conhece os objetivos das outras áreas?",
                    choices = c(
                        1:5
                    ),
                    selected = 1,
                    status = "primary"
                ),
                shinyWidgets::radioGroupButtons(
                    "Input_q02_02",
                    label = "2. Quão claras são as metas e responsabilidades
        para todos em sua equipe?",
                    choices = c(
                        1:5
                    ),
                    selected = 1,
                    status = "primary"
                ),
                shinyWidgets::radioGroupButtons(
                    "Input_q02_03",
                    label = "3. Quão uniforme é a distribuição de trabalho
        realizada pela sua equipe?",
                    choices = c(
                        1:5
                    ),
                    selected = 1,
                    status = "primary"
                ),
                br(),
                actionButton(
                    "continuar",
                    label = "Enviar as respostas"
                ),
                tableOutput(
                    "respostas"
                ),
                br()
            ),
            tabPanel(
                "Respostas",
                tableOutput(
                    "respostas_final"
                )
            )
        )
    )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
    
    add_resource_path(
        'www', app_sys('app/www')
    )
    
    tags$head(
        favicon(),
        bundle_resources(
            path = app_sys('app/www'),
            app_title = 'questionario.golem'
        )
        # Add here other external resources
        # for example, you can add shinyalert::useShinyalert() 
    )
}

