# Usa una imagen base oficial de MongoDB
FROM mongo:latest

# Copia el script mongo.sh en el contenedor
COPY mongo.sh /docker-entrypoint-initdb.d/

# Da permisos de ejecución al script
RUN chmod +x /docker-entrypoint-initdb.d/mongo.sh

# Comando por defecto para iniciar MongoDB
CMD ["mongod"]
