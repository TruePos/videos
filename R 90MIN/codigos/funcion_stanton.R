#---------------------------------------------
#             Medida de Stanton              -
#---------------------------------------------

# Algunas pruebas
set.seed(1341)
muestra <- sample(1:7, size = 20, replace = TRUE)

# Numero de 1s
n <- sum(muestra == 1)

# Stanton
sum(muestra == n)

# Funcion
stanton_measure <- function(muestra){
  n <- sum(muestra == 1)
  sum(muestra == n)
}

# Aplicacion
stanton_measure(c(2,3,1,4,1))
stanton_measure(c(1,1,1,2))
stanton_measure(c(1,4,1,3,1,2,1,8,4,4))






































