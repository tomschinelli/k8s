#!/usr/bin/env bash
minikube start --addons ingress

kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.9.1/cert-manager.yaml