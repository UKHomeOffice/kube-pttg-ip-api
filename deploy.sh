#!/usr/bin/env bash
export KUBE_NAMESPACE=${KUBE_NAMESPACE}
export ENVIRONMENT=${ENVIRONMENT}
export APP=pttg-ip-api
export KUBE_SERVER=${KUBE_SERVER_DEV}
export KUBE_TOKEN=${KUBE_TOKEN}

cd kd
kd --insecure-skip-tls-verify \
   --file ${ENVIRONMENT}/pttg-ip-api-deployment.yaml \
   --file ${ENVIRONMENT}/pttg-ip-api-svc.yaml