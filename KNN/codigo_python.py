#---------------------- Librerias y Datos ----------------------#

# Librerias
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier
from sklearn.model_selection import GridSearchCV
from sklearn.impute import SimpleImputer
from sklearn.preprocessing import StandardScaler
from sklearn.pipeline import Pipeline

# Datos
baseball = pd.read_csv("train.csv")
baseball = baseball[["plate_x",
                     "plate_z",
                     "launch_angle",
                     "launch_speed",
                     "is_home_run"]]

#---------------------- Separacion inicial ----------------------#

# Separar  la variable objetivo
X = baseball.drop(columns='is_home_run')
y = baseball['is_home_run'].values

# Separar en entrenamiento y prueba
X_train,X_test,y_train,y_test = train_test_split(X,y,
                                                 test_size = 0.2,
                                                 random_state = 2352,
                                                 stratify = y)

#---------------------- Modelacion ----------------------#

# Definicion del modelo
knn_model = KNeighborsClassifier(n_neighbors = 10,
                                 weights = 'uniform',
                                 p = 1)

# Preprocesamiento
scaler = StandardScaler()
imputer = SimpleImputer(strategy = "mean")

# Pipeline
pipe = Pipeline(steps = [
    ("Imputacion", imputer),
    ("Scaler", scaler),
    ("knn",knn_model)    
    ])

# Entrenamiento
pipe.fit(X_train,y_train)

# Prediccion en test
pipe.predict(X_test)

# Accuracy en test
pipe.score(X_test,y_test)

#----------- Optimizacion de hiperparametros -----------#

# Modelo
knn = KNeighborsClassifier()

# Pipeline
pipe = Pipeline(steps = [
    ("Imputacion", imputer),
    ("Scaler", scaler),
    ("knn",knn)    
    ])

# Espacio a buscar
param_grid = {"knn__n_neighbors": np.arange(1,15),
              "knn__weights": ["uniform","distance"],
              "knn__p": [1,2]}

# Optimizacion
knn_search = GridSearchCV(pipe,
             param_grid,
             cv = 5)

knn_search.fit(X_train,y_train)

#  Resultados
knn_search.best_score_
knn_search.best_params_























