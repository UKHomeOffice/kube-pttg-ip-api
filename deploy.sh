#!/bin/bash

export KUBE_NAMESPACE=${KUBE_NAMESPACE}
export KUBE_SERVER=${KUBE_SERVER}
export DEPLOYMENT_NAME=${DEPLOYMENT_NAME:-pttg-ip-api}

if [[ -z ${IMAGE_VERSION} ]] ; then
    echo "promoting the image built in the promoted job"
    export VERSION=build-${DRONE_BUILD_PARENT}
else
    echo "promoting the image specified in the 'drone build promote' command"
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
    -f pod-to-pod-server-certificate.yaml \
    -f audit-archive-cronjob.yaml \
    -f networkPolicy.yaml \
    -f deployment.yaml \
    -f service.yaml

if [[ ${ENVIRONMENT} == "dev" ]] ; then
    kd --insecure-skip-tls-verify \
        -f namespace-cleardown-cronjob.yaml
fi
