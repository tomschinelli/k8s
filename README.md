# k8s


## Run minikube cluster 
```shell
minikube start --addons ingress --nodes 1

# set cloudflare token secret
# Note: This will be replaced by external-secrets later
kubectl apply -f - <<EOF
apiVersion: v1
kind: Namespace
metadata:
  name: cert-manager
---
apiVersion: v1
kind: Secret
metadata:
  name: cloudflare
  namespace: cert-manager
type: Opaque
stringData:
  token: "$CLOUDFLARE_TOKEN"
EOF
```

## Initialize Cluster
```shell
# ToDo: Fix issue application not finding CRD at the initial setup
kubectl apply -k argocd
kubectl apply -k .
```