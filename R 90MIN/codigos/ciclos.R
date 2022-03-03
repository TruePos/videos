#---------------------------------------------
#                  Ciclos                    -
#---------------------------------------------

#----- Ciclo for
for(i in 1:10){
  texto <- paste0("Iteracion: ",i)
  print(texto)
}

for(i in letters){
  print(i)
}

#----- Ciclo while
numero <- 5
while(numero <= 10){
  print("Aqui seguimos")
  numero <- numero + 1
}

#----- Factorial

# Un ejemplo
n <- 6
fact <- 1
multiplo <- 1

# Iteracion 1
fact <- fact*multiplo
multiplo <- multiplo + 1
multiplo <= n

# Iteracion 2
fact <- fact*multiplo
multiplo <- multiplo + 1
multiplo <= n

# Iteracion 3
fact <- fact*multiplo
multiplo <- multiplo + 1
multiplo <= n

# Iteracion 4
fact <- fact*multiplo
multiplo <- multiplo + 1
multiplo <= n

# Iteracion 5
fact <- fact*multiplo
multiplo <- multiplo + 1
multiplo <= n

# Iteracion 6
fact <- fact*multiplo
multiplo <- multiplo + 1
multiplo <= n

# Funcion
calcula_factorial <- function(n){
  fact <- 1
  multiplo <- 1
  while(multiplo <= n){
    fact <- fact*multiplo
    multiplo <- multiplo + 1
  }
  return(fact)
}

# Aplicacion
calcula_factorial(n = 10)

#----- Raiz digital

# Primera iteracion
n <- 29
n <- sum(as.numeric(strsplit(as.character(n),split = "")[[1]]))
n > 9

# Segunda iteracion
n <- sum(as.numeric(strsplit(as.character(n),split = "")[[1]]))
n > 9

# Funcion
digital_root <- function(n){
  while(n > 9){
    n <- sum(as.numeric(strsplit(as.character(n),split = "")[[1]]))
  }
  return(n)
}

# Aplicacion
digital_root(n = 87)
digital_root(n = 16)
digital_root(n = 942)
digital_root(n = 132189)

#----- Profundidad

#----- Un ejemplo

int <- 546
numeros <- c()

# Multiplicando por 1
actual <- int*1
numeros_multiplo <- strsplit(as.character(actual),"")[[1]]
numeros <- union(numeros,numeros_multiplo)
length(numeros)

# Multiplicando por 2
actual <- int*2
numeros_multiplo <- strsplit(as.character(actual),"")[[1]]
numeros <- union(numeros,numeros_multiplo)
length(numeros)

# Multiplicando por 3
actual <- int*3
numeros_multiplo <- strsplit(as.character(actual),"")[[1]]
numeros <- union(numeros,numeros_multiplo)
length(numeros)

# Multiplicando por 4
actual <- int*4
numeros_multiplo <- strsplit(as.character(actual),"")[[1]]
numeros <- union(numeros,numeros_multiplo)
length(numeros)

# Multiplicando por 5
actual <- int*5
numeros_multiplo <- strsplit(as.character(actual),"")[[1]]
numeros <- union(numeros,numeros_multiplo)
length(numeros)

#----- Funcion

integer_depth <- function(int){
  
  numeros <- c()
  multiplo <- 0
  while(length(numeros) < 10){
    multiplo <- multiplo + 1
    actual <- int*multiplo
    numeros_multiplo <- strsplit(as.character(actual),split = "")[[1]]
    numeros <- union(numeros,numeros_multiplo)    
  }
  
  return(multiplo)
  
}

# Aplicacion
integer_depth(int = 10)
integer_depth(int = 42)
integer_depth(int = 1)
integer_depth(int = 29)













































