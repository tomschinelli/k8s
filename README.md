# k8s

## Features
- ArgoCD
- cert-manager
- external secret
- example application

## Run minikube cluster 

```shell
minikube start --addons ingress --nodes 1

# set cloudflare token secret
# Note: This is the only secret needed. All other secretes are issued by external-secrets
kubectl apply -f - <<EOF
apiVersion: v1
kind: Namespace
metadata:
  name: external-secrets
---
apiVersion: v1
kind: Secret
metadata:
  name: aws-credentials
  namespace: external-secrets
type: Opaque
stringData:
  aws_access_key_id: "$AWS_ACCESS_KEY_ID"
  aws_secret_access_key: "$AWS_SECRET_ACCESS_KEY"
EOF
```

## Initialize Cluster
```shell
# ToDo: Fix issue application not finding CRD at the initial setup
kubectl apply -k argocd
kubectl apply -k .
```