#!/bin/bash

GIT_USER="userjalil"

docker build -t ghcr.io/$GIT_USER/karsajobs-ui:latest .

echo "$GIT_PASS" | ghcr login ghcr.io -u "$GIT_USER" --password-stdin

docker push ghcr.io/$GIT_USER/karsajobs-ui:latest

