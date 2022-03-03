#---------------------------------------------
#                Numeros primos              -
#---------------------------------------------

# Algunas pruebas
n <- 2
2:(n-1)
all(n %% 2:(n-1) != 0)
all(n %% 2:sqrt(n) != 0)

# Funcion
is_prime <- function(n){
  
  if(n == 2){
    return(TRUE)
  }
  
  all( n %% 2:sqrt(n) != 0  )
  
}

# Aplicacion
is_prime(n = 3)
is_prime(n = 21)
is_prime(n = 29)
is_prime(n = 982451653)

# Contando el numero de primos entre 1 y 1,000,000
is_prime(c(2,3,4))
is_prime <- Vectorize(is_prime)
is_prime(c(2,3,4))

sum(is_prime(1:1000000))











































