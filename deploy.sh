#!/bin/bash

export KUBE_NAMESPACE=${KUBE_NAMESPACE}
export KUBE_SERVER=${KUBE_SERVER}
export DEPLOYMENT_NAME=${DEPLOYMENT_NAME:-pttg-ip-api}

if [[ -z ${VERSION} ]] ; then
    export VERSION=${IMAGE_VERSION}
fi

echo "deploy version: ${VERSION} of: ${DEPLOYMENT_NAME} to:${ENVIRONMENT} namespace - using Kube token stored as drone secret"

if [[ ${ENVIRONMENT} == "pr" ]] ; then
    export KUBE_TOKEN=${PTTG_IP_PR}
else
    export KUBE_TOKEN=${PTTG_IP_DEV}
fi

cd kd || exit

kd --insecure-skip-tls-verify \
    -f ingress-certificate.yaml \
    -f audit-archive-cronjob.yaml \
    -f networkPolicy.yaml \
    -f deployment.yaml \
    -f service.yaml
