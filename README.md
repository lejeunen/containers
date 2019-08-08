# Various investigations related to containers

## setup

`minikube start --memory 4096`



## Cache friendly docker image creation

`docker build -t lejeunen/container:cache-friendly -f Dockerfile.cache-friendly .`

`docker run -p 9000:9000 lejeunen/container:cache-friendly`


## Templating with Helm

### Deploy the image as latest

`docker build -t lejeunen/container:latest -f Dockerfile.cache-friendly .`

`docker push lejeunen/container:latest`

### Setup helm

`$ curl -LO https://git.io/get_helm.sh
$ chmod 700 get_helm.sh
$ ./get_helm.sh`

Use RBAC to grant access to Tiller

`kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
`
Then, finally

`helm init --service-account tiller  --upgrade`


### Install the chart

`helm install --name container ./service-chart/`


Check pod status and logs

Proxy local port 9000 to POD port 9000

`kubectl port-forward container-service-chart-5f8bcc6c44-dmcvb 9000:9000`




