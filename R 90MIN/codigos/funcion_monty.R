#---------------------------------------------
#                  Carro                     -
#---------------------------------------------

#----- Un ejemplo

# Configuracion inicial
set.seed(123)
puertas <- 1:3
carro <- sample(puertas, size = 1)
puerta.inicial <- sample(puertas, size = 1)

# Si no cambia de puerta
carro == puerta.inicial

# Si cambia de puerta
puertas.posibles <- setdiff(puertas, c(puerta.inicial,carro))
puerta.abierta <- sample(puertas.posibles, size = 1)
puerta.elegida <- setdiff(puertas, c(puerta.inicial, puerta.abierta))
carro == puerta.elegida

#----- Funcion

monty_hall <- function(cambia_puerta){
  
  # Se define la configuracion inicial
  puertas <- 1:3
  carro <- sample(puertas, size = 1)
  puerta.inicial <- sample(puertas, size = 1)
  
  # Si no cambia de puerta
  if(!cambia_puerta){
    return(carro == puerta.inicial)
  }
  
  # Puerta que abrira el presentador
  if(carro == puerta.inicial){
    puertas.posibles <- setdiff(puertas, puerta.inicial)
    puerta.abierta <- sample(puertas.posibles, size = 1)
  }else{
    puerta.abierta <- setdiff(puertas,c(carro,puerta.inicial))
  }

  # Hace el cambio de puerta
  puerta.elegida <- setdiff(puertas,
                            c(puerta.inicial,puerta.abierta))
  return(carro == puerta.elegida)
}

# Aplicacion
monty_hall(cambia_puerta = TRUE)
monty_hall(cambia_puerta = FALSE)

# Que conviene realizar?
cambiando <- replicate(10000,monty_hall(cambia_puerta = TRUE))
no_cambiando <- replicate(10000,monty_hall(cambia_puerta = FALSE))
sum(cambiando)/10000
sum(no_cambiando)/10000














































