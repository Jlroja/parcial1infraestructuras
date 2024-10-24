#!/usr/bin/env bash
#
# Este script se encarga de invocar los tres programas que permiten la 
# conversion de un PNG a secuencia de pixeles, se procesan esos pixeles y
# posteriormente se convierte esa secuencia de pixeles a un archivo en formato
# PNG


for INPUT_PNG in img*.jpg; do
    TEMP_FILE="${INPUT_PNG%.jpg}.bin"  
    echo "Procesando ${INPUT_PNG}..."
    
    python3 fromPNG2Bin.py "${INPUT_PNG}"
    ./main "${TEMP_FILE}"
    python3 fromBin2PNG.py "${TEMP_FILE}.new"
    
done