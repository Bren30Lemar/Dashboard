library(shiny)
library(shinydashboard)
library(readr)
library(tidyr)
library(DT)


Cambio <- read_csv("Divisas_pandemia.csv")

ui<-dashboardPage(title= "Ejemplo", skin= "purple",
                  dashboardHeader(title="PROYECTO",
                                  dropdownMenu(type="messages",
                                               messageItem(from = "Brenda",
                                                           "Hola")
                                  ),
                                  dropdownMenu(type="notifications",
                                               notificationItem(text="No te olvides de seguir")
                                               
                                  ),
                                  dropdownMenu(type="tasks",
                                               taskItem(value=50,
                                                        text="Avance",
                                                        color="red")
                                  )
                                  
                  ),
                  dashboardSidebar(
                      sidebarSearchForm("searchText","buttonSearch","Buscar")
                      ,
                      sidebarMenu(id="sidebarID",
                                  menuItem("Portada"), # Texto
                                  menuItem("Usuarios", tabName = "datos", icon = icon("Users")),# Tabla
                                  menuItem("Nodos", tabName = "datos1"), # Tabla
                                  menuItem("Reglamento"), # Texto
                                  menuItem("Problemas", tabName = "datos2"), # Tabla
                                  menuItem("Contacto", tabName = "imag"), # Imagen
                                  menuItem("Agradecimientos") # Texto
                                  
                                  
                      )
                      
                      
                  ),
                  dashboardBody(
                      
                      tabItems(tabItem(tabName = "datos", 
                                       DT::dataTableOutput("datos")
                                       
                                       
                      ),
                      tabItem(tabItem(tabName = "datos1",
                                      DT::dataTableOutput("datos1"))
                      ),
                      
                      tabItem(tabItem(tabName = "datos2",
                                      DT::dataTableOutput("datos2"))
                      ), 
                      tabItem(tabName="imag", 
                              box(title="Contaco", tags$image(type = "image/png",src = "Diseño sin título.png",
                                                              controls = "controls", height="400px", width="600px"), 
                                  width=12, status="primary", solidHeader=T))
                      
                      )
                  ))
server <- function(input, output) { 
    output$datos <- DT::renderDataTable(Cambio)
    output$datos1 <- DT::renderDataTable(Cambio)
    output$datos2 <- DT::renderDataTable(Cambio)
    output$imag <- renderImage({
        return(list(src = "www/Diseño sin título.png", contentType = "image/png"))
    })
    
}


shinyApp(ui, server)
