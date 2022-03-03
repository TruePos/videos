#---------------------------------------------
#                  String                   -
#---------------------------------------------

usuario <- "OkabeRintarou"


# Cuantos caracteres tiene el nombre de usuario
nchar_usuario <-  nchar(usuario)

# Convertir a mayusculas o minusculas todo el string
tolower(usuario)
toupper(usuario)

# Obtener un pedazo (substring) del string
substr(usuario, 1,5)
substr(usuario,6,nchar_usuario)

# Sustituir valores del string
sub("a","A",usuario)
gsub("a","A",usuario)
sub("Okabe","Hououin",usuario)

# Pegar (Concatenar) dos o mas strings
paste("Mi nombre de usuario de League of Legends es:",
      usuario,
      sep = " ")

#----- Ejercicio

madmen <- "Don Draper lucha por mantenerse en la cima del grupo Sterling-Cooper"

madmen_mod <-  sub("Don Draper","Richard Whitman", madmen)

paste("En la serie Madmen:",
      madmen_mod,
      sep = " ")


calificacion <- 7.5

calificacion == 9

calificacion > 7 & calificacion < 8

calificacion_parcial1 <- 8.5
calificacion_parcial2 <- 5.7

calificacion_parcial1 < 6 | calificacion_parcial2 < 6

usuario <- "xXNoobKillerXx"

grepl("Noob", usuario)









































