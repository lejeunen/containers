# Various investigations related to containers

This is a sample project to evaluate different option to deploy a modular application to AWS EKS.

Related projects are
- https://github.com/lejeunen/containers-infrastructure-charts  
- https://github.com/lejeunen/containers-infrastructure-modules  
- https://github.com/lejeunen/containers-infrastructure-environments  






# Misc notes

Install ps on slim container
`apt-get update && apt-get install procps`

View max heap using actuator
`http://localhost:9000/metrics/jvm.memory.max?tag=area:heap`

_Ghost_ Terraform resources
`terraform state rm module.application.helm_release.container1`

Reinstall stable helm repo
`helm repo add stable https://kubernetes-charts.storage.googleapis.com/`

Error locking state: Error acquiring the state lock
`terragrunt force-unlock 0d73dd3d-6207-7e93-2a2d-3c8e4dece4ab`

Force refresh of terragrunt cache (slow)
`terragrunt apply --terragrunt-source-update`

Weird _"Duplicate backend configuration"_ when working with nested modules and --terragrunt-source
`I committed and pushed my module definition and removed the --terragrunt-source`

Force usage of updated charts (should not happen if chart immutability is respected)
`helm repo update`

Bash into pod of namespace
`kubectl exec  module1-container1-d69b4b7cb-zcvtw  -n emasphere -it -- bash`

Debug DNS from pod

```
apt-get update
apt-get install busybox
busybox nslookup module2-container2.emasphere.svc.cluster.local
```

