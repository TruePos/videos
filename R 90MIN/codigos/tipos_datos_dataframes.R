#---------------------------------------------
#                Dataframes                  -
#---------------------------------------------

#----- Como definir un dataframe
series <- data.frame(
  nombre = c("Arcane","Mad Men","The Office","Invincible",
             "Seinfeld"),
  imdb = c(9.4, 8.6, 8.9, 8.7, 8.8),
  episodios = c(10,92,188,13,173),
  concluida = c(FALSE,TRUE,TRUE,FALSE,TRUE)
)

# Exportacion a csv
write.csv(series, 
          file = "~/Documents/INDIE/CURSOS/Youtube R Basico/Datos/series.csv",
          row.names = FALSE)

#----- Cargar un dataframe desde un archivo csv

# Eliminamos el dataframe series
rm(series)

# Leemos el archivo CSV
series <- read.csv("~/Documents/INDIE/CURSOS/Youtube R Basico/Datos/series.csv")

#----- Operaciones basicas

# Caracteristicas del dataframe
View(series)
nrow(series)
ncol(series)
str(series)
summary(series)

# Agregar nueva informacion (fila)
band_of_brothers <- data.frame(nombre = "Band of Brothers",
                               imdb = 9.4,
                               episodios = 10,
                               concluida = TRUE)

series <- rbind(series,band_of_brothers)

# Agregar nueva informacion (columna)
series$metascore <- c(8.7,8.6,6.6,NA,8.4,8.7)
series$promedio <- (series$imdb + series$metascore)/2

#----- Extrayendo informacion

# Extraer por nombre o posicion
series$nombre
series[1,]
series[1,1:2]
series[1,c("nombre","imdb","metascore")]
series[1:3, c("nombre","imdb","metascore")]
series[c(1,3,5), c("nombre","imdb","metascore")]

# Extraer filas por condicion
series[ c(TRUE,FALSE,FALSE,FALSE,FALSE,TRUE) ,]
series[series$imdb >= 9,]
series[ series$episodios < 50 , ]
series[ !series$concluida ,]

#----- Explorando informacion

videogames <- read.csv("~/Documents/INDIE/CURSOS/Youtube R Basico/Datos/all_games.csv")
nrow(videogames)
ncol(videogames)

# Un vistazo a los datos
View(head(videogames,10))
str(videogames, strict.width = "cut")

# Valores faltantes?
colSums(is.na(videogames))

# Cual es el juego con menor meta_score?
which.min(videogames$meta_score)
View(videogames[18799, ])

# Cual es el juego con mayor meta_score?
which.max(videogames$meta_score)
View(videogames[1, ])

# Cuantos juegos hay en cada plataforma?
videogames$platform <- trimws(videogames$platform)
sort(table(videogames$platform), decreasing = TRUE)

# Cuantos juegos de PC tienen meta_score mayor a 80
nrow(videogames[videogames$platform == "PC" &
             videogames$meta_score > 80,])

#----- Ejercicio

# Pregunta 1
nrow(videogames[ videogames$platform %in% c("GameCube","PSP") ,])

# Pregunta 2
nrow(videogames[ videogames$platform == "Switch" &
              videogames$meta_score <= 70 & 
              videogames$meta_score >= 50,])


#----- Para graficas eliminar

#----- Histograma
hist(videogames$meta_score,
     xlab = "Meta score",
     breaks = 40,
     main = "Histograma del metascore",
     col = "blue")

#----- Scatterplot

#Corrigiendo la columna user_review  
str(videogames,strict.width = "cut")
table(videogames$user_review)
videogames$user_review <- as.numeric(videogames$user_review)
colSums(is.na(videogames))

plot()

#----- Grafico de linea

# Calculando release_year
num_char <- nchar(videogames$release_date)
release_year <- as.numeric(substr(videogames$release_date,num_char - 3,num_char))
videogames$release_year <- release_year
str(videogames,strict.width = "cut")

# Promedio por release_year
videogames_group <- aggregate(videogames$meta_score,
          list(videogames$release_year),
          FUN = mean)

# Grafico
plot(videogames_group$Group.1,
     videogames_group$x,
     type = "l",
     col = "red",
     lwd = 3,
     xlab = "Release Year",
     ylab = "Average MetaScore",
     main = "Promedio de MetaScore por año")


#----- Top 10 videojuegos

# Calculando el meta_score promedio por videojuego
games_group <- aggregate(videogames$meta_score,
                         list(videogames$name),
                         FUN = mean)
games_group <- head(games_group[order(games_group$x,decreasing = TRUE),],
                    5)

barplot(height = games_group$x,
        names = games_group$Group.1,
        horiz = TRUE)































