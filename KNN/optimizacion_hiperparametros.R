#---------- Librerias y Datos
library(tidymodels)
library(tidyverse)

# Directorio de trabajo
setwd("~/Documents/Youtube/KNN")

# Carga de datos
baseball <- read_csv("train.csv") %>% 
  select(plate_x,
         plate_z,
         launch_angle,
         launch_speed,
         is_home_run) 

#---------- Analisis exploratorio

baseball %>%
  ggplot(aes(x = launch_angle,
             y  = launch_speed,
             z = is_home_run)) +
  stat_summary_2d(alpha = 0.8, bins = 10) +
  scale_fill_viridis_c(labels = percent,
                       option = "inferno") +
  labs(fill = "% home runs") + 
  theme_minimal()

#---------- Modelacion

# Codificacion
baseball <- baseball %>% 
  mutate(is_home_run = factor(is_home_run,
                              levels = c("1","0")))

# Separacion inicial
set.seed(2352)
baseball_split <- initial_split(baseball,
                                prop = 0.8,
                                strata = is_home_run)
baseball_train <- training(baseball_split)
baseball_test <- testing(baseball_split)

# Cross validation folds
baseball_folds <- vfold_cv(baseball_train,
                            v = 5,
                            strata = is_home_run)

# Definicion del modelo
knn_model <- nearest_neighbor(neighbors = tune(),
                              weight_func = "inv",
                              dist_power = 1) %>% 
  set_engine("kknn") %>% 
  set_mode("classification")

# Preprocesamiento de los datos
knn_recipe <- recipe(is_home_run ~ .,
                     data = baseball_train) %>%
  step_impute_mean(launch_angle,launch_speed) %>% 
  step_scale(all_numeric_predictors())

# Workflow
knn_wf <- workflow() %>% 
  add_model(knn_model) %>% 
  add_recipe(knn_recipe)

# Optimizacion de hiperparametros
knn_res <- knn_wf %>% 
  tune_grid(
    resamples = baseball_folds,
    grid = 10,
    metrics = metric_set(accuracy)
  )

# Visualizacion
autoplot(knn_res)

# Mejor hiperparametros
best <- knn_res %>% select_best(metric = "accuracy")

# Finalizacion del workflow
knn_wf <- knn_wf %>% finalize_workflow(best)

# Entrenamiento en train
knn_fit <- knn_wf %>% 
  fit(data = baseball_train)
  
# Prediccion en el conjunto de prueba
predicciones <- knn_fit %>% 
  predict(new_data = baseball_test) %>% 
  bind_cols(
    baseball_test %>% select(is_home_run)
  )

# Calculo del Accuracy en el conjunto de prueba
predicciones %>% 
  accuracy(truth = is_home_run,
           estimate = .pred_class)
