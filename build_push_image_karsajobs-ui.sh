#!/bin/bash

# set user github
GIT_USER="userjalil"

# build image karsajob-ui
docker build -t ghcr.io/$GIT_USER/karsajobs-ui:latest .

# login ke github registry
# password/token github sudah di export sebelum shell script di jalankan menggunakan variabel GIT_PASS
echo "$GIT_PASS" | ghcr login ghcr.io -u "$GIT_USER" --password-stdin

# push image karsajob-ui ke github registry
docker push ghcr.io/$GIT_USER/karsajobs-ui:latest

