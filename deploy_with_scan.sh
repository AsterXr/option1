#!/bin/bash
set -eo pipefail


docker_image_name=${1}

eval $(minikube docker-env -p multinode-demo)

docker pull ${docker_image_name}
docker scan ${docker_image_name}

# For multi node minikube clusters:
# minikube addons enable registry -p multinode-demo
# docker run --rm -it --network=host alpine ash -c "apk add socat && socat TCP-LISTEN:5000,reuseaddr,fork TCP:$(minikube ip):5000"
# docker tag pbitty/hello-from localhost:5000/pbitty/hello-from
# docker push localhost:5000/pbitty/hello-from

cat templates/deployment.yaml.template | sed s.%%IMAGE_NAME%%.${docker_image_name}.g > deployment.yaml
kubectl apply -f .