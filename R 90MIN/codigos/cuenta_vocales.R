# Un string de prueba (3 vocales)
string = "Indie"

# Separando el string en un vector
letras <- strsplit(string, split = "")[[1]]
letras <- tolower(letras)

# Definimos las vocales
vocales <- c("a","e","i","o","u")

# Realizamos el conteo
sum(letras %in% vocales)

# Definicion de la funcion
cuenta_vocales <- function(string){
  
  # Separando el string en un vector
  letras <- strsplit(string, split = "")[[1]]
  letras <- tolower(letras)
  
  # Definimos las vocales
  vocales <- c("a","e","i","o","u")
  
  # Realizamos el conteo
  sum(letras %in% vocales)
  
}


# Aplicando la funcion
cuenta_vocales("Machine Learning")
cuenta_vocales("PROGRAMACION EN R")
cuenta_vocales("que le pasa a lupita")
 