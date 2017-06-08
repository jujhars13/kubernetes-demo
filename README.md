# kubernetes-demo
Kubernetes wow demo

## Todo

- [x] setup basic project
- [] create GCP project
- [] create node container and push to docker hub
- [] create pod spec
- [] create vegita container and pod spec
- [] create kubernetes cluster yaml
- [] push application pod
- [] push vegita pod
- [] hit application
- [] scale application up to handle load
- [] tear down kubernetes cluster


## Demo

### Watch pods
`kubectl get pods -w`

### Scaling up
`kubectl apply -f kubernetes/pod.yml`

### Scaling Down
`kubectl apply -f kubernetes/pod.yml`

### Updating to new version
`kubectl rolling-update tech-conf-2017 --image eu.gcr.io/tech-conf-2017/super-duper-app:3`

### Rolling Back

`kubectl rolling-update tech-conf-2017 --rollback`