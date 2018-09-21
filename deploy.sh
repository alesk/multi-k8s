#!/bin/sh

# build images
docker build -t aleskotnik/multi-client -f ./client/Dockerfile ./client
docker build -t aleskotnik/multi-server -f ./server/Dockerfile ./server
docker build -t aleskotnik/multi-worker -f ./worker/Dockerfile ./worker

# push to docker hub
docekr push aleskotnik/multi-client
docekr push aleskotnik/multi-server
docekr push aleskotnik/multi-worker

# k8s
kubectl apply -f k8s
kubectl set image deployments/client-deployment server=aleskotnik/multi-client

