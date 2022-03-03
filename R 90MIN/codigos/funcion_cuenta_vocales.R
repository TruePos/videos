#---------------------------------------------
#               Cuenta Vocales               -
#---------------------------------------------

# Un string de prueba
string <- "Indie"

# Separando el string en un vector
letras <- strsplit(string,split = "")[[1]]
letras <- tolower(letras)

# Vocales
vocales <- c("a","e","i","o","u")

# Realizamos el conteo
sum(letras %in% vocales)

# Funcion
cuenta_vocales <- function(string){
  
  # Separando el string en un vector
  letras <- strsplit(string,split = "")[[1]]
  letras <- tolower(letras)
  
  # Vocales
  vocales <- c("a","e","i","o","u")
  
  # Realizamos el conteo
  sum(letras %in% vocales)  
  
}

# Aplicacion
cuenta_vocales("Machine Learning")
cuenta_vocales("PROGRAMACION")
cuenta_vocales("que le pasa a lupita")



















































