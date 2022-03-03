#---------------------------------------------
#                  Goldbach                  -
#---------------------------------------------

# Funcion is_prime
is_prime <- function(n){
  if(n == 2){
    return(TRUE)
  }
  all( n %% 2:sqrt(n) != 0  )
}

is_prime <- Vectorize(is_prime)

# Un ejemplo
par <- 32
primera_mitad <- 1:(par/2)
segunda_mitad <- (par - 1):(par/2)
indice_primos <- which(is_prime(primera_mitad) & is_prime(segunda_mitad))

# Se selecciona uno al azar
indice_primos <- sample(indice_primos, size = 1)

# Haciendo el vector
p1 <- primera_mitad[indice_primos]
p2 <- segunda_mitad[indice_primos]
c(p1,p2)

# Funcion
goldbach_rep <- function(par){
  primera_mitad <- 1:(par/2)
  segunda_mitad <- (par - 1):(par/2)
  indice_primos <- which(is_prime(primera_mitad) & is_prime(segunda_mitad))
  
  if(length(indice_primos) > 1){
    indice_primos <- sample(indice_primos,size = 1)
    p1 <- primera_mitad[indice_primos]
    p2 <- segunda_mitad[indice_primos]
  }else{
    p1 <- primera_mitad[indice_primos]
    p2 <- segunda_mitad[indice_primos]
  }
    
  return(c(p1,p2))
}

# Aplicacion
goldbach_rep(par = 4)
goldbach_rep(par = 10)
goldbach_rep(par = 32)
goldbach_rep(par = 1262)
goldbach_rep(par = 10**5)





























