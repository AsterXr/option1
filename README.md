# kubernetes deployment, svc, hpa, pdb service account

This repository contains an example code for creating a kubernetes deployment with the following features:

* deployment
* svc
* hpa
* pdb 
* service account
* secret
* docker scan image

This has been run on a minikube demo cluster.
Running `deploy_with_scan.sh` will stop execution, as the provided image contains vulnerabilities.

`minikube service list -p multinode-demo`

Application will be available at $(minikube ip):30003

## How to run

Prepreqs:
* minikube installed
* docker installed and running

```
minikube start --nodes 1 -p multinode-demo --driver=virtualbox --memory 5120 --cpus=4

sh deploy.sh 'pbitty/hello-from:latest'
```