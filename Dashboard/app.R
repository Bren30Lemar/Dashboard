library(shiny)
library(shinydashboard)
library(readr)
library(tidyr)
library(DT)


Cambio <- read_csv("Divisas_pandemia.csv")
por <- read_table("Portada.txt")



ui<-dashboardPage(title = "Ejemplo", skin = "purple",
    dashboardHeader(title = "PROYECTO",
                    dropdownMenu(type = "messages",
                                 messageItem(from = "Brenda",
                                             "Hola")
                                 ),
                    dropdownMenu(type = "notifications", 
                                 notificationItem(text = "Trabajo")),
                    dropdownMenu(type = "tasks",
                                 taskItem(value = 50,
                                          text = "avance",
                                 color = "blue"))
                    ),
    dashboardSidebar(
        sidebarSearchForm("searchText","buttonSearch","Buscar"),
        sidebarMenu(id="sidebarID",
                    menuItem("Portada", tabName = "por"),#Texto
                    menuItem("Usuarios", tabName = "datos",icon = icon("users")),
                    menuItem("Nodos"),
                    menuItem("Reglamento"),
                    menuItem("Problemas"),
                    menuItem("Software", tabName = "datos1"), 
                    menuItem("Paquetes R", tabName = "datos2"),
                    menuItem("Contacto",
                             menuSubItem("contacto", tabName = "imag" )), #  texto
                    menuItem("Agradecimientos") # Texto
                     )
                    ),

    dashboardBody(
        tabItems(tabItem(tabName = "datos",
                         DT::dataTableOutput("datos"))
                 ),
        tabItems(tabItem(tabName = "datos1",
                         DT::dataTableOutput("datos1"))),
        tabItems(tabItem(tabName = "datos2",
                         DT::dataTableOutput("datos2"))),
        tabItem(tabName = "imag",
                box(title = "Contacto", tags$image(type = "image/png", src = "Diseño sin título.png",
                                             controls = "controls", height = "400px", width = "600px"),
                    width = 12,status = "primary", solidHeader = T)),
       tabItem(tabName = "por",
               verbatimTextOutput("por") )
    )
)

server <- function(input, output) { 
    output$datos<- DT::renderDataTable(Cambio)
    output$datos1 <- DT::renderDataTable(Cambio)
    output$datos2 <- DT::renderDataTable(Cambio)
    output$imag <- renderImage({
        return(list(src = "www/Diseño sin título.png", contentType = "image/png"))
            })
    output$por <- renderPrint({
        input$por
    })

}


shinyApp(ui, server)