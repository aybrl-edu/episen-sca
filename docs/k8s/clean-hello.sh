#!/usr/bin/env sh

kubectl delete -n default deployment hello-deployment
kubectl delete -n default ingress hello-ingress
kubectl delete -n default pod hello-pod
kubectl delete -n default replicaset hello-replicaset
kubectl delete -n default service hello-service
