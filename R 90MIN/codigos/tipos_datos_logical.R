#---------------------------------------------
#                  Logical                   -
#---------------------------------------------

# Los posibles valores logicos
TRUE
FALSE

# Nuestra calificacion en el primer examen
calificacion_examen1 <- 8.5

# Obtuvimos 10?
calificacion_examen1 == 10

# Aprobamos?
calificacion_examen1 >= 6

# Obtuvimos calificacion > 6 Y < 8?
calificacion_examen1 > 6 & calificacion_examen1 < 8

# Realizamos un segundo examen
calificacion_examen2 <- 5.9

# Tenemos algun examen reprobado?
calificacion_examen1 < 6 | calificacion_examen2 < 6

# Validar la no igualdad
calificacion_examen1 != calificacion_examen2

# Nombre de usuario en League of Legends
usuario <- "xXNoobKillerXx"

# Validar igualdad
usuario == "Faker"

# Validar el numero de caracteres
val_numchar <-  nchar(usuario) > 10

# Validar que no contenga una palabra en particular
val_noob <- !grepl("Noob",usuario)

# Validar que no comience con .
val_punto <-  substr(usuario,1,1) != "."
val_punto

# Validar que cumpla con las tres condiciones anteriores
val_numchar & val_noob & val_punto

# Sumando valores logicos
TRUE == 1
FALSE == 0
TRUE + TRUE + FALSE + FALSE + TRUE

#----- Ejercicio

usuario <- "RIOT Mictlan"

nchar(usuario) < 10 & !grepl("RIOT",usuario) & 
  usuario != "ElVaipa" & usuario != "Ixtli"


# Comentarios mios proyecto kueski

#- El filtro relevance > 0.9 no se eligio mediante
#- algun criterio bien definido. Se puede explorar
#- el punto de corte de este filtro. Esto afectaria
#- algunas variables calculadas.

#- Informacion externa: link.csv tiene informacion
#- para ligar con bases de IMDB.

#- 


































