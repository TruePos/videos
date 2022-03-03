#---------------------------------------------
#                  Carro                     -
#---------------------------------------------

# Funcion
costo_renta_carro <- function(dias){
  
  if(dias >= 7){
    costo <- 40*dias - 50
  }else if(dias >= 3){
    costo <- 40*dias - 20
  }else{
    costo <- 40*dias
  }
  
  return(costo)
}


# Aplicacion
costo_renta_carro(dias = 10)
costo_renta_carro(dias = 8)
costo_renta_carro(dias = 5)


























