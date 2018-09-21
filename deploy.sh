#!/bin/sh

# build images
docker build -t aleskotnik/multi-client:latest -t aleskotnik/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t aleskotnik/multi-server:latest -t aleskotnik/multi-client:$SHA -f ./server/Dockerfile ./server
docker build -t aleskotnik/multi-worker:latest -t aleskotnik/multi-client:$SHA -f ./worker/Dockerfile ./worker

# push to docker hub
docekr push aleskotnik/multi-client:latest
docekr push aleskotnik/multi-client:$SHA
docekr push aleskotnik/multi-server:latest
docekr push aleskotnik/multi-server:$SHA
docekr push aleskotnik/multi-worker:latest
docekr push aleskotnik/multi-worker:$SHA

# k8s
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=aleskotnik/multi-client:$SHA
kubectl set image deployments/server-deployment server=aleskotnik/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=aleskotnik/multi-worker:$SHA

