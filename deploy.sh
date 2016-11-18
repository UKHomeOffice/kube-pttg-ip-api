#!/usr/bin/env bash
export KUBE_NAMESPACE=${KUBE_NAMESPACE:-${DRONE_DEPLOY_TO}}
export ENVIRONMENT=${ENVIRONMENT:-dev}
export APP=${APP:-pttg-ip-api}
export KUBE_SERVER=${KUBE_SERVER_DEV}

cd kd
kd --insecure-skip-tls-verify \
   --file ${ENVIRONMENT}/${APP}-deployment.yaml \
   --file ${ENVIRONMENT}/${APP}-svc.yaml
