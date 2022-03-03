#---------------------------------------------
#                  Punto                     -
#---------------------------------------------

# Funcion
mueve_punto <- function(inicial){
  
  # Se tiran los dados
  dado1 <- sample(1:6, size = 1)
  dado2 <- sample(1:6, size = 1)
  
  # Posicion final
  final <- inicial + 2*dado1 - dado2
  
  paste0("Posicion inicial: ",inicial,", Posicion final: ",
         final)
  
}


# Aplicacion
mueve_punto(inicial = 10)
mueve_punto(inicial = 5)
mueve_punto(inicial = 1)































