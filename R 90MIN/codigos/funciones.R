#---------------------------------------------
#                  Funciones                 -
#---------------------------------------------

#----- Funcion que eleve un numero al cuadrado
cuadrado <- function(num){
  return(num**2)
}

cuadrado(10)
cuadrado(-2)

#----- Funcion que eleve un numero a un exponente
exponente <- function(num,k = 2){
  return(num**k)
}

exponente(2,4)
exponente(num = 3,k = 2)
exponente(k = 2,num = 3)
exponente(2,3)
exponente(num = 10, k = 3)

#----- Funcion que convierta de celcius a fahrenheit
celcius_a_farenheit <- function(temp){
  farenheit <- temp*9/5 + 32
  return(farenheit)
}

celcius_a_farenheit(temp = 25)
celcius_a_farenheit(temp = 10)

#----- Funcion que trunque un numero a k decimales
truncar <- function(num,k){
  res <- as.integer(num*10**k)/10**k
  return(res)
}

truncar(10.773,1)
truncar(-5.647,2)

#----- Manejo de un semaforo
actualiza_semaforo <- function(actual){
  
  if(actual == "verde"){
    siguiente <- "amarillo"
  }else if(actual == "amarillo"){
    siguiente <- "rojo"
  }else if(actual == "rojo"){
    siguiente <- "verde"
  }else{
    stop("Color no valido")
  }
  
  return(siguiente)
  
}

actualiza_semaforo(actual = "verde")
actualiza_semaforo(actual = "amarillo")
actualiza_semaforo(actual = "rojo")
actualiza_semaforo(actual = "morado")

#----- Funcion que verifique la validez de un usuario
usuario_valido <- function(nombre){
  
  val_longitud <- nchar(nombre) < 10
  val_riot <- !grepl("RIOT",nombre)
  val_ocupados <- !nombre %in% c("ElVaipa","Ixtli")
  
  validacion <- val_longitud & val_riot & val_ocupados
  return(validacion)
  
}

usuario_valido(nombre = "Mictlantecuhtli3")
usuario_valido(nombre = "ElJOJO")
usuario_valido(nombre = "Venedith")
usuario_valido(nombre = "RIOT Falcon")
usuario_valido(nombre = "ElVaipa")

#----- Validaciones sobre el input de una funcion

celcius_a_farenheit <- function(temp){
  
  stopifnot(is.numeric(temp))
  farenheit <- temp*9/5 + 32
  return(farenheit)
}

celcius_a_farenheit(4)
celcius_a_farenheit("4")


























































































