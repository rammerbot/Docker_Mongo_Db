# CREAR CONTENEDOR DE MONGO Y SUBIRLO A DOCKERHUB
_____________________________________________
## Paso 1. Crear un documento de docker-compose.

### Opción 1 windows o mac.

> Usar docker compose, visual estudio code, instalando la extensión de docker.

### Opción 2 en linux.
#### crear archivo

```
touch docker-compose.yml
```
___________________________________________________________________________
## Paso 2. Editar el archivo docker-compose.yml y colocar el siguiente script:

## Editar archivo

```
nano docker-compose.yml
```

```
version: '2.2'
services:
  frontend:
    image: mongo:4.0.4
    restart: always
    ports:
      - "27017:27017"
    container_name: monguito
    environment:
      - MONGODB_USER='user'
      - MONGODB_PASS='pass'
    volumes:
      - monguitodata:/data/db
      - monguitologs:/var/log/mongodb/

volumes:
  monguitodata:
  monguitologs:
```
    
____________________________
## paso 3. Crear el Ejecutable:

```
touch mongo.sh
```

____________________________________________________
## Paso 4. copiar los comando en el archivo ejecutable:

### entrar y editar el archivo con los siguientes comandos:
```
nano mongo.sh
```   	

```
!/bin/bash

#Verificar si el directorio monguitodata ya existe
if [ ! -d "monguitodata" ]; then
    # Crear carpeta para volumen de mongo
    mkdir -p monguitodata/log
fi

#Cambiar al directorio del script
cd "$(dirname "$0")"

#Verificar si el archivo docker-compose.yml existe
if [ ! -f "docker-compose.yml" ]; then
    echo "Error: El archivo docker-compose.yml no existe en este directorio."
    exit 1
fi

#Iniciar el contenedor
sudo docker-compose up -d
```

_________________________________________________________
## Paso 6. Asignar permisos de ejecución y ejecutar mongo.sh.

```
chmod u+x mongo.sh
```

____________________________________________________________________
## Paso 7. Crear contenedor de mongo con el archivo docker-compose.yml. 

```
sudo docker-compose up -d
```

__________________________________________________________________________________________________________________________
## Paso 8. Crear directorios si no existen para el volumen, levantar y entrar en el contenedor usando el ejecutable mongo.sh.

### usar cualquiera de estos dos comandos para ejecutar el archivo.

```
./mongo.sh
```

#### or

```
source mongo.sh
```

________________________
## Paso 9. login en docker.

```
docker login  #ingresar tus credenciales
```

__________________________
## Paso 10. Crear Dockerfile.

```
touch Dockerfile
```
```
nano Dockerfile
```

### escribir el script para crear la imagen basado en los archivos del contenedor

```
#Usa una imagen base oficial de MongoDB
FROM mongo:latest

#Copia el script mongo.sh en el contenedor
COPY mongo.sh /docker-entrypoint-initdb.d/

#Da permisos de ejecución al script
RUN chmod +x /docker-entrypoint-initdb.d/mongo.sh

#Comando por defecto para iniciar MongoDB
CMD ["mongod"]
```
____________________________________________
## Paso 11. Crear imagen en base al contenedor.

### reemplazar TU_USUARIO_DE_DOCKER por el usuario de duckerhub

```
docker build -t TU_USUARIO_DE_DOCKER/mongo_tarea:tarea_henry . 
```

____________________________________________________
## Paso 12. Cargar imagen al repositorio de docker hub.

### reemplazar TU_USUARIO_DE_DOCKER por el usuario de duckerhub

```
docker push TU_USUARIO_DE_DOCKER/mongo_tarea:tarea_henry
```
_____________________________
## Elaborado por:

### Rammer Gomez: RammerBot

### GitHub:

```
https://github.com/rammerbot
```
### LinkDin
```
https://www.linkedin.com/in/rammer-gomez/
```
