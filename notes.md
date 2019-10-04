# Other notes, for reference


## minikube startup (pre eks)

`minikube start --memory 4096 --cpus 4`

## Manual helm setup (pre terraform)

`$ curl -LO https://git.io/get_helm.sh`
`$ chmod 700 get_helm.sh`
`$ ./get_helm.sh`

Use RBAC to grant access to Tiller

`kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
`
Then, finally

`helm init --service-account tiller  --upgrade`

## Manual chart installation (pre terraform, pre chart repository)

In helm/container1/

`helm dependency update`

Then, in root directory

`helm install  --name container1 ./helm/container1/ --set image.tag=latest,image.repository=lejeunen/container1`


Check pod status and logs

Proxy local port 9000 to POD port 9000

`kubectl port-forward container1-5f8bcc6c44-dmcvb 9000:9000`

## Deploy an updated image

We use the hash of the last git commit to tag the image, so that the new image is picked up by kubernetes.
This follows the best practice to avoid "floating tags" such as latest.

See container1/deploy-last-commit.sh

