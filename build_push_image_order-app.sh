#!/bin/bash

# set user github
GIT_USER="userjalil"

# build image order-app
docker build -t ghcr.io/$GIT_USER/order-app:latest .

# login ke github registry
# password/token github sudah di export sebelumnya dengan variabel GIT_PASS
echo "$GIT_PASS" | docker login ghcr.io -u "$GIT_USER" --password-stdin

# push image order-app ke github registry
docker push ghcr.io/$GIT_USER/order-app:latest
