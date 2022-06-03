# Dashboard
## Este código muestra un Shiny Dashboard creado en RStudio
### Es una prueba que se irá modificando poco a poco para crear una plataforma que pueda ser de comunicación entre un grupo de personas.

Observemos las librerías que se utilizaron para crear este dashboard.
shiny
shinydashboard
readr
tidyr
DT
Son librerías útiles para la creación de este.

En la primera parte vamos a observar que se agregó un documento con extensión ".csv" crado en Excel que contiene una tabla con información sobre el tipo de cambio durante la pandemia. Esta tabla solo nos sirvió para encontrar la forma de como insertar una tabla en un shiny Dashboard.

En el ui del dashboard tenemos:
El título del dashboard, el color y las herramientas de notificación, mensajes y avances de lo que se generará o genera dentro.

En el dashboardSidebar vamos a encontrar la ventana de Menú con diferentes pestañas donde el objetivo es agregar en Portada, Reglamento y Agradecimientos un archivo tipo texto. En Usuarios, Nodos y Problemas se ocupará un archivo tipo ".csv" para ingeresar tablas y con los atributos correspondientes a cada columna para dar un resultado visual.
Por último tenemos la pestaña Contacto que llevará un archivo ".png"

Para que lo anterior se vea correctamente, necesitamos indicarle que queremos que se vea y eso se coloca en el dashboardBody.
Colocamos las tablas, en este caso se ocupó la misma y aquí ocupamos la librería DT para indicarle que se ocupará un formato de tabla
Y para poner la imagen indicando medidas y formatos correctos.

Por último, en el SERVER
finalmente para que se vea correctamente ocupamos la salida del nombre de la tabla de datos que se ocuparán. 

Y listo, tenemos el shiny dashboard modificiado. Queda aclarar que se seguirá modificando conforme se vaya obteniendo la información completa de que es lo que se busca obtener en cada pestaña. 

