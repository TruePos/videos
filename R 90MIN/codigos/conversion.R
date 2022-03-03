#---------------------------------------------
#                 Conversion                 -
#---------------------------------------------

#----- De numerico a caracter o logico

# De numerico a caracter
as.character(5.6)
as.character(-5.46)

# De numerico a logico
as.logical(0)

#----- De logico a caracter o numerico

# De logico a caracter
as.character(TRUE)
as.character(FALSE)

# De logico a numerico
as.numeric(TRUE)
as.numeric(FALSE)

#----- De caracter a logico o numerico

# De caracter a numerico
as.numeric("244")
as.numeric("matematicas")

# De caracter a logico
as.logical("TRUE")
as.logical("matematicas")

#----- En un vector

vec <- c("1","2","3","4","5")
as.numeric(vec)























