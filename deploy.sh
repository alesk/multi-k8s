# build images
docker build -t aleskotnik/multi-client:latest -t aleskotnik/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t aleskotnik/multi-server:latest -t aleskotnik/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t aleskotnik/multi-worker:latest -t aleskotnik/multi-worker:$SHA -f ./worker/Dockerfile ./worker

# push to docker hub
docker push aleskotnik/multi-client:latest
docker push aleskotnik/multi-client:$SHA
docker push aleskotnik/multi-server:latest
docker push aleskotnik/multi-server:$SHA
docker push aleskotnik/multi-worker:latest
docker push aleskotnik/multi-worker:$SHA

# k8s
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=aleskotnik/multi-client:$SHA
kubectl set image deployments/server-deployment server=aleskotnik/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=aleskotnik/multi-worker:$SHA

