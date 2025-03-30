#!/bin/bash

# Directorio base y directorio samples
BASE_DIR=$(dirname "$0")
SAMPLES_DIR="$BASE_DIR/samples"

# URLs de descarga
PRE_TRANSPLANT_URL="https://cf.10xgenomics.com/samples/cell-exp/1.1.0/aml035_pre_transplant/aml035_pre_transplant_fastqs.tar"
POST_TRANSPLANT_URL="https://cf.10xgenomics.com/samples/cell-exp/1.1.0/aml035_post_transplant/aml035_post_transplant_fastqs.tar"

# Función para procesar una muestra
process_sample() {
  local url="$1"
  local sample_name="$2"
  local tar_file=$(basename "$url")

  # Descargar el archivo tar
  echo "Descargando $tar_file..."
  curl -O "$url"

  # Descomprimir el archivo tar en el directorio samples
  echo "Descomprimiendo $tar_file en $SAMPLES_DIR..."
  mkdir -p "$SAMPLES_DIR"
  tar -xf "$tar_file" -C "$SAMPLES_DIR"

  # Renombrar el directorio flowcell1 al nombre de la muestra
  echo "Renombrando flowcell1 a $sample_name..."
  mv "$SAMPLES_DIR/fastqs/flowcell1" "$SAMPLES_DIR/$sample_name"

  # Limpiar archivos temporales
  echo "Limpiando archivos temporales..."
  rm "$tar_file"
  rm -rf "$SAMPLES_DIR/fastqs"

  echo "Procesamiento de $sample_name completado."
}

# Procesar la muestra de pre-transplante
process_sample "$PRE_TRANSPLANT_URL" "AML_pre_transplant"

# Procesar la muestra de post-transplante
process_sample "$POST_TRANSPLANT_URL" "AML_post_transplant"

echo "¡Todas las muestras han sido procesadas!"

