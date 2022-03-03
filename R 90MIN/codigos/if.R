#---------------------------------------------
#                  Funciones                 -
#---------------------------------------------

# Un primer condicional
condicion <- FALSE
if(condicion){
  print("Esto se imprimira si condicion es TRUE")
}else{
  print("Esto se imprimira si condicion es FALSE")
}

# Calculando el rango de un ajedrecista
elo <- 30
if(elo >= 750){
  rango <- "Gran Maestro"
}else if(elo >= 500){
  rango <- "Maestro"
}else if(elo >= 250){
  rango <- "Profesional"
}else{
  rango <- "Novato"
}


# IF ELSE
numeros <- 1:10
ifelse(numeros %% 2 == 0,"par","impar")














































