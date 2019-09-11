# Various investigations related to containers

## setup

`minikube start --memory 4096 --cpus 4`



## Cache friendly docker image creation

`docker build -t lejeunen/container1:cache-friendly -f Dockerfile.cache-friendly .`

`docker run -p 9000:9000 lejeunen/container1:cache-friendly`


## Templating with Helm

### Deploy the image as latest

`docker build -t lejeunen/container1:latest -f Dockerfile.cache-friendly .`

`docker push lejeunen/container1:latest`

### Setup helm

`$ curl -LO https://git.io/get_helm.sh`
`$ chmod 700 get_helm.sh`
`$ ./get_helm.sh`

Use RBAC to grant access to Tiller

`kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
`
Then, finally

`helm init --service-account tiller  --upgrade`


### Install the chart

In system/container1/

`helm dependency update`

Then, in root directory

`helm install  --name container1 ./system/container1/ --set image.tag=latest,image.repository=lejeunen/container1`


Check pod status and logs

Proxy local port 9000 to POD port 9000

`kubectl port-forward container1-5f8bcc6c44-dmcvb 9000:9000`


## Deploy an updated image

We use the hash of the last git commit to tag the image, so that the new image is picked up by kubernetes.
This follows the best practice to avoid "floating tags" such as latest.

See container1/deploy-last-commit.sh

## Multi containers

Configure helm for containers 2 and 3

`helm install --name container3 ./system/container3/ --set image.tag=latest,image.repository=lejeunen/container3`

## Resource tuning

See system/container1/values.yaml and container1/Dockerfile


# Terraform

## cluster creation

Set variables in terraform/dev/variables.tf

`terraform init`

`terraform apply`

`terraform output kubeconfig > config`

`mv config ~/.kube/config`

Check cluster state with _kubectl cluster-info_ and _kubectl get nodes_


## Helm installation


# Misc

Install ps on slim container
`apt-get update && apt-get install procps`

View max heap using actuator
`http://localhost:9000/metrics/jvm.memory.max?tag=area:heap`