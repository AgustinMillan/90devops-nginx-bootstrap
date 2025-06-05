#!/bin/bash

echo "🧱 Preparando entorno..."
mkdir -p site && cd site
wget https://github.com/AgustinMillan/Portafolio/archive/refs/heads/dist.zip
unzip dist.zip
mv Portafolio-dist/* .
cd ..

echo "🛠️ Construyendo imagen..."
docker build -t nginx-bootstrap .

echo "🏃 Ejecutando contenedor..."
docker run -d -p 8002 nginx-bootstrap

echo ""
echo "✅ Abrí la vista previa del puerto 8080 en Google Cloud Shell (icono de cuadrado con flecha)."
echo ""

echo "🔍 Verificá el contenedor corriendo con:"
echo "docker ps --filter ancestor=nginx-bootstrap"

echo "📋 Ver logs del contenedor con:"
echo "docker logs $(docker ps -q --filter ancestor=nginx-bootstrap)"



