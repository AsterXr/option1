#!/bin/bash
set -eo pipefail


docker_image_name=${1}

eval $(minikube docker-env -p multinode-demo)

docker pull ${docker_image_name}

kubectl apply -f .
cat templates/deployment.yaml.template | sed s.%%IMAGE_NAME%%.${docker_image_name}.g > deployment.yaml
kubectl apply -f .