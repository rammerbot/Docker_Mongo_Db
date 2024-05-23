#!/bin/bash

# Verificar si el directorio monguitodata ya existe
if [ ! -d "monguitodata" ]; then
    # Crear carpeta para volumen de mongo
    mkdir -p monguitodata/log
fi

# Cambiar al directorio del script
cd "$(dirname "$0")"

# Verificar si el archivo docker-compose.yml existe
if [ ! -f "docker-compose.yml" ]; then
    echo "Error: El archivo docker-compose.yml no existe en este directorio."
    exit 1
fi

# Iniciar el contenedor
sudo docker-compose up -d
