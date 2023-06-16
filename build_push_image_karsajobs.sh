#!/bin/bash

# set user github
GIT_USER="userjalil"

# build image karsajobs
docker build -t ghcr.io/$GIT_USER/karsajobs:latest .

# login ke github registry
# password/token github sudah di export sebelumnya dengan variabel GIT_PASS
echo "$GIT_PASS" | ghcr login ghcr.io -u "$GIT_USER" --password-stdin

# push image karsajobs ke github registry
docker push ghcr.io/$GIT_USER/karsajobs:latest

