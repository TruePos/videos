#---------------------------------------------
#                Librerias                   -
#---------------------------------------------

#----- Para manejar strings (stringr)

# Instalando la libreria
install.packages("stringr")

# Cargando la libreria
library(stringr)

# Cuantas comas tiene un string
sum(strsplit("Primero,Segundo,Tercero","")[[1]] == ",")

# Utilizando stringr
str_count(string = "Primero,Segundo,Tercero",
          pattern = ",")

# Otros ejemplos
str_to_title("alejandro diaz")
str_replace_all(string = "Primero,Segundo,Tercero",
                pattern = ",",
                replacement = ".")
str_starts(string = "Primero",
           pattern = "e")
str_detect(string = "Kratos",
           pattern = "[aeiou]")
str_locate(string = "Kratos",
           pattern = "tos")

#----- Para manipular datos (dplyr)

# Instalando la libreria
install.packages("dplyr")

# Cargando la libreria
library(dplyr)

# Carga de datos
videogames <- read.csv("~/Documents/INDIE/CURSOS/Youtube R Basico/Datos/all_games.csv")
videogames$platform <- trimws(videogames$platform)
str(videogames,strict.width = "cut")

# Filtrar un dataframe
nrow(videogames[videogames$platform == "GameCube", ])

# Utilizando dplyr
nrow(filter(videogames, platform == "GameCube"))

#----- Para graficas interactivas (plotly)

# Instalando la libreria
install.packages("plotly")

# Cargando la libreria
library(plotly)

# Preparando los datos
num_char <- nchar(videogames$release_date)
release_year <- as.numeric(substr(videogames$release_date,
                                  num_char - 3,
                                  num_char))
videogames$release_year <- release_year

year_meta <- aggregate(videogames$meta_score,
                              list(videogames$release_year),
                              FUN = mean)

# Grafica
plot_ly(data = year_meta,
        y = ~x,
        x = ~Group.1,
        type = "scatter",
        mode = "lines+markers")
























