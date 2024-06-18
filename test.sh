#!/bin/bash

mkdir -p wheels

urls=$(curl -s https://api.github.com/repos/76assignments/testdocker/releases/latest | grep browser_download_url | cut -d '"' -f 4)

for url in $urls
do
    if [[ "$url" == *".whl" ]]; then
        file_name=$(basename "$url")
        echo "Downloading $file_name..."
        curl -o "wheels/$file_name" "$url"
    fi
done