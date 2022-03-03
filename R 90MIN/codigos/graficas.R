#---------------------------------------------
#                Graficas                    -
#---------------------------------------------

# Carga de datos
videogames <- read.csv("~/Documents/INDIE/CURSOS/Youtube R Basico/Datos/all_games.csv")
videogames$platform <- trimws(videogames$platform)
videogames$user_review <- as.numeric(videogames$user_review)*10
str(videogames,strict.width = "cut")

#----- Histograma 

hist(videogames$meta_score,
     breaks = 40,
     col = "blue",
     xlab = "Meta score",
     main = "Histograma del metascore")

#----- Scatterplot

n64 <- videogames[videogames$platform == "Nintendo 64",]

plot(n64$meta_score,
     n64$user_review,
     col = "steelblue",
     pch = 19,
     lwd = 5,
     xlab = "MetaScore",
     ylab = "User review",
     main = "Comparación Metascore y User review para N64",
     frame = FALSE)

#----- Boxplot

# Un boxplot basico
boxplot(videogames$meta_score)

# Boxplot por plataforma
boxplot(meta_score ~ platform,
        data = videogames,
        col = "purple",
        subset = platform %in% c("PSP","Nintendo 64","PC",
                                 "Switch","PlayStation 4"),
        xlab = "",
        ylab = "Metascore",
        frame = FALSE)

#----- Grafico de linea

View(head(videogames))

# Calculando release_year
num_char <- nchar(videogames$release_date)
videogames$release_year <- as.numeric(substr(videogames$release_date,
       num_char - 3,num_char))

# meta_score promedio por release_year
year_meta <- aggregate(videogames$meta_score,
          list(videogames$release_year),
          FUN = mean,
          na.rm = TRUE)

# Grafica
plot(year_meta$Group.1,
     year_meta$x,
     type = "b",
     pch = 18,
     lty = 1,
     col = "red",
     lwd = 3,
     xlab = "Año de lanzamiento",
     ylab = "Promedio",
     ylim = c(65,90))

# meta_score promedio por release_year
year_user <- aggregate(videogames$user_review,
                       list(videogames$release_year),
                       FUN =  mean,
                       na.rm = TRUE)

# Agregar siguiente grafica
lines(year_user$Group.1,
      year_user$x,
      type = "b",
      pch = 19,
      lty = 2,
      col = "blue",
      lwd = 3)

# Leyenda
legend("topright",
       legend = c("Metascore","User review"),
       col = c("red","blue"),
       lty = 1:2,pch = 18:19)

















