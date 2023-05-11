#!/bin/bash

# Comprobar si el usuario tiene permisos de administrador
if [ $(id -u) -ne 0 ]; then
  echo "Este script requiere permisos de administrador."
  exit 1
fi

# Comprobar si el script principal existe y es ejecutable
script="dafs"
if [ ! -f "$script" ] || [ ! -x "$script" ]; then
  echo "El script principal $script no existe o no es ejecutable."
  exit 2
fi

# Copiar el script principal a /usr/local/bin
cp "$script" /usr/local/bin
if [ $? -eq 0 ]; then
  echo "El script $script se ha copiado a /usr/local/bin"
else
  echo "Ha ocurrido un error al copiar el script $script a /usr/local/bin"
  exit 3
fi

# Instalar las dependencias necesarias
echo "Instalando las dependencias necesarias..."
apt-get update
apt-get install pulseaudio

# Mostrar un mensaje de éxito
echo "El script $script se ha instalado correctamente."