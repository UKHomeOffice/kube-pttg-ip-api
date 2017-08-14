#!/usr/bin/env bash
export KUBE_NAMESPACE=pt-i-dev
export ENVIRONMENT=dev
export KUBE_SERVER=https://kube-dev.dsp.notprod.homeoffice.gov.uk
export KUBE_TOKEN=9f7b18cc-0e18-11e7-98cf-67e86f87fd2d

cd kd
kd --insecure-skip-tls-verify \
   --file deployment_db.yaml