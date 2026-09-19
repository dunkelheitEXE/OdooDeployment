#!/usr/bin/env bash
set -e

if [ ! -f .env ]; then
  echo "Falta el archivo .env. Crealo desde la plantilla: cp .env.bak .env"
  exit 1
fi

echo "Levantando entorno de desarrollo Odoo 17..."
docker compose up --build