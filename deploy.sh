#!/usr/bin/env bash
export KUBE_NAMESPACE=${KUBE_NAMESPACE}
export ENVIRONMENT=${ENVIRONMENT}
export APP=pttg-ip-api
export KUBE_SERVER=${KUBE_SERVER_DEV}

cd kd
kd --debug --insecure-skip-tls-verify \
   --file ${ENVIRONMENT}/${APP}-deployment.yaml \
   --file ${ENVIRONMENT}/${APP}-svc.yaml
