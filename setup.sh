#!/bin/bash

echo "🧱 Preparando entorno..."
rm -rf site
mkdir site && cd site
wget https://github.com/AgustinMillan/Portafolio/archive/refs/heads/dist.zip -O dist.zip
unzip -o dist.zip
mv Portafolio-dist/* . && rm -rf Portafolio-dist dist.zip
cd ..

echo "🛠️ Construyendo imagen..."
docker build -t nginx-bootstrap .

echo "🏃 Ejecutando contenedor..."
docker run -d -p 8002:8002 nginx-bootstrap

echo "🔍 Verificá el contenedor corriendo con:"
echo "docker ps --filter ancestor=nginx-bootstrap"

echo "📋 Ver logs del contenedor con:"
echo "docker logs $(docker ps -q --filter ancestor=nginx-bootstrap)"
