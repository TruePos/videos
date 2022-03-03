#---------------------------------------------
#                  Vectores                  -
#---------------------------------------------

#----- Definicion de vectores

# Vector numerico
vistas <- c(8321, 2974, 5792, 4932, 4889, 7433, 6651)

# Vector de caracteres
nombres <- c("Video 1","Video 2","Video 3","Video 4",
             "Video 5","Video 6","Video 7")

#----- Operaciones basicas

# Cuantos videos hay?
length(vistas)

# Cuantas vistas tiene el video mas visto?
max(vistas)

# Cuantas vistas tiene el video menos visto?
min(vistas)

# Cuantas vistas, en promedio, tienen los videos en el canal?
mean(vistas)

# En total, cuantas vistas tiene el canal?
sum(vistas)

# Operaciones aplicadas al vector
vistas + 1000
vistas / 500
log(vistas)
nchar(nombres)

# Subimos un nuevo video al canal
vistas <- c(vistas, 5600)
nombres <- c(nombres, "Video 8")

# Ponerle nombre a las entradas de un vector
names(vistas) <- nombres

# Ordenar un vector numerico
sort(vistas)
?sort
sort(vistas, decreasing = TRUE)

#----- Condiciones logicas sobre vectores

# Que videos tienen mas de 6000 vistas?
vistas > 6000

# Cuantos videos hay con mas de 6000 vistas?
sum(vistas > 6000)

# Algun video tiene mas de 8000 vistas?
any(vistas > 8000)
any(vistas > 10000)

# Todos los videos tienen mas de 2000 vistas?
all(vistas > 2000)
all(vistas > 5000)

# Que videos tienen menos de 5000 vistas?
which(vistas < 5000)

#----- Como obtener un subconjunto de un vector

# Especificando cuales quiero (Enteros positivos)
vistas[c(2,4)]
vistas[3]

# Especificando cuales no quiero (Enteros negativos)
vistas[-4]
vistas[-c(2,4)]

# Especificando cuales quiero (Valores logicos)
vistas[c(FALSE,TRUE,FALSE,TRUE,FALSE,FALSE,FALSE)]
vistas[vistas > 7000]
vistas[ vistas > 4000 & vistas < 5000 ]

# Mediante el nombre de la entrada
vistas[c("Video 2","Video 4")]

# Como modificar una o mas entradas de un vector
vistas[1] <- 500
vistas[c(2,3,4)] <- c(600,700,800)
vistas[vistas > 7000] = 7000

#----- Utilizando los vectores como conjuntos

# Videojuegos de un amigo y yo
yo <- c("GTA V","Mortal Kombat","Zelda","Skyrim")
amigo <- c("Mario Kart","Zelda","Devil May Cry","GTA V")

# Que videojuegos tenemos entre los dos?
c(yo, amigo)
union(yo, amigo)

#  Que videojuegos tenemos en comun?
intersect(yo, amigo)

# Que videojuegos tengo yo que no tenga el?
setdiff(yo, amigo)

# Tenemos los mismos videojuegos?
setequal(yo, amigo)

# Mi amigo tiene el videojuego de Zelda?
"Zelda" %in% amigo

# Mi amigo tiene los videojuegos de Age of Empires o Mario Kart?
c("Age of Empires","Mario Kart") %in% amigo

#----- Otra manera de generar vectores (Determinista)

# Utilizando el operador :
1:50
20:1
-5:5

# Utilizando la funcion seq
seq(from = 0, to = 50, by = 0.5)

# A partir de un caracter
juego <- "Mortal Kombat"
split <- strsplit(juego, "")[[1]]
class(split)

any(split == "o")

#----- Otra manera de generar vectores (Aleatoria)

# Obteniendo muestras
resultados <- c("victoria","derrota")
sample(resultados, size = 10, replace = TRUE, prob = c(0.05, 0.95))

# Distribuciones de probabilidad
runif(n = 20, min = 0, max = 2)
rnorm(n = 20, mean = 15, sd = 2)
rbinom(n = 20, size = 1, p = 0.5)
rbinom(n = 20, size = 5, p = 0.5)

# Fijando la semilla
set.seed(123)
runif(n = 1)

#----- Vectores a partir de diferentes tipos de datos?

ejemplo <- c(3.1415, TRUE, "God of War")

c(vistas, "4332")

#----- Ejercicio 1

# Numeros del 1 al 1,000,000
numeros <- 1:1000000

# Calculo
sum(numeros %% 6 == 0 & numeros %% 8 == 0)

#----- Ejercicio 2

# Definicion del vector
set.seed(123)
compras <- rnorm(n = 10000, mean = 5000, sd = 1000)

# Cuales son los montos de las compras en las entradas 435 y 678
compras[c(435, 678)]

# Cuantas compras fueron mayores a 8000 dolares
sum(compras > 8000)

# Monto maximo y minimo
max(compras)
min(compras)

# Que porcentaje de compras fueron entre 4000 y 6000 dolares
sum(compras >= 4000 & compras <= 6000)/length(compras)
mean(compras >= 4000 & compras <= 6000)

#----- Ejercicio 3

# String
string <- "NoobSlayer9"

# Al menos un numero
any(strsplit(string, split = "")[[1]] %in% 1:9)

# Solamente numeros
all(strsplit(string, split = "")[[1]] %in% 1:9)





