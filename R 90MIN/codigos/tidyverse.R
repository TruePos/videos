#---------------------------------------------
#                Tidyverse                   -
#---------------------------------------------

# Instalacion
install.packages("tidyverse")

# Carga de la libreria
library(tidyverse)

# Carga de datos
videogames <- read.csv("~/Documents/INDIE/CURSOS/Youtube R Basico/Datos/all_games.csv")
videogames$platform <- trimws(videogames$platform)
videogames$user_review <- as.numeric(videogames$user_review)*10
str(videogames,strict.width = "cut")

#---------- PIPE ( %>% )

# Cuantos juegos hay de GameCube?
nrow(filter(videogames, platform == "GameCube"))

# Cuantos juegos hay de GameCube? (Usando %>%)
videogames %>% 
  filter(platform == "GameCube") %>% 
  nrow()

# Cuantos juegos tienen meta_score entre 70 y 80
videogames %>% 
  filter(meta_score >= 70 & meta_score <= 80) %>% 
  nrow()

# Cuantas palabras tiene un string?
string <- "Devil May Cry"

length(unlist(strsplit(string, " ")))

string %>% 
  strsplit(" ") %>% 
  unlist() %>% 
  length()

#----- TIBBLE

# Un mejor dataframe (tibble)
series <- tibble(
  nombre = c("Arcane","Mad Men","The Office","Invincible",
             "Seinfeld"),
  imdb = c(9.4, 8.6, 8.9, 8.7, 8.8),
  episodios = c(10,92,188,13,173),
  concluida = c(FALSE,TRUE,TRUE,FALSE,TRUE)
)

# Convertir un dataframe a tibble
videogames <- as_tibble(videogames)

# Definirlo fila por fila
tribble(
  ~nombre,~imdb,~episodios,~concluida,
  "Arcane",9.4,10,FALSE,
  "Mad Men",8.6,92,TRUE,
  "The Office",8.9,188,TRUE
)

# Leer un archivo csv a tibble (readr)
videogames <- read_csv("~/Documents/INDIE/CURSOS/Youtube R Basico/Datos/all_games.csv")

#----- DPLYR

#----- Operaciones basicas

# filter
zelda_filter <- videogames %>% 
  filter(str_detect(name,"Zelda"))

# select
zelda_select <- zelda_filter %>% 
  select(name,platform,meta_score,release_date)

# mutate
zelda_mutate <- zelda_select %>% 
  mutate(new_var = case_when(
    meta_score >= 90 ~ "excelente",
    meta_score >= 80 ~ "bueno",
    TRUE ~ "regular"
  ),
  release_year = as.numeric(str_sub(release_date,
                         str_length(release_date) - 3,
                         str_length(release_date)))
  )

# arrange
zelda_arrange <- zelda_mutate %>% 
  arrange(desc(release_year))

# group_by y summarise
zelda_mutate %>% 
  group_by(platform) %>% 
  summarise(meta_score = mean(meta_score),
            ultimo_juego = max(release_year)) %>% 
  arrange(desc(meta_score))

# Contar
zelda_filter %>% 
  count(platform) %>% 
  arrange(desc(n))

#----- Otras maneras de extraer filas

# Extraer filas por posicion
zelda_filter %>% 
  slice(c(1,3))
zelda_filter %>% 
  slice_head(n = 10)
zelda_filter %>% 
  slice_tail(n = 3)

# Extraer filas con el mayor valor
zelda_filter %>% 
  slice_max(meta_score)

# Extraer filas con el menor valor
zelda_filter %>% 
  slice_min(meta_score)

# Extraer filas al azar
zelda_filter %>% 
  slice_sample(n = 2)

# Extraer un juego al azar de cada plataforma
zelda_filter %>% 
  group_by(platform) %>% 
  slice_sample(n = 1) %>% 
  ungroup()

# Extraer el mejor juego de zelda de cada plataforma
zelda_filter %>% 
  group_by(platform) %>% 
  slice_max(meta_score) %>% 
  ungroup() %>% 
  select(!summary) %>% 
  View()

#----- Otra manera de extraer columnas

# Obtenerlas en formato tibble
zelda_filter %>% 
  select(meta_score)

# Extraerlas como vector
zelda_filter %>% 
  pull(meta_score)

# Obtener todas las columnas que contengan cierto patron
zelda_filter %>% 
  select(contains("score") | contains("me"))

# Renombrando columnas
zelda_filter %>% 
  rename(nombre = name,
         plataforma = platform)

#----- Combinar tablas

# Unir dos tablas verticalmente
tibble1 <- zelda_filter %>% 
  select(name,meta_score) %>% 
  slice_sample(n = 1)

tibble2 <- zelda_filter %>% 
  select(name,meta_score) %>% 
  slice_sample(n = 1)

unidas <- bind_rows(tibble1,tibble2)

# Unir dos tablas horizontalmente
user_review <- tibble(user_review = c(7,9))

unidas_col <- bind_cols(unidas, user_review)

#---------- GGPLOT2

# Carga de datos
videogames <- videogames %>% 
  mutate(user_review = as.numeric(user_review),
         release_year = as.numeric(str_sub(release_date,
                                           str_length(release_date) - 3,
                                           str_length(release_date))))

#----- Histograma

videogames %>% 
  ggplot(aes(x = meta_score)) + 
  geom_histogram(bins = 30, fill = "steelblue") + 
  labs(x = "Meta score", title = "Histograma del metascore") + 
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5))

#----- Scatterplot

videogames %>% 
  filter(platform == "Nintendo 64") %>% 
  ggplot(aes(x = meta_score, y = user_review)) + 
  geom_point(size = 5, color = "red",alpha = 0.8) + 
  labs(x = "MetaScore", y = "User review",
       title = "Comparación Metascore y user review para N64") + 
  theme_bw() + 
  theme(plot.title = element_text(hjust = 0.5))

#----- Boxplot

boxplot <- videogames %>% 
  filter(platform %in% c("PSP","Nintendo 64","PC","Switch",
                         "PlayStation 4")) %>% 
  ggplot(aes(x = reorder(platform,meta_score,median), y = meta_score)) + 
  geom_boxplot(fill = "purple") + 
  labs(x = "",y = "Metascore",
       title = "Distribución del metascore por plataforma") + 
  theme_minimal() + 
  theme(plot.title = element_text(hjust = 0.5))

#----- Grafico de linea

linegraph <- videogames %>% 
  group_by(release_year) %>% 
  summarise(score = mean(meta_score)) %>% 
  mutate(tipo = "meta") %>% 
  bind_rows(
    
    videogames %>% 
      group_by(release_year) %>% 
      summarise(score = mean(user_review*10,na.rm = TRUE)) %>% 
      mutate(tipo = "user")
    
  ) %>% 
  ggplot(aes(x = release_year, y = score, color = tipo)) + 
  geom_point(size = 2) + 
  geom_line(size = 1) + 
  labs("Año de lanzamiento") + 
  theme_minimal()

#----- Agregando interactividad

linegraph <- plotly::ggplotly(linegraph)

boxplot <- plotly::ggplotly(boxplot)











































