FROM quay.io/ukhomeofficedigital/kb8or:v1.0.0
WORKDIR /var/lib/app_deploy
ADD ./ ./
ENTRYPOINT ["./scripts/deploy"]
