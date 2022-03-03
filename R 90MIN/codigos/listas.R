#---------------------------------------------
#                  Listas                    -
#---------------------------------------------

# Que resuelve una lista
c(3.1416,TRUE,"God of war")
lista <- list(3.1416,TRUE,"God of war")

# Asignando nombre a las entradas
lista_nombrada <- list(numero = 3.1416,
                       logico = TRUE,
                       caracter = "God of war")

# Obteniendo entradas de una lista
lista[1]
lista[c(1,2)]
lista[[1]]*2
lista_nombrada$numero*2

#----- Agregando entradas a una lista

# Usando $
lista_nombrada$vector <- c(1,2,3)

# Por posicion
lista[[4]] <- c(1,2,3)

#----- Ejercicio

is_prime <- function(n){
  
  if(n == 2){
    return(TRUE)
  }
  
  all( n %% 2:sqrt(n) != 0  )
  
}

is_prime <- Vectorize(is_prime)

goldbach_rep <- function(par){
  primera_mitad <- 1:(par/2)
  segunda_mitad <- (par - 1):(par/2)
  indice_primos <- which(is_prime(primera_mitad) & is_prime(segunda_mitad))
  representaciones <- list()
  for(i in 1:length(indice_primos)){
    p1 <- primera_mitad[indice_primos[i]]
    p2 <- segunda_mitad[indice_primos[i]]
    primos <- c(p1,p2)
    representaciones[[i]] <- primos
  }
  
    
  return(representaciones)
}

goldbach_rep(par = 40)
















































