#!/usr/bin/env bash

# creating the namespace
kubectl create namespace adminer-imp
kubectl config set-context --current --namespace adminer-imp

# database
# deployment
kubectl create deployment mariadb --image mariadb --replicas 2
kubectl set env deployment mariadb MARIADB_ROOT_PASSWORD=secret

# service
kubectl expose deployment mariadb --name db --port 3306

# adminer
# deployment
kubectl create deployment adminer --image adminer

# service
kubectl expose deployment adminer --name adminer-cl --port 8000 --target-port 8080
kubectl expose deployment adminer --name adminer-np --port 8080 --type NodePort

