FROM quay.io/stefancocora/kb8or:kube_1.3.0
# FROM quay.io/ukhomeofficedigital/kb8or:v1.0.0
WORKDIR /var/lib/app_deploy
ADD ./ ./
ENTRYPOINT ["./scripts/deploy"]
