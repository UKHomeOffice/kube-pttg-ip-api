#!/usr/bin/env bash
export KUBE_NAMESPACE=${KUBE_NAMESPACE}
export ENVIRONMENT=${ENVIRONMENT}
export APP=pttg-ip-api
export KUBE_SERVER=${KUBE_SERVER_DEV}

cd kd
pwd
ls
kd --insecure-skip-tls-verify \
   --file dev/pttg-ip-api-deployment.yaml \
   --file dev/pttg-ip-api-svc.yaml