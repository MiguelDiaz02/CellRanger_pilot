#!/bin/bash

# URL del genoma de referencia
REFERENCE_URL="https://cf.10xgenomics.com/supp/cell-exp/refdata-gex-GRCh38-2024-A.tar.gz"

# Nombre del archivo a descargar
REFERENCE_FILE=$(basename "$REFERENCE_URL")

# Directorio actual (ruta relativa)
DEST_DIR="."

# Descargar el genoma de referencia
echo "Descargando el genoma de referencia..."
curl -O "$REFERENCE_URL"

# Verificar si la descarga fue exitosa
if [[ ! -f "$REFERENCE_FILE" ]]; then
    echo "Error: No se pudo descargar el archivo."
    exit 1
fi

# Descomprimir el archivo tar.gz
echo "Descomprimiendo el archivo..."
tar -xzf "$REFERENCE_FILE"

# Verificar si la extracción fue exitosa
if [[ $? -ne 0 ]]; then
    echo "Error al descomprimir el archivo."
    exit 1
fi

# Eliminar el archivo tar.gz original
echo "Eliminando el archivo tar.gz original..."
rm "$REFERENCE_FILE"

echo "¡El genoma de referencia ha sido descargado y descomprimido correctamente!"
