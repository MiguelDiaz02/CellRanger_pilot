#!/bin/bash

# Directorio de destino relativo
DEST_DIR="./"

# URL del genoma de referencia
REFERENCE_URL="https://cf.10xgenomics.com/supp/cell-exp/refdata-gex-GRCh38_and_GRCm39-2024-A.tar.gz"

# Nombre del archivo a descargar
REFERENCE_FILE=$(basename "$REFERENCE_URL")

# Descargar el genoma de referencia
echo "Descargando el genoma de referencia..."
curl -O "$REFERENCE_URL"

# Descomprimir el archivo tar.gz
echo "Descomprimiendo el archivo..."
tar -xzf "$REFERENCE_FILE" -C "$DEST_DIR"

# Eliminar el archivo tar.gz original
echo "Eliminando el archivo tar.gz original..."
rm "$REFERENCE_FILE"

echo "¡El genoma de referencia ha sido descargado, descomprimido y el archivo tar.gz ha sido eliminado en el directorio actual!"

