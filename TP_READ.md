K8S for Deployment

I took the excistinh NodeJs application and tried to deploy it using K8S 

## Kubernetes (K8s)
    
### Manifest YML
```bash
# sca-tp-deployment
apiVersion: apps/v1
kind: Deployment
metadata:
  name: sca-tp
spec:
  replicas: 1
  selector:
    matchLabels:
      app: sca-tp
  template:
    metadata:
      labels:
        app: sca-tp
    spec:
      containers:
      - name: sca-tp
        image: sca-tp
        ports:
        - containerPort: 1337 

---
apiVersion: v1
kind: Service
metadata:
  name: sca-tp-service
spec:
  selector:
    app: sca-tp
  ports:
    - protocol: TCP
      port: 8081
      targetPort: 1337 

# Déploiement de Redis
apiVersion: apps/v1
kind: Deployment
metadata:
  name: redis
spec:
  replicas: 1
  selector:
    matchLabels:
      app: redis
  template:
    metadata:
      labels:
        app: redis
    spec:
      containers:
      - name: redis
        image: redis:latest
        ports:
        - containerPort: 6379

# Service pour Redis
apiVersion: v1
kind: Service
metadata:
  name: redis-service
spec:
  selector:
    app: redis
  ports:
    - protocol: TCP
      port: 6379
      targetPort: 6379

```
### Ingress Manifest YML
```
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: api-ingress
spec:
  rules:
    - host: localhost
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: api-service
                port:
                  number: 80

```

### Commands
1. Deployments
```bash
kubectl get deployments
```
2. Our PODS
```bash
kubectl get pods
```
3. Describe a pod
```bash
kubectl describe <pod_name>
```
4. The Ingress
```bash
kubectl get ingress
```
