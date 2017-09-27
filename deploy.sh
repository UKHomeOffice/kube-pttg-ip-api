#!/usr/bin/env bash

if [ $ENVIRONMENT == "prod" ]
then
    export KUBE_TOKEN=${PROD_KUBE_TOKEN}
fi

cd kd
kd --insecure-skip-tls-verify --retries=20 \
   --file service.yaml \
   --file deployment.yaml