#!/bin/bash

GIT_USER="userjalil"

# Membuat Docker image dari Dockerfile
docker build -t item-app:v1 .

# Melihat daftar image di lokal
docker images

# Mengubah nama image sesuai dengan format GitHub Packages
docker tag item-app:v1 ghcr.io/$GIT_USER/item-app:v1

# Login ke GitHub Packages
echo "$GIT_PASS" | ghcr login ghcr.io -u "$GIT_USER" --password-stdin

# Mengunggah image ke GitHub Packages
docker push ghcr.io/$GIT_USER/item-app:v1
